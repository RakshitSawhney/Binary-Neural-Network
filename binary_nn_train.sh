#!/bin/sh
#SBATCH -N 1
#SBATCH --ntasks-per-node=40
#SBATCH --job-name=paper01
#SBATCH --error=paper01_try_err.%J.err
#SBATCH --output=paper01_try_out.%J.out
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=4-00:00:00

source /home/jasnoors.ece21.itbhu/miniconda3/bin/activate
conda activate pytorch_gpu

python main_binary.py --model resnet_binary --save resnet18_binary --dataset cifar10 --input_size 32 --gpus 0,1 --epochs 1000 

