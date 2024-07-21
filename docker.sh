#!/bin/bash
# docker container stop whisper-finetune
# docker container rm whisper-finetune
docker run \
        --gpus all \
        --runtime=nvidia \
        --rm \
        --name whisper-finetune \
        -it \
        --user=$(id -u):$(id -g) \
        -v $(pwd):/home/traininguser/whisper-finetune \
        -v ~/samples:/home/traininguser/samples \
        whisper-finetune
