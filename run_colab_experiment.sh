#!/bin/bash
rm -rf cache
data_root_dir=mod_data/dstc11-$1-seed42
data_aug=$data_root_dir-aug$2
config_file=configs/run-$4.jsonnet
cp $data_root_dir/$3/test-utterances.jsonl $data_aug/$3/test-utterances.jsonl
cat $data_root_dir/$3/dialogues.jsonl $data_aug/$3/dialogues_augmentation.jsonl > $data_aug/$3/dialogues.jsonl
python3 -m sitod.run_experiment --data_root_dir "${data_aug}" --experiment_root_dir "results" --config $config_file
rm $data_aug/$3/dialogues.jsonl
rsync -av --ignore-existing "results" "${data_aug}"
rm -rf cache
rm -rf results
