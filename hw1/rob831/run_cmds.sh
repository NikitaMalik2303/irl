# Dagger Commands to run
python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Ant.pkl \
--env_name Ant-v2 --exp_name dagger_ant --n_iter 10 \
--do_dagger --expert_data rob831/expert_data/expert_data_Ant-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 

python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Hopper.pkl \
--env_name Hopper-v2 --exp_name dagger_hopper --n_iter 10 \
--do_dagger --expert_data rob831/expert_data/expert_data_Hopper-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 

# Hyperparameter train script
import subprocess

learning_rates = [0, 0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001]

ep_len = 1000
eval_batch_size = 5000

for lr in learning_rates:
    print(f"\n========== Running with learning rate {lr} ==========")

    cmd = [
        "python", "rob831/scripts/run_hw1.py",
        "--expert_policy_file", "rob831/policies/experts/Ant.pkl",
        "--env_name", "Ant-v2",
        "--exp_name", f"bc_ant_lr{lr}",
        "--n_iter", "1",
        "--expert_data", "rob831/expert_data/expert_data_Ant-v2.pkl",
        "--learning_rate", str(lr),
        "--n_layers", "5",
        "--video_log_freq", "-1",
        "--eval_batch_size", str(eval_batch_size),
        "--ep_len", str(ep_len)
    ]
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    print(result)


# Ques 1 commands to run
python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Ant.pkl \
--env_name Ant-v2 --exp_name bc_ant --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Ant-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 

python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Humanoid.pkl \
--env_name Humanoid-v2 --exp_name bc_humanoid --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Humanoid-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 

python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Walker2d.pkl \
--env_name Walker2d-v2 --exp_name bc_walker2d --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Walker2d-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 


python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Hopper.pkl \
--env_name Hopper-v2 --exp_name bc_hopper --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Hopper-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 

python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/HalfCheetah.pkl \
--env_name HalfCheetah-v2 --exp_name bc_halfCheetah --n_iter 1 \
--expert_data rob831/expert_data/expert_data_HalfCheetah-v2.pkl \
--learning_rate 1e-3 --n_layers 5 --video_log_freq -1 \
--eval_batch_size 2000 




