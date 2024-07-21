#!/bin/bash
for i in {2,5,10,30,60,120,240,480,960};
do
    seconds=$((i*60))
    python3 /home/traininguser/whisper-finetune/getsamples.py ${i}-minutes 0 ${seconds} /home/traininguser/alexa-files /home/traininguser/samples
    python3 custom_data/data_prep.py \
    --source_data_dir /home/traininguser/samples/${i}-minutes \
    --output_data_dir /home/traininguser/samples/prepared_${i}-minutes
done