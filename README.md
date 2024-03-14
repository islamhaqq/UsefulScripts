# Useful Scripts Repository

This repository contains a collection of Python scripts designed for various automation and utility tasks such as killing processes and merging file contents. These scripts are designed to be cross-platform and can be used on Linux, macOS, and Windows.

## Scripts Overview

### kill_named_process.py

This script allows users to kill processes by name on any operating system. 

#### Requirements

- Python 3.6 or higher
- `psutil` module

#### Usage

Execute the script by providing the name of the process you want to terminate:

```bash
python kill_named_process.py <ProcessName>
```

### merge_files.py

Concatenates the contents of files with specified extensions from the current directory and all its subdirectories, prefixing each file's content with its relative path. The combined contents are then copied to the clipboard.

#### Requirements

- Python 3.6 or higher
- `pyperclip` module

#### Usage

Execute the script with optional arguments for file extensions to include or ignore:

```bash
python merge_files.py --extensions txt py --ignore json log
```

## General Installation

1. Ensure Python and pip are installed on your system.
2. Clone this repository or download the scripts you are interested in.
3. Install required Python modules via pip:

   ```bash
   pip install pyperclip psutil
   ```

## Setting Up Python Scripts on Windows

1. **Set Python as the default program for `.py` files**: Right-click on any `.py` file, select 'Open with' > 'Choose another app', find your Python executable, and set it as the default.
2. **Add Python Scripts to the Windows PATH**: This allows running your Python scripts from anywhere in Command Prompt or Windows Explorer. Add your script directory to the 'Path' variable in 'Environment Variables'.

## Execution Instructions

### Windows

After setting up your Python environment, directly execute the scripts from any directory:

```cmd
python <script_name.py> <arguments>
```

### Linux and macOS

Ensure scripts are executable:

```bash
chmod +x <script_name.py>
```

Run scripts from the terminal:

```bash
./<script_name.py> <arguments>
```

## Security Notice

Download and run scripts only from trusted sources. Unverified scripts can pose a security risk.

## Troubleshooting

- **Script does not run**: Verify Python installation and module presence.
- **Unexpected script output**: Ensure correct script usage and arguments.
- **Clipboard issues**: Check for large data or matching specified extensions.

For further assistance, refer to the official Python documentation or the documentation of the used modules.
