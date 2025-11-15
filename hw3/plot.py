import numpy as np
import matplotlib.pyplot as plt
import os
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator


def load_tb_scalars(path, tag="Eval_AverageReturn"):
    ea = EventAccumulator(path)
    ea.Reload()
    events = ea.Scalars(tag)
    steps = np.array([e.step for e in events])
    vals  = np.array([e.value for e in events])
    return steps, vals


def load_group(folder, tag):
    curves = []
    steps_ref = None
    
    for run in os.listdir(folder):
        run_path = os.path.join(folder, run)
        if not os.path.isdir(run_path):
            continue
        
        event_files = [f for f in os.listdir(run_path) if "events" in f]
        if len(event_files) == 0:
            continue

        event_path = os.path.join(run_path, event_files[0])

        steps, vals = load_tb_scalars(event_path, tag)
        
        if steps_ref is None:
            steps_ref = steps
        else:
            vals = np.interp(steps_ref, steps, vals)

        curves.append(vals)

    curves = np.vstack(curves)
    mean   = curves.mean(axis=0)
    std    = curves.std(axis=0)

    return steps_ref, mean, std


tag = "Train_AverageReturn"
dqn_folder = "data/dqn"
ddqn_folder = "data/ddqn"

dqn_steps, dqn_mean, dqn_std = load_group(dqn_folder, tag)
ddqn_steps, ddqn_mean, ddqn_std = load_group(ddqn_folder, tag)

plt.figure(figsize=(10,6))

# Plot shaded region
# plt.fill_between(dqn_steps, dqn_mean - dqn_std, dqn_mean + dqn_std, color="orange", alpha=0.3)
# plt.fill_between(ddqn_steps, ddqn_mean - ddqn_std, ddqn_mean + ddqn_std, color="blue", alpha=0.3)

# Main curves
plt.plot(dqn_steps, dqn_mean, label="DQN", color="orange")
plt.plot(ddqn_steps, ddqn_mean, label="Double DQN", color="blue")

# ---- Errorbar whiskers every N steps ----
N = 30   # sample every 10 points for whiskers
idx = np.linspace(0, len(dqn_steps)-1, N).astype(int)

plt.errorbar(dqn_steps[idx], dqn_mean[idx], yerr=dqn_std[idx],
             fmt='o', markersize=3, capsize=4, color='orange')

plt.errorbar(ddqn_steps[idx], ddqn_mean[idx], yerr=ddqn_std[idx],
             fmt='o', markersize=3, capsize=4, color='blue')

# Formatting
plt.title("Training Results")
plt.xlabel("Train Steps")
plt.ylabel("Average Return")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
