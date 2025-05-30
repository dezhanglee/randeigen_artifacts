#!/bin/bash
# COUNTER=0
# # Define the list of datasets, attacks, and aggregators
# datasets=("MNIST" "Fashion-MNIST" "CIFAR10")
# attacks=("single_direction" "partial_single_direction")
# # aggregators=("average" "filterl2" "ex_noregret")
# aggregators=("average" "filterl2")
# # Loop over each combination
# for dataset in "${datasets[@]}"; do
#   for attack in "${attacks[@]}"; do
#     for aggregator in "${aggregators[@]}"; do
#       # Run the simulation command
#       DEVICE=$((COUNTER%4))
#       python src/simulate.py --dataset "$dataset" --attack "$attack" --agg "$aggregator" --device "$DEVICE"
#       COUNTER=$((COUNTER+1))
#       # Add any additional logic or commands here if needed
#     done
#   done
# done


COUNTER=0

mkdir log

for DATASET in "MNIST" "Fashion-MNIST" 
do
	for ATTACK in "single_direction" "partial_single_direction" "noattack" 
	do
		for AGG in "average" "randomized_force" "filterl2"
		do
			DEVICE=$((COUNTER%4))
			COMMAND="conda init; python src/simulate.py --dataset ${DATASET} --device ${DEVICE} --attack ${ATTACK} --agg ${AGG} > log/${ATTACK}_${AGG}_${DATASET}.log;"
			echo $COMMAND
			screen -dmS ${ATTACK}_${AGG}_${DATASET} bash -c "conda init; python src/simulate.py --dataset ${DATASET} --device ${DEVICE} --attack ${ATTACK} --agg ${AGG} > log/${ATTACK}_${AGG}_${DATASET}.log;"
			COUNTER=$(($RANDOM))
		done
	done
done
