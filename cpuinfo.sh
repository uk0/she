#!/bin/bash
# 从 /proc/stat 读取第一行，并返回 user+system 和 idle+iowait
read_cpu() {
    read -r cpu user nice system idle iowait irq softirq steal rest < /proc/stat
    echo $((user + nice + system + irq + softirq + steal)) $((idle + iowait))
}

# 获取系统的总核心数
total_cores=$(nproc)

# 读取两次 CPU 数据，中间间隔 1 秒
read1=$(read_cpu)
sleep 1
read2=$(read_cpu)

# 计算 CPU 使用率
user_system1=${read1%% *}
idle1=${read1##* }
user_system2=${read2%% *}
idle2=${read2##* }

user_system_diff=$((user_system2 - user_system1))
idle_diff=$((idle2 - idle1))
total_diff=$((user_system_diff + idle_diff))

cpu_usage=$(echo "scale=2; $total_cores * $user_system_diff / $total_diff" | bc -l)
cpu_free=$(echo "scale=2; $total_cores * $idle_diff / $total_diff" | bc -l)

echo "CPU Usage: $cpu_usage cores"
echo "CPU Free: $cpu_free cores"
