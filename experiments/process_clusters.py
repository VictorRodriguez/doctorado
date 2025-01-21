import json
import argparse
import os
from collections import defaultdict
import matplotlib.pyplot as plt

def load_json_files(file_paths):
    data = []
    for file_path in file_paths:
        with open(file_path, 'r') as f:
            data.append(json.load(f))
    return data

def extract_closest_workloads(data, percentage):
    closest_workloads = defaultdict(list)
    for cluster_data in data:
        for cluster in cluster_data['clusters']:
            workloads = cluster['workloads']
            top_count = max(1, int(len(workloads) * percentage / 100))
            closest_workloads[cluster['cluster']].extend(workloads[:top_count])
    return closest_workloads

def transform_to_vectors(closest_workloads):
    vectors = {}
    for cluster_id, workloads in closest_workloads.items():
        vectors[cluster_id] = list(set(workloads))  # Remove duplicates within each cluster
    return vectors

def combine_and_deduplicate(vectors):
    combined_vector = set()
    for workloads in vectors.values():
        combined_vector.update(workloads)
    return list(combined_vector)

    args = parser.parse_args()
    main(args.json_files, args.percentage)
def extract_and_print_closest_workloads(data, percentage):
    closest_workloads = defaultdict(list)
    for cluster_data in data:
        for cluster in cluster_data['clusters']:
            workloads = cluster['workloads']
            top_count = max(1, int(len(workloads) * percentage / 100))
            top_workloads = workloads[:top_count]
            closest_workloads[cluster['cluster']].extend(top_workloads)
            print(f"Cluster {cluster['cluster']} Top {percentage}% Workloads: {top_workloads}")
    return closest_workloads

def calculate_coverage_per_file(data, combined_vector, percentage):
    coverage_results = []

    for cluster_data in data:
        total_top_workloads = 0
        covered_workloads = 0

        for cluster in cluster_data['clusters']:
            workloads = cluster['workloads']
            top_count = max(1, int(len(workloads) * percentage / 100))
            top_workloads = set(workloads[:top_count])

            total_top_workloads += len(top_workloads)
            covered_workloads += len(top_workloads.intersection(combined_vector))

        coverage_percentage = (covered_workloads / total_top_workloads) * 100 if total_top_workloads > 0 else 0
        coverage_results.append(coverage_percentage)

    return coverage_results
def calculate_reduction(single_json_data, combined_vector):
    # Calculate the total number of unique workloads in a single JSON file
    total_workloads = sum(len(cluster['workloads']) for cluster in single_json_data['clusters'])

    # Calculate the size of the combined subset
    subset_size = len(combined_vector)

    print(f"total_workloads: {total_workloads}")
    print(f"subset_size: {subset_size}")
    # Calculate the reduction percentage
    reduction_percentage = ((total_workloads - subset_size) / total_workloads) * 100 if total_workloads > 0 else 0

    return reduction_percentage
def calculate_metrics(data, combined_vector, percentage):
    # Calculate total unique workloads in the original data
    all_unique_workloads = set()
    for cluster_data in data:
        for cluster in cluster_data['clusters']:
            all_unique_workloads.update(cluster['workloads'])

    total_workloads = len(all_unique_workloads)
    subset_size = len(combined_vector)

    # Calculate coverage
    coverage_results = calculate_coverage_per_file(data, set(combined_vector), percentage)

    # Calculate reduction
    reduction_percentage = ((total_workloads - subset_size) / total_workloads) * 100 if total_workloads > 0 else 0

    # Calculate diversity
    diversity_percentage = (subset_size / total_workloads) * 100 if total_workloads > 0 else 0

    return coverage_results, reduction_percentage, diversity_percentage


def analyze_and_plot(json_files):
    percentages = range(10, 101, 10)
    reduction_results = []
    diversity_results = []

    for percentage in percentages:
        # Load JSON data from files
        data = load_json_files(json_files)

        # Extract and print closest workloads
        closest_workloads = extract_and_print_closest_workloads(data, percentage)

        # Transform to vectors
        vectors = transform_to_vectors(closest_workloads)

        # Combine and deduplicate
        combined_vector = combine_and_deduplicate(vectors)

        # Calculate metrics
        _, reduction_percentage, diversity_percentage = calculate_metrics(data, combined_vector, percentage)

        # Store results
        reduction_results.append(reduction_percentage)
        diversity_results.append(diversity_percentage)

    # Plot results
    plt.figure(figsize=(12, 6))

    plt.subplot(1, 2, 1)
    plt.plot(percentages, reduction_results, marker='o', linestyle='-')
    plt.title('Reduction in Test Content')
    plt.xlabel('Percentage of Workloads Closest to Centroid')
    plt.ylabel('Reduction (%)')
    plt.grid(True)

    plt.subplot(1, 2, 2)
    plt.plot(percentages, diversity_results, marker='o', linestyle='-')
    plt.title('Diversity of Workloads')
    plt.xlabel('Percentage of Workloads Closest to Centroid')
    plt.ylabel('Diversity (%)')
    plt.grid(True)

    plt.tight_layout()
    plt.show()

def main(json_files, percentage):
    # Load JSON data from files
    data = load_json_files(json_files)

    # Extract and print closest workloads
    closest_workloads = extract_and_print_closest_workloads(data, percentage)

    # Transform to vectors
    vectors = transform_to_vectors(closest_workloads)

    # Combine and deduplicate
    combined_vector = combine_and_deduplicate(vectors)

    # Calculate metrics
    coverage_results, reduction_percentage, diversity_percentage = calculate_metrics(data, combined_vector, percentage)

    print("\nCombined Vector (Unique Workloads):")
    print(combined_vector)
    for i, coverage in enumerate(coverage_results):
        print(f"Coverage Percentage for JSON file {json_files[i]}: {coverage:.2f}%")
    print(f"Reduction in Test Content: {reduction_percentage:.2f}%")
    print(f"Diversity of Workloads: {diversity_percentage:.2f}%")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process JSON files to extract closest workloads to centroid.")
    parser.add_argument("json_files", nargs='+', help="Paths to JSON files.")
    parser.add_argument("--percentage", type=float, default=20, help="Percentage of workloads to consider closest to centroid.")

    args = parser.parse_args()
    main(args.json_files, args.percentage)
    analyze_and_plot(args.json_files)

