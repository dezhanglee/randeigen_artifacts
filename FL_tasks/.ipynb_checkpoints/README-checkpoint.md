# A Practical and Secure Byzantine Robust Aggregator

This repository contains the code implementation of RandEigen, and the attack code to simulate the attacks used on the image classification task, as a proof of concept. 

### Byzantine-Robust Aggregators 
We include the code implementation for FILTERING and NO-REGRET strong robust aggregators, which were used for our evaluations.  

- [Filtering](http://arxiv.org/abs/2205.11765)
- [No-regret](http://arxiv.org/abs/2205.11765)


## Setup

```bash
pip install -r requirements.txt
```


## Usage

### For HIDRA, MRA, MPA, TMA Attacks 

```bash
python src/simulate.py --dataset [dataset] --attack [attack] --agg [aggregator]
```

In the directory, run the following to simulate randeigen on HIDRA to verify the code's basic functionaltity. 
```bash
python3 src/simulate.py
```

Each run will store its evaluation result in `./results` directory. 
This is the full list of arguments for the aforementioned command. 
| Argument | Values | Use |
|----------|--------|-----|
|--dataset|`MNIST`, `FMNIST`, | dataset for evaluation|
|--agg|`randomized_force`,`average`, `filterl2`, `ex_noregret` ...| robust aggregator for evaluation, where `randomized_force` is RandEigen|
|--attack|,`single_direction`, `partial_single_direction` ...| attack for evaluation, use `single_direction` and `partial_single_direction` for evaluating HIDRA in full and partial knowledge respectively, `backdoor` for Model Replacement Attack, `modelpoisoning` for Model Poisoning Attack, `trimmedmean` for Trimmed Mean Attack|
|--nworkers|`int`| number of clients for federated learning, default `100`|
|--malnum|`int`| number of malicious clients, default `20`|
|--perround|`int`| number of clients participating in each round of training, default `100`|
|--localiter|`int`| number of local iterations at each client to compute gradients, default `5`|
|--round|`int`| number of training rounds, defualt `100`|
|--lr|`float`| learning rate of the model, default `1e-3`|
|--sigma|`float`| variance threshold used in aggregators like `Filtering` and `No-Regret`, default `1e-5`|
|--batchsize|`int`| batchsize for training at each client|
|--adaptive_threshold| `-`| add to use adaptive variance threshold for `Filtering` and `No-Regret`|


### For DBA Attack
The DBA attack evaluation in [secure-robust-federated-learning](https://github.com/wanglun1996/secure-robust-federated-learning) uses the 
[offical implementation](https://github.com/AI-secure/DBA). We use this official implementation as well. 
First open a terminal and run the following command to start Visdom monitor:
```bash
python -m visdom.server -p 8097
```
Then start the training with selected **aggregator** and **attack**, which are specified in `utils/fashion_params.yaml` under ``aggregation_methods''.
```bash
cd ./src/DBA
python main.py --params utils/fashion_params.yaml
```
Running the above at its default values runs the ``RandEigen'' aggregator. 


## Acknowledgement

The code of evaluation of baselines largely reuse [secure-robust-federated-learning](https://github.com/wanglun1996/secure-robust-federated-learning)
and [HIDRA](https://github.com/sarthak-choudhary/HIDRA).