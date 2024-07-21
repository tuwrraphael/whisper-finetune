python3 get_final_model.py \
--ckpt_dir "op_dir_epoch/checkpoint-4" \
--output_folder "final_model"

ct2-transformers-converter --model ./final_model --quantization float32 --force --output_dir ./final_model_ct2 \
--copy_files tokenizer_config.json preprocessor_config.json