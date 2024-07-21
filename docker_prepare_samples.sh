#!/bin/bash
# docker container stop whisper-finetune
# docker container rm whisper-finetune
mkdir $(pwd)/samples
docker run \
        --gpus all \
        --runtime=nvidia \
        --rm \
        --name whisper-finetune \
        -it \
        --user=$(id -u):$(id -g) \
        -v $(pwd):/home/traininguser/whisper-finetune \
        -v /home/raphael/alexa-files:/home/traininguser/alexa-files \
        -v ~/samples:/home/traininguser/samples \
        whisper-finetune /bin/bash
