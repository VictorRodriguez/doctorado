CC = gcc
CFLAGS = -O3 -Wall -Wextra -march=native
SRC = avx_intrinsics.c
AVX_FLAGS = -mavx
AVX2_FLAGS = -mavx2
AVX512_FLAGS = -mavx512f -mavx512bw -mavx512dq
AVX512_DEFINE = -DAVX512

all: avx_binary avx2_binary avx512_binary

avx_binary: $(SRC)
	$(CC) $(CFLAGS) $(AVX_FLAGS) -DAVX -o $@ $(SRC)

avx2_binary: $(SRC)
	$(CC) $(CFLAGS) $(AVX2_FLAGS) -DAVX2 -o $@ $(SRC)

avx512_binary: $(SRC)
	$(CC) $(CFLAGS) $(AVX512_FLAGS) $(AVX512_DEFINE) -o $@ $(SRC)

clean:
	rm -f avx_binary avx2_binary avx512_binary

perf:
	perf stat -r 10 -e instructions,fp_arith_inst_retired.128b_packed_double,fp_arith_inst_retired.256b_packed_double,fp_arith_inst_retired.512b_packed_double,fp_arith_inst_retired.128b_packed_single,fp_arith_inst_retired.256b_packed_single,fp_arith_inst_retired.512b_packed_single,fp_arith_inst_retired.scalar_double,fp_arith_inst_retired.scalar_single,uops_issued.vector_width_mismatch ./avx512_binary
	perf stat -r 10 -e instructions,fp_arith_inst_retired.128b_packed_double,fp_arith_inst_retired.256b_packed_double,fp_arith_inst_retired.512b_packed_double,fp_arith_inst_retired.128b_packed_single,fp_arith_inst_retired.256b_packed_single,fp_arith_inst_retired.512b_packed_single,fp_arith_inst_retired.scalar_double,fp_arith_inst_retired.scalar_single,uops_issued.vector_width_mismatch ./avx2_binary
	perf stat -r 10 -e instructions,fp_arith_inst_retired.128b_packed_double,fp_arith_inst_retired.256b_packed_double,fp_arith_inst_retired.512b_packed_double,fp_arith_inst_retired.128b_packed_single,fp_arith_inst_retired.256b_packed_single,fp_arith_inst_retired.512b_packed_single,fp_arith_inst_retired.scalar_double,fp_arith_inst_retired.scalar_single,uops_issued.vector_width_mismatch ./avx_binary
