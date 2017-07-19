data_loc=/scratch/lc37/Fascia-Data

# dataset name
# data_name=gnp.1.20.graph
# data_name=miami.graph
data_name=nyc.graph

# template names
# template=u3-1.fascia 
template=u5-1.fascia 

#u3-1.t u5-1.t u7-1.t # u5-2.t u5-3.t u7-1.t #u10-1.t
thd=16
itr=1

log_loc=/N/u/lc37/Project/Harp-Graph-Counting/Results/Fascia-Native

# if [ -f $out_log ]; then
#     echo "remove old logs"
#     rm $out_log
# fi

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

## experiments on innerloop parallel
for exec in fascia fascia-O3 
do
    echo "Start running $exec innerloopParal"
../fascia-1.0/$exec -g $data_loc/graphs/$data_name -t $data_loc/templates/$template -i $itr -r -v >$log_loc/Res-$exec-graph_$data_name-template_$template-thd$thd-itr$itr.log 
    echo "Finish running $exec innerloopParal"
done

# ## experiments on outerloop parallel
# for exec in fascia fascia-O3 
# do
#     echo "Start running $exec outerloopParal"
# ../fascia-1.0/$exec -g $data_loc/graphs/$data_name -t $data_loc/templates/$template -i $itr -r -v -o >$log_loc/Res-$exec-outerParal-graph_$data_name-template_$template-thd$thd-itr$itr.log 
#     echo "Finish running $exec outerloopParal"
# done
