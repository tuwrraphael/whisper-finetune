# before: accelerate config
accelerate launch train/fine-tune_on_custom_dataset.py \
--model_name openai/whisper-tiny \
--language German \
--sampling_rate 16000 \
--num_proc 4 \
--train_strategy epoch \
--learning_rate 3.75e-5 \
--warmup 1000 \
--train_batchsize 9 \
--eval_batchsize 4 \
--num_epochs 10 \
--resume_from_ckpt None \
--output_dir op_dir_epoch \
--train_datasets /home/traininguser/samples/prepared_240-minutes \
--eval_datasets /home/traininguser/samples/prepared_eval_fixed
