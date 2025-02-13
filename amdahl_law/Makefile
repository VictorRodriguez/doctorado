CC = gcc
CFLAGS = -O3 -Wall -Wextra -march=native
SRC = avx_intrinsics.c
AVX2_FLAGS = -mavx2
AVX512_FLAGS = -mavx512f -mavx512bw -mavx512dq -DAVX512

all: avx2_binary avx512_binary

avx2_binary: $(SRC)
	$(CC) $(CFLAGS) $(AVX2_FLAGS) -o avx2_binary $(SRC)

avx512_binary: $(SRC)
	$(CC) $(CFLAGS) $(AVX512_FLAGS) -o avx512_binary $(SRC)

clean:
	rm -f avx2_binary avx512_binary

perf:
	perf stat -r 10 -e instructions,fp_arith_inst_retired.128b_packed_double,fp_arith_inst_retired.256b_packed_double,fp_arith_inst_retired.512b_packed_double,fp_arith_inst_retired.128b_packed_single,fp_arith_inst_retired.256b_packed_single,fp_arith_inst_retired.512b_packed_single,fp_arith_inst_retired.scalar_double,fp_arith_inst_retired.scalar_single,uops_issued.vector_width_mismatch ./avx512_binary
	perf stat -r 10 -e instructions,fp_arith_inst_retired.128b_packed_double,fp_arith_inst_retired.256b_packed_double,fp_arith_inst_retired.512b_packed_double,fp_arith_inst_retired.128b_packed_single,fp_arith_inst_retired.256b_packed_single,fp_arith_inst_retired.512b_packed_single,fp_arith_inst_retired.scalar_double,fp_arith_inst_retired.scalar_single,uops_issued.vector_width_mismatch ./avx2_binary
