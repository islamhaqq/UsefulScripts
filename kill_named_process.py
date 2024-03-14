#!/usr/bin/env python3

import argparse
import psutil

# Parse command line arguments
parser = argparse.ArgumentParser(description='Kill processes by name.')
parser.add_argument('ProcessName', help='Name of the process to kill.')
args = parser.parse_args()

found = False
killed = False

# Iterate through all running processes
for proc in psutil.process_iter(attrs=['name']):
    # Normalize process names to handle different conventions on different platforms
    proc_name = proc.info['name']
    if proc_name:
        # Remove the '.exe' part from Windows process names
        normalized_proc_name = proc_name.replace('.exe', '').lower()

        # Check if normalized process name matches the provided name
        if normalized_proc_name == args.ProcessName.lower():
            found = True
            try:
                proc.kill()  # Attempt to kill the process
                print(f"Killed process: {proc.pid} ({proc_name})")
                killed = True
            except psutil.AccessDenied:
                print(f"Access denied when trying to kill process: {proc.pid} ({proc_name})")
            except psutil.NoSuchProcess:
                print(f"No such process: {proc.pid} ({proc_name})")
            except Exception as e:
                print(f"Error killing process: {proc.pid} ({proc_name}) - {e}")

if not found:
    print(f"No processes found with the name {args.ProcessName}")
elif not killed:
    print(f"Found but could not kill all processes named {args.ProcessName}.")
