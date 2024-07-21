#!/bin/bash
docker run \
        --rm \
        --name whisper-finetune-tensorboard \
        -it \
        --user=$(id -u):$(id -g) \
        -v $(pwd):/home/traininguser/whisper-finetune \
        -p 6006:6006 \
        whisper-finetune /home/traininguser/env_whisper-finetune/bin/tensorboard --logdir=/home/traininguser/whisper-finetune/op_dir_epoch --bind_all
