data_loc=/scratch/lc37/Fascia-Data

# dataset name
# data_name=gnp.1.20.graph
# data_name=miami.graph
data_name=nyc.graph

# template names
template=u3-1.fascia 
# template=u5-1.fascia 
#u3-1.t u5-1.t u7-1.t # u5-2.t u5-3.t u7-1.t #u10-1.t

# thd=12
# thd=24
# thd=48

itr=10
# itr=1000
# itr=10000

core_num=24 

# affinity_typ=compact
# affinity_typ=scatter


# log_loc=/N/u/lc37/Project/Harp-Graph-Counting/Results/Fascia-Native
# log_loc=/N/u/lc37/Project/Harp-Graph-Counting/Results/LRT-Test
log_loc=/N/u/lc37/Project/Harp-Graph-Counting/Results/Thd-Scale

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

for thd in 12 24 48
do
    for affinity_typ in compact scatter
    do

        export OMP_NUM_THREADS=$thd
        export KMP_AFFINITY=granularity=fine,$affinity_typ 

        ## experiments on innerloop parallel
        for exec in fascia fascia-O3 
        do
            for round in 1
            do
                echo "Start running $exec on $data_name with template $template thd_num: $thd core_num: $core_num Itr: $itr Affinity: $affinity_typ round: $round"
                ../fascia-1.0/$exec -g $data_loc/graphs/$data_name -t $data_loc/templates/$template -i $itr -r -v >$log_loc/Res-$exec-graph_$data_name-template_$template-thd$thd-core$core_num-itr$itr-$affinity_typ-round$round.log 
                echo "End running $exec on $data_name with template $template thd_num: $thd core_num: $core_num Itr: $itr Affinity: $affinity_typ round: $round"
            done
        done

    done
done
# ## experiments on outerloop parallel
# for exec in fascia fascia-O3 
# do
#     echo "Start running $exec outerloopParal"
# ../fascia-1.0/$exec -g $data_loc/graphs/$data_name -t $data_loc/templates/$template -i $itr -r -v -o >$log_loc/Res-$exec-outerParal-graph_$data_name-template_$template-thd$thd-itr$itr.log 
#     echo "Finish running $exec outerloopParal"
# done
