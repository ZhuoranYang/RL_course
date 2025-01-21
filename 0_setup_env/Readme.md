# Reinforcement Learning Environment Setup

This repository contains a conda environment configuration for a Reinforcement Learning (RL) course. The environment comes with popular RL libraries, optimization tools, and additional packages for data analysis, visualization, and experiment tracking with Weights & Biases.

## 1. Environment Overview

### Key Packages

- **Python 3.10**: Programming language.
- **PyTorch, TorchVision, TorchAudio**: Deep learning frameworks with GPU acceleration.
- **pytorch-cuda**: CUDA support for GPU acceleration (make sure your system/GPU drivers support this).
- **gymnasium**: Standardized API for RL environments (successor to OpenAI Gym).
- **Stable-Baselines3 (SB3)**: Popular RL algorithms (PPO, DQN, A2C, etc.) with additional features via `[extra]`.
- **Pulp & CVXPY**: Linear programming and convex optimization libraries.
- **Matplotlib & Seaborn**: Data visualization libraries.
- **TQDM**: Progress bar utility.
- **Pandas**: Data manipulation and analysis library.
- **JupyterLab**: Web-based development environment for notebooks.
- **Weights & Biases (wandb)**: Experiment tracking, logging, and collaboration tool.


## 2. Installation Instructions (Using the Installation Script)

1. **Clone this repository** (or navigate to the folder containing the `drl_env.yml` and `install_drl_env.sh` files):

   ```bash
   git clone <your-repo-url>
   cd <your-repo-folder>
   ```


2. **Run the installer script**:
   
   ```bash install_drl_env.sh
   ```

   This script will:
   - Check that CUDA is available (via `nvidia-smi`)
   - Load Miniconda
   - Create the conda environment (`rl_course`) from `drl_env.yml`

   You only need to run `install_drl_env.sh` to install and the script will install the entire environment.

3. **Activate the environment**:
   
   ```bash
   conda activate rl_course
   ```

   You should now have access to all the packages listed in the environment file.


## 3. Tracking Experiments with Weights & Biases

### 3.1 Installing and Logging In

If you installed `wandb` via conda (as shown in the updated `drl_env.yml`), you already have `wandb` in your environment. If you need to manually install or upgrade it, you can still do so with:

```bash
pip install --upgrade wandb
```

Next, **log in** to your Weights & Biases account:

```bash
wandb login
```

You will be prompted to enter your API key (available in your [Weights & Biases account settings](https://wandb.ai/settings)).

### 3.2 Basic Usage in Python

A typical example of how you might integrate `wandb` into a training script:

```python
import wandb

# 1. Initialize project
wandb.init(project="my-rl-project")

# 2. Track hyperparameters
config = wandb.config
config.learning_rate = 0.0003
config.batch_size = 64

# 3. Log metrics in your training loop
for step in range(1000):
    # ... training logic ...
    wandb.log({"loss": loss_value, "reward": reward_value})

# 4. Finish the run
wandb.finish()
```

Once logged in, your training runs will appear on your Weights & Biases dashboard, enabling you to compare runs, visualize metrics, and share results with others.

## 4. Troubleshooting

- **CUDA not recognized**: Ensure you are on a GPU node (if applicable) and that `nvidia-smi` works.
- **Environment conflicts**: If you have conflicting versions of libraries, try updating or removing them before reinstalling. Sometimes you may need to remove the environment (`conda remove --name rl_course --all`) and re-create it.

