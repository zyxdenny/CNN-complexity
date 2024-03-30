#!/bin/bash

get_flop () {
#     echo $1
    ncu --profile-from-start off --metrics smsp__sass_thread_inst_executed_op_fadd_pred_on \
        --target-processes all python ./mnist/main.py --batch-size $1 --epochs 1 --dry-run \
        | grep 'smsp__sass_thread_inst_executed_op_fadd_pred_on.avg' \
        | sed -n '2p' \
        | awk '{print $3}'
}

x=(4 5 6 7 8)
y=()

for log_batch in ${x[@]}; do
    flop=$(get_flop $((2 ** log_batch))) 
    y+=($flop)
done

x=$(echo ${x[*]} | sed 's/ /,/g')
y=$(echo ${y[*]} | sed 's/ /,/g')

python3 plot.py --x $x --y $y
