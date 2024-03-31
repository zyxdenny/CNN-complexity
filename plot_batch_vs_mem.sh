#!/bin/bash

get_mem () {
    python ./mnist/main.py --dry-run --epoch 1 --batch-size $1 \
        | grep memory | awk '{print $(NF-1)}'
}

x=(4 5 6 7 8)
y=()

for log_batch in ${x[@]}; do
    mem=$(get_mem $((2 ** log_batch))) 
    y+=($mem)
done

x=$(echo ${x[*]} | sed 's/ /,/g')
y=$(echo ${y[*]} | sed 's/ /,/g')

python3 plot.py --x $x --y $y --xlabel log_batch_size --ylabel 'memory(MB)' --title memory_vs_batch_size


