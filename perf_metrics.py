#!/usr/bin/env python3

import time
import psutil
import GPUtil

def print_performance_metrics(process_name):
    # Try to get process by name
    process = None
    for proc in psutil.process_iter(attrs=['pid', 'name']):
        if proc.info['name'] == process_name:
            process = psutil.Process(proc.info['pid'])
            break

    if process is None:
        print(f"No process found with the name: {process_name}")
        return

    # Continuously monitor and print metrics
    try:
        while True:
            # CPU and memory usage
            cpu_usage = process.cpu_percent()
            memory_usage = process.memory_percent()
            threads = process.num_threads()

            # GPU usage (Assumes one GPU, modify if you have more)
            gpus = GPUtil.getGPUs()
            gpu_usage = gpus[0].load * 100 if gpus else 'N/A'
            gpu_memory = gpus[0].memoryUsed if gpus else 'N/A'

            # Clear the screen and print updated values
            print("\033[H\033[J")  # Clear screen command for Unix terminals
            print(f"CPU Usage: {cpu_usage}%")
            print(f"Memory Usage: {memory_usage}%")
            print(f"Threads: {threads}")
            print(f"GPU Usage: {gpu_usage}%")
            print(f"GPU Memory: {gpu_memory}MB")

            time.sleep(2)  # Update interval (seconds)
    except KeyboardInterrupt:
        print("Stopped monitoring.")

if __name__ == "__main__":
    process_name = input("Enter the process name to monitor (e.g., 'MyGame.exe'): ")
    print_performance_metrics(process_name)
