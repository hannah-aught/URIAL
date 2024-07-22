rp=1.1
N=1
T=0.0
output_dir="result_dirs/lima/aligned/rp=${rp}_N=${N}_T=${T}/"
mkdir -p $output_dir
gpu=0,1,2,3
tps=4
engine=hf

# conda activate urial

# ls $HF_HOME

CUDA_VISIBLE_DEVICES=$gpu /opt/conda/envs/urial/bin/python src/unified_infer.py \
    --engine $engine\
    --model_name meta-llama/Llama-2-7b-chat-hf \
    --tensor_parallel_size $tps \
    --dtype bfloat16 \
    --data_name lima --num_outputs $N \
    --top_p 1.0 --temperature $T --repetition_penalty $rp --batch_size 16 --max_tokens 5 --start_index 0 --end_index 2\
    --download_dir $HF_HOME\
    --output_folder $output_dir \
    --overwrite