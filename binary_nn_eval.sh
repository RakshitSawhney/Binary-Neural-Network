#!/bin/sh
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=paper01_eval
#SBATCH --error=paper01_eval_err.%J.err
#SBATCH --output=paper01_eval_out.%J.out
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=4-00:00:00

source /home/jasnoors.ece21.itbhu/miniconda3/bin/activate
conda activate pytorch_gpu

python main_binary.py --model resnet_binary --save resnet18_binary --dataset cifar10 --input_size 32 --gpus 0 -e /home/jasnoors.ece21.itbhu/bin_net/BinaryNet.pytorch/results/resnet18_binary/model_best.pth.tar
