export WANDB_PROJECT=gpih-attention

tmux new-session -d -s "train-0" "
export CUDA_VISIBLE_DEVICES=0;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=resnet18;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=resnet50;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=imagenet50;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=clip50
"
tmux new-session -d -s "train-1" "
export CUDA_VISIBLE_DEVICES=1;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=r3m50;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=imagenet_base;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=mae_base;
python scripts/train/train.py wandb.project=$WANDB_PROJECT data_dir=data_x/1000_yzpyzr model/image_encoder=clip_base
"
