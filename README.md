# Geometric-peg-in-hole
This is the official PyTorch/PyBullet implementation of Imitation Learning for Spatio-Geometry Driven Assembly Task with Dual-arm Robot Manipulator

## Environment Setup
```
mamba create -n geometric-peg-in-hole python=3.8
mamba install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia
mamba install ca-certificates openssl numba pynput matplotlib certifi tqdm transforms3d pybullet scipy imageio pysimplegui urdfpy hydra-core opencv wandb moviepy ftfy regex gdown timm qt pyvips seaborn graphicsmagick absl-py tensorboardx scikit-video einops
pip install --no-deps pytorch3d pybullet_planning git+https://github.com/openai/CLIP.git git+https://github.com/facebookresearch/r3m.git
pip install -e .
```

## Generate Data
```
bash scripts/data/generate_data.sh
```

## Train Models
```
bash scripts/train/train_all.sh
```

## Test Models
```
bash scripts/test/test_each.sh
```

## env variables
```
export LD_LIBRARY_PATH=/opt/conda/lib/python3.8/site-packages/nvidia/cublas/lib/:$LD_LIBRARY_PATH
```