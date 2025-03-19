#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 16  // Small matrix to fit in cache

// Initialize matrices with random values
void init_matrices(float *A, float *B, float *C) {
    for (int i = 0; i < SIZE * SIZE; i++) {
        A[i] = (float)(rand() % 10);
        B[i] = (float)(rand() % 10);
        C[i] = 0.0f;
    }
}

#ifdef AVX512
void matrix_multiply_avx512(float *A, float *B, float *C) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j += 16) { // Process 16 elements at a time
            __m512 c = _mm512_loadu_ps(&C[i * SIZE + j]); // Load C[i][j:j+15]
            for (int k = 0; k < SIZE; k++) {
                __m512 a = _mm512_set1_ps(A[i * SIZE + k]); // Broadcast A[i][k]
                __m512 b = _mm512_loadu_ps(&B[k * SIZE + j]); // Load B[k][j:j+15]
                c = _mm512_fmadd_ps(a, b, c); // Multiply and add
            }
            _mm512_storeu_ps(&C[i * SIZE + j], c); // Store result
        }
    }
}
#elif defined(AVX2)
void matrix_multiply_avx2(float *A, float *B, float *C) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j += 8) { // Process 8 elements at a time
            __m256 c = _mm256_loadu_ps(&C[i * SIZE + j]); // Load C[i][j:j+7]
            for (int k = 0; k < SIZE; k++) {
                __m256 a = _mm256_set1_ps(A[i * SIZE + k]); // Broadcast A[i][k]
                __m256 b = _mm256_loadu_ps(&B[k * SIZE + j]); // Load B[k][j:j+7]
                c = _mm256_fmadd_ps(a, b, c); // Multiply and add
            }
            _mm256_storeu_ps(&C[i * SIZE + j], c); // Store result
        }
    }
}
#else
void matrix_multiply_avx(float *A, float *B, float *C) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j += 4) { // Process 4 elements at a time
            __m128 c = _mm_loadu_ps(&C[i * SIZE + j]); // Load C[i][j:j+3]
            for (int k = 0; k < SIZE; k++) {
                __m128 a = _mm_set1_ps(A[i * SIZE + k]); // Broadcast A[i][k]
                __m128 b = _mm_loadu_ps(&B[k * SIZE + j]); // Load B[k][j:j+3]
                c = _mm_fmadd_ps(a, b, c); // Multiply and add
            }
            _mm_storeu_ps(&C[i * SIZE + j], c); // Store result
        }
    }
}
#endif

int main() {
    float A[SIZE * SIZE], B[SIZE * SIZE], C[SIZE * SIZE];

    srand(time(NULL));
    init_matrices(A, B, C);

	printf("Running matrix multiplication using %s...\n",
		   #ifdef AVX512
		   "AVX-512"
		   #elif defined(AVX2)
		   "AVX2"
		   #elif defined(AVX)
		   "AVX (128-bit)"
		   #else
		   "Scalar (No AVX)"
		   #endif
	);

    for (int count = 0; count <= 10000000; count++) {
        #ifdef AVX512
        matrix_multiply_avx512(A, B, C);
        #elif defined(AVX2)
        matrix_multiply_avx2(A, B, C);
        #else
        matrix_multiply_avx(A, B, C);
        #endif
    }

    printf("Computation complete.\n");
    return 0;
}

