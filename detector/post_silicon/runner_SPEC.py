import csv
import re
import os
import pandas as pd
import argparse
from random import seed
from random import randint
import matplotlib.pyplot as plt

tests_files = 'tests.csv'

#spec_workload  = "docker run --privileged -e BENCHMARK=_BENCH_ -e PLATFORM1=skylake speccpu-2017-v118-gcc-11.1.0-20210510"
spec_workload  = "./ctest.sh --set BENCHMARK=_BENCH_  -R test_speccpu_2017_v105_gated -V"

perf_counters= " cycle_activity.cycles_l1d_miss,cycle_activity.cycles_mem_any,inst_retired.any,branch-instructions,branch-misses,cache-misses,cache-references,cycles,instructions,L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores"


def runner_(test):
        cmd = spec_workload.replace("_BENCH_",test)
        file_name = test
        cmd_ = "perf stat -o %s.log -a -e %s " %(file_name, perf_counters)
        cmd_ = cmd_ + cmd
        print (cmd_)
        os.system(cmd_)




int_tests_list=["602.gcc_s ",\
"605.mcf_s", \
"620.omnetpp_s", \
"623.xalancbmk_s",\
"625.x264_s",\
"631.deepsjeng_s",\
"641.leela_s",\
"648.exchange2_s",\
"657.xz_s"
]

float_tests_list = ["603.bwaves_s",\
"607.cactuBSSN_s",\
"619.lbm_s",\
"621.wrf_s" ,\
"627.cam4_s" ,\
"628.pop2_s" ,\
"638.imagick_s" ,\
"644.nab_s" ,\
"649.fotonik3d_s" ,\
"654.roms_s"
]

def run_workloads():
    for test in int_tests_list:
        runner_(test)

    for test in float_tests_list:
        runner_(test)

run_workloads()
