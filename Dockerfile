FROM python:3.8-bookworm

ARG requirements=requirements.txt

RUN useradd -ms /bin/bash traininguser

USER traininguser
WORKDIR /home/traininguser

ADD ${requirements} /home/traininguser/requirements.txt

RUN python3 -m venv env_whisper-finetune
RUN /bin/bash -c "source env_whisper-finetune/bin/activate && python3 -m pip install --upgrade pip"
RUN /bin/bash -c "source env_whisper-finetune/bin/activate && python3 -m pip install -r requirements.txt"
RUN /bin/bash -c "source env_whisper-finetune/bin/activate && python3 -m pip install librosa==0.10.0.post2"
RUN mkdir /home/traininguser/whisper-finetune
RUN mkdir /home/traininguser/alexa-files
RUN mkdir /home/traininguser/samples
WORKDIR /home/traininguser/whisper-finetune

ADD preload_model.py /home/traininguser/whisper-finetune/preload_model.py
RUN /bin/bash -c "source /home/traininguser/env_whisper-finetune/bin/activate && python3 preload_model.py --model_name openai/whisper-tiny --language German"

RUN echo "source /home/traininguser/env_whisper-finetune/bin/activate" >> /home/traininguser/.bashrc
CMD ["/bin/bash"]