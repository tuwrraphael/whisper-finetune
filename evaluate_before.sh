# device: -1 for CPU, 0 for GPU
python3 evaluate/evaluate_on_custom_dataset.py \
--is_public_repo True \
--hf_model openai/whisper-tiny \
--temp_ckpt_folder "temp" \
--language German \
--eval_datasets /home/traininguser/samples/prepared_eval_fixed \
--device 0 \
--batch_size 4 \
--output_dir predictions_dir
