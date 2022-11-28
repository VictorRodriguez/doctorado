from sklearn.metrics.cluster import adjusted_rand_score
from sklearn.metrics.cluster import normalized_mutual_info_score
from sklearn.metrics.cluster import fowlkes_mallows_score

import pandas as pd
import math
from collections import Counter

def scores(labels_true,labels_pred):

    rand_score_result = adjusted_rand_score(labels_true, labels_pred)
    print(f"\nadjusted_rand_score {rand_score_result}")

    mutual_info_score_result = normalized_mutual_info_score(labels_true, labels_pred)
    print(f"\nnormalized_mutual_info_score {mutual_info_score_result}")

    fowlkes_mallows_score_result = fowlkes_mallows_score(labels_true, labels_pred)
    print(f"\nfowlkes_mallows_score {fowlkes_mallows_score_result}")

    return rand_score_result,mutual_info_score_result,fowlkes_mallows_score_result

def counter_cosine_similarity(c1, c2):
    terms = set(c1).union(c2)
    dotprod = sum(c1.get(k, 0) * c2.get(k, 0) for k in terms)
    magA = math.sqrt(sum(c1.get(k, 0)**2 for k in terms))
    magB = math.sqrt(sum(c2.get(k, 0)**2 for k in terms))
    return dotprod / (magA * magB)

def main():
	df = pd.read_csv("references/clusters_spec2017.csv")
	df_sorted = df.sort_values(by='REAL')
	fp_tests = df_sorted[df_sorted['REAL'] == 0]
	int_tests = df_sorted[df_sorted['REAL'] == 1]
	print(fp_tests)
	print(int_tests)


	df = pd.read_csv("clusters.csv")
	df_sorted = df.sort_values(by='PRED')
	A = df_sorted[df_sorted['PRED'] == 0]
	B = df_sorted[df_sorted['PRED'] == 1]
	print(A)
	print(B)


	print("A = PRED -> 0")
	counterA = Counter(fp_tests['test_name'].tolist())
	counterB = Counter(A['test_name'].tolist())
	cosine_similarity_fp = counter_cosine_similarity(counterA, counterB)
	print(f"cosine_similarity vs fp_tests {cosine_similarity_fp}")

	counterA = Counter(int_tests['test_name'].tolist())
	counterB = Counter(A['test_name'].tolist())
	cosine_similarity_int = counter_cosine_similarity(counterA, counterB)
	print(f"cosine_similarity vs int_tests {cosine_similarity_int}")

	print(A)
	if (cosine_similarity_fp > cosine_similarity_int):
		A = A.assign(PRED='0')
	else:
		A = A.assign(PRED='1')
	print(A)


	print("B = PRED -> 1")
	counterA = Counter(fp_tests['test_name'].tolist())
	counterB = Counter(B['test_name'].tolist())
	cosine_similarity_fp = counter_cosine_similarity(counterA, counterB)
	print(f"cosine_similarity vs fp_tests {cosine_similarity_fp}")

	counterA = Counter(int_tests['test_name'].tolist())
	counterB = Counter(B['test_name'].tolist())
	cosine_similarity_int = counter_cosine_similarity(counterA, counterB)
	print(f"cosine_similarity vs int_tests {cosine_similarity_int}")

	print(B)
	if (cosine_similarity_fp > cosine_similarity_int):
		B = B.assign(PRED='0')
	else:
		B = B.assign(PRED='1')
	print(B)

	C = pd.concat([A, B])
	print(C)


	C_sorted =  C.sort_values(by='test_name', ascending=False)
	print(C_sorted)

	REAL = pd.read_csv("references/clusters_spec2017.csv")
	REAL_sorted = REAL.sort_values(by='test_name', ascending=False)
	print(REAL_sorted)

	labels_pred = C_sorted["PRED"].tolist()
	labels_pred_ = [eval(i) for i in labels_pred]
	labels_pred = labels_pred_

	labels_true = REAL_sorted["REAL"].tolist()

	print(labels_pred)
	print(labels_true)

	scores(labels_true,labels_pred)

	"""
	exit()

	labels_true = df_sorted["REAL"].tolist()

    df = pd.read_csv("clusters.csv")
    df_sorted = df.sort_values(by='test_name', ascending=False)
    labels_pred = df_sorted["PRED"].tolist()


    df = pd.DataFrame(list(zip(labels_true, labels_pred, df_sorted["test_name"].tolist())),
                      columns=['labels_true', 'labels_pred', 'test_name'])

    print(df)

    scores(labels_true,labels_pred)
	"""

if __name__ == "__main__":
     main()


