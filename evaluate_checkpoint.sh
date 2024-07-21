# device: -1 for CPU, 0 for GPU
python3 evaluate/evaluate_on_custom_dataset.py \
--ckpt_dir "op_dir_epoch/checkpoint-4" \
--eval_datasets /home/traininguser/samples/prepared_2-minutes \
--output_dir predictions_dir \
--is_public_repo False \
--temp_ckpt_folder "temp" \
--language German \
--device -1 \
--batch_size 16
