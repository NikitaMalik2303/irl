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
