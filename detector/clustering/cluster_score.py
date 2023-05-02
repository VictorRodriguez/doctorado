from sklearn.metrics.cluster import adjusted_rand_score
from sklearn.metrics.cluster import normalized_mutual_info_score
from sklearn.metrics.cluster import fowlkes_mallows_score
from scipy.spatial import distance

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

    hamming_distance = distance.hamming(labels_true, labels_pred)
    print(f"\nhamming_distance {hamming_distance}")

    return rand_score_result, \
        mutual_info_score_result,\
        fowlkes_mallows_score_result,\
        hamming_distance

def counter_cosine_similarity(c1, c2):
    terms = set(c1).union(c2)
    dotprod = sum(c1.get(k, 0) * c2.get(k, 0) for k in terms)
    magA = math.sqrt(sum(c1.get(k, 0)**2 for k in terms))
    magB = math.sqrt(sum(c2.get(k, 0)**2 for k in terms))
    return dotprod / (magA * magB)

def check_similarity(cosine_similarity_fp,cosine_similarity_int,df,cluster_label):

    if (cosine_similarity_fp > cosine_similarity_int):
        print("cosine_similarity_fp > cosine_similarity_int")
        print("Assigining 0 label to pred cluster")
        df = df.assign(PRED='0')
    else:
        print("cosine_similarity_int > cosine_similarity_fp")
        print("Assigining 1 label to pred cluster")
        df = df.assign(PRED='1')

    cosine_similarity = [cosine_similarity_fp,cosine_similarity_int]
    index = ['cosine_similarity vs fp tests ', 'cosine_similarity vs int tests']
    df_ = pd.DataFrame({'cosine similarity ': cosine_similarity}, index=index)
    ax = df_.plot.bar(rot=0,title = f"cosine_similarity {cluster_label}")

    return df

def normalize(A, B, fp_tests, int_tests):

    print("\nA = PRED -> 0")
    counterA = Counter(fp_tests['test_name'].tolist())
    counterB = Counter(A['test_name'].tolist())
    cosine_similarity_fp = counter_cosine_similarity(counterA, counterB)
    print(f"cosine_similarity vs fp_tests {cosine_similarity_fp}")

    counterA = Counter(int_tests['test_name'].tolist())
    counterB = Counter(A['test_name'].tolist())
    cosine_similarity_int = counter_cosine_similarity(counterA, counterB)
    print(f"cosine_similarity vs int_tests {cosine_similarity_int}")
    A = check_similarity(cosine_similarity_fp,cosine_similarity_int, A, "cluster 1")

    print("\nB = PRED -> 1")
    counterA = Counter(fp_tests['test_name'].tolist())
    counterB = Counter(B['test_name'].tolist())
    cosine_similarity_fp = counter_cosine_similarity(counterA, counterB)
    print(f"cosine_similarity vs fp_tests {cosine_similarity_fp}")

    counterA = Counter(int_tests['test_name'].tolist())
    counterB = Counter(B['test_name'].tolist())
    cosine_similarity_int = counter_cosine_similarity(counterA, counterB)
    print(f"cosine_similarity vs int_tests {cosine_similarity_int}")

    B = check_similarity(cosine_similarity_fp,cosine_similarity_int,B, "cluster 2")

    C = pd.concat([A, B])

    return C

def main():
    df = pd.read_csv("references/clusters_spec2017.csv")
    df_sorted = df.sort_values(by='REAL')
    fp_tests = df_sorted[df_sorted['REAL'] == 0]
    int_tests = df_sorted[df_sorted['REAL'] == 1]

    df = pd.read_csv("clusters.csv")
    df_sorted = df.sort_values(by='PRED')
    A = df_sorted[df_sorted['PRED'] == 0]
    B = df_sorted[df_sorted['PRED'] == 1]

    C = normalize(A,B,fp_tests,int_tests)

    C_sorted =  C.sort_values(by='test_name', ascending=False)

    REAL = pd.read_csv("references/clusters_spec2017.csv")
    REAL_sorted = REAL.sort_values(by='test_name', ascending=False)

    labels_pred = C_sorted["PRED"].tolist()
    labels_pred_ = [eval(i) for i in labels_pred]
    labels_pred = labels_pred_

    labels_true = REAL_sorted["REAL"].tolist()

    print(f"\nlabels_pred {labels_pred}")
    print(f"\nlabels_true {labels_true}")

    scores(labels_true,labels_pred)


if __name__ == "__main__":
     main()


