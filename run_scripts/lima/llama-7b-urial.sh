version="inst_1k_v4"
rp=1.1
N=1
T=0.0
max=10
output_dir="result_dirs/lima/hf_urial-${version}/rp=${rp}_N=${N}_T=${T}_max-tokens=${max}/"
mkdir -p $output_dir
gpu=0,1,2,3
tps=4
engine="hf"

CUDA_VISIBLE_DEVICES=$gpu python src/unified_infer.py \
    --engine $engine\
    --urial $version \
    --model_name meta-llama/Llama-2-7b-hf \
    --tensor_parallel_size $tps \
    --dtype bfloat16 \
    --data_name lima --num_outputs $N \
    --top_p 1.0 --temperature $T --repetition_penalty $rp --batch_size 4 --max_tokens $max --start_index 0 --end_index 100 \
    --output_folder $output_dir/ \
    --overwrite