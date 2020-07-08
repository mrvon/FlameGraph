#!/bin/bash

command=${1}
output=${2}

sudo perf record -F 99 -a -g -- ${command}
sudo perf script > out.perf
sudo ./stackcollapse-perf.pl out.perf > out.folded
sudo ./flamegraph.pl out.folded > ${output}.svg

rm -f perf.data
rm -f perf.data.old
rm -f out.perf
rm -f out.folded
