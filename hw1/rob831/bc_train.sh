python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Ant.pkl \
--env_name Ant-v2 --exp_name bc_ant --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Ant-v2.pkl \
--learning_rate 4e-3 --n_layers 5 --size 64 --video_log_freq -1 \
--eval_batch_size 50000




python rob831/scripts/run_hw1.py \
--expert_policy_file rob831/policies/experts/Humanoid.pkl \
--env_name Humanoid-v2 --exp_name bc_humanoid --n_iter 1 \
--expert_data rob831/expert_data/expert_data_Humanoid-v2.pkl \
--learning_rate 4e-3 --n_layers 5 --video_log_freq -1 \
--batch_size 1000 \
--eval_batch_size 2000


