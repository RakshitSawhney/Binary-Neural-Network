Binarized Neural Networks
=================================================
This repository contains training example for BinaryNets using Binary-Backpropagation algorithm as explained in "Binarized Neural Networks: Training Deep Neural Networks with Weights and Activations Constrained to +1 or -1" ([paper link](https://arxiv.org/abs/1602.02830)). </br>
This code is based on ([this repo](https://github.com/itayhubara/BinaryNet.pytorch/tree/master))  and we tried to run it on HPC.


## Training
Start training using:
```
python main_binary.py --model resnet_binary --save resnet18_binary --dataset cifar10 --input_size 32 --gpus 0,1 --epochs 100 
```
or
```
sbatch binary_nn_train.sh
```

Evaluate on validation set using:
```
python main_binary.py --model resnet_binary --save resnet18_binary --dataset cifar10 --input_size 32 --gpus 0 -e {model path}
```
or
```
sbatch binary_nn_eval.sh
```


## Additional flags
|Flag             | Default Value        |Description
|:----------------|:--------------------:|:----------------------------------------------
|LR               |  0.1                 | initial learning rate
|weight-Decay     |  1e-4                | L2 penalty on the weights
|momentum         |  0.9                 | momentum
|batch-size       |  128                 | batch size
|optimizer        |  adam                | optimizer function used
|epochs           |  2500                | number of epochs to train (-1 for unbounded)
|workers          |  8                   | number of data loading workers
|gpus             |  0                   | gpus used for training - e.g 0,1,3
|dataset          |  Cifar10             | Dataset - Cifar10, Cifar100, STL10, SVHN, MNIST
|print-freq       |  10                  | print frequency
|resume           |  none                | path to latest checkpoint
|evaluate         |  none                | evaluate model FILE on validation set (path to model)
|save             |  none                | save directory   


<br>


# Using HPC
Paramshivay, Supercomputer of IIT BHU (Varanasi) was used for training of this model. 

### Setting Up Anaconda
Install miniconda locally for more reliable experience and easy package managing.

Download Miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
Install Miniconda
```
bash Miniconda3-latest-Linux-x86_64.sh
```
Activate Miniconda
```
source miniconda3/bin/activate
```

### Using Interactive Terminal
To get a node with 1 gpu and 20 cores for 1 hour for running the code live.<br>
(Interactive session will over as soon as time is over or your terminal is disconnected from HPC and execution will be interupted.)

```
srun --partition=gpu --nodes=1 --gres=gpu:1 --time=01:00:00 --ntasks-per-node=20  --pty bash -i
```

### Using Shell Script to Submit the Job
Submit the Job to SLURM for completion.<br>
(No need to be connected to HPC for file to keep executing)
```
sbatch script.sh
```

## Contributors
- [Raunak Pandey](https://github.com/patrick-batman)
- [Rakshit Sawhney](https://github.com/RakshitSawhney)



