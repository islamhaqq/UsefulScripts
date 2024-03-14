# Useful Python Scripts

This repository contains a collection of useful Python scripts for various tasks, such as killing processes and merging file contents. These scripts are designed to be cross-platform and can be used on Linux, macOS, and Windows.

## Scripts

### merge_files.py

Merges the contents of files with specified extensions from the current directory and its subdirectories, prefixing each file's content with its relative path. The combined contents are then copied to the clipboard.

#### Requirements

- Python 3.6 or higher
- `pyperclip` module

#### Usage

Run the script with the following command, specifying extensions to include or ignore:

```bash
python merge_files.py --extensions txt py --ignore json log
```

### kill_named_process.py

Kills all processes with a specified name.

#### Requirements

- Python 3.6 or higher
- `psutil` module

#### Usage

Run the script with the following command, providing the name of the process to kill:

```bash
python kill_named_process.py ProcessName
```

Replace `ProcessName` with the actual name of the process you want to kill.

## Installation

1. Ensure Python and `pip` are installed on your system.
2. Clone this repository or download the scripts you need.
3. Install required Python modules:

```bash
pip install pyperclip psutil
```

## Security Notice

Ensure you download and run scripts from trusted sources only. Running unverified scripts can pose a security risk to your system.

## Troubleshooting

- **Script does not run**: Make sure Python is correctly installed, and the required modules are installed.
- **Clipboard does not contain the expected content**: Verify that files matching your specified extensions exist within the directory or its subdirectories.
- **Cannot kill a process**: Ensure you have the necessary permissions to kill the process, and that you are using the correct process name.
