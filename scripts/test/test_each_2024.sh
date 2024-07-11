tmux new-session -d -s "test-0" '
export CUDA_VISIBLE_DEVICES=0
export ENV_MODELS=(
"env/variant=yzpyzr model/image_encoder=clip50 model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-clip50_mlp-with_prop-6d-mse-2024.03.25-15.57.57/*50000.pth"
"env/variant=yzpyzr model/image_encoder=clip_base model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-clip_base_mlp-with_prop-6d-mse-2024.03.25-15.37.32/*50000.pth"
"env/variant=yzpyzr model/image_encoder=imagenet50 model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-imagenet50_mlp-with_prop-6d-mse-2024.03.25-15.16.57/*50000.pth"
"env/variant=yzpyzr model/image_encoder=imagenet_base model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-imagenet_base_mlp-with_prop-6d-mse-2024.03.25-13.30.15/*50000.pth"
)
for ((i = 0; i < ${#ENV_MODELS[@]}; i++))
do
    for OBJECTSET in arrow circle cross diamond hexagon key line pentagon u
    do
        python scripts/test/test.py env/object_set=$OBJECTSET\
            wandb.project=gpih-attention\
            ${ENV_MODELS[$i]} &
    done
    wait
done
'

tmux new-session -d -s "test-1" '
export CUDA_VISIBLE_DEVICES=1
export ENV_MODELS=(
"env/variant=yzpyzr model/image_encoder=r3m50 model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-r3m50_mlp-with_prop-6d-mse-2024.03.25-12.48.16/*50000.pth"
"env/variant=yzpyzr model/image_encoder=resnet18 model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-resnet18_mlp-with_prop-6d-mse-2024.03.25-12.48.16/*50000.pth"
"env/variant=yzpyzr model/image_encoder=resnet50 model_glob=train/train-data_x/1000_yzpyzr-top_and_wrist_cams-resnet50_mlp-with_prop-6d-mse-2024.03.25-13.30.09/*50000.pth"
)
for ((i = 0; i < ${#ENV_MODELS[@]}; i++))
do
    echo "${ENV_MODELS[$i]}/*50000.pth"
    for OBJECTSET in arrow circle cross diamond hexagon key line pentagon u
    do
        python scripts/test/test.py env/object_set=$OBJECTSET\
            wandb.project=gpih-attention\
            ${ENV_MODELS[$i]} &
    done
    wait
done
'