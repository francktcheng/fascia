#!/bin/bash

make clean
# the baseline version
make
# the -O1 version
make O1
# the -O3 version
make O3
