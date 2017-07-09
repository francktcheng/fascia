data_loc=/scratch/lc37/dataset/fascia-data
data_name=miami.graph
template=u5-1.fascia 
#u3-1.t u5-1.t u7-1.t # u5-2.t u5-3.t u7-1.t #u10-1.t
thd=12
itr=1
out_log=./fascia-$data_name-$template-thd$thd-itr$itr.txt

if [ -f $out_log ]; then
    echo "remove old logs"
    rm $out_log
fi

# options =
# -m  [#], compute counts for motifs of size #
# -o  Use outerloop parallelization
# -l  Graph and template are labeled
# -i  [# iterations], default: 1
# -c  Output per-vertex counts to [template].vert
# -d  Output graphlet degree distribution to [template].gdd
# -a  Do not calculate automorphism of template
# (recommended when template size > 10)
# -r  Report runtime
# -v  Verbose output
# -h  Print this

export OMP_NUM_THREADS=$thd
../fascia-1.0/fascia -g $data_loc/$data_name -t $data_loc/$template -i $itr -r -v | tee $out_log 
