python rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 \
--ep_len 1000 --discount 0.92 \
-n 100 -l 2 -s 64 -b 1000 -lr 0.005 -rtg --exp_name q2_b_1000_r_0.005

python rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 \
--ep_len 1000 --discount 0.92 \
-n 100 -l 2 -s 64 -b 1000 -lr 0.01 -rtg --exp_name q2_b_1000_r_0.01

python rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 \
--ep_len 1000 --discount 0.92 \
-n 100 -l 2 -s 64 -b 1000 -lr 0.02 -rtg --exp_name q2_b_1000_r_0.02

python rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 \
--ep_len 1000 --discount 0.92 \
-n 100 -l 2 -s 64 -b 1000 -lr 0.05 -rtg --exp_name q2_b_1000_r_0.05

python rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 \
--ep_len 1000 --discount 0.92 \
-n 100 -l 2 -s 64 -b 5000 -lr 0.01 -rtg --exp_name q2_b_5000_r_0.01