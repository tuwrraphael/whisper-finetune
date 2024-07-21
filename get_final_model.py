import os
import argparse
import evaluate
from pathlib import Path

def main(args):    
    os.system(f"mkdir -p {args.output_folder}")
    ckpt_dir_parent = str(Path(args.ckpt_dir).parent)
    os.system(f"cp {ckpt_dir_parent}/added_tokens.json {ckpt_dir_parent}/normalizer.json \
    {ckpt_dir_parent}/preprocessor_config.json {ckpt_dir_parent}/special_tokens_map.json \
    {ckpt_dir_parent}/tokenizer_config.json {ckpt_dir_parent}/merges.txt \
    {ckpt_dir_parent}/vocab.json {args.ckpt_dir}/config.json {args.ckpt_dir}/pytorch_model.bin \
    {args.ckpt_dir}/training_args.bin {args.output_folder}")
    model_id = args.output_folder

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output_folder",
        type=str,
        required=True,
        help="Folder with the pytorch_model.bin file",
    )
    parser.add_argument(
        "--ckpt_dir",
        type=str,
        required=True,
        help="Folder with the checkpoint files",
    )


    args = parser.parse_args()
    main(args)
