#!/bin/bash
docker container stop whisper
docker container rm whisper
cp -r final_model_ct2 ~/whisper-data
docker run -d \
  --name whisper \
  --restart=unless-stopped \
  -e TZ=Europe/Vienna \
  -v ~/whisper-data:/data \
  -p 10300:10300 \
  rhasspy/wyoming-whisper --model /data/final_model_ct2 --language de