# MergeFiles Script

## Description

`merge_files.py` is a script designed to concatenate the contents of files with specified extensions from the current directory and all its subdirectories, prefixing each file's content with its relative file path. The combined contents are then copied to the clipboard for easy pasting.

## Requirements

- Python 3.6 or higher.
- The `pyperclip` module for accessing the clipboard, which can be installed using `pip install pyperclip`.

## Installation

1. Ensure Python and pip are installed on your system.
2. Install the `pyperclip` module using pip:
   ```bash
   pip install pyperclip
   ```
3. Download `merge_files.py` to your preferred directory.

## Configuration

No additional configuration is required. The script can be run with default settings, which will process all files. You can specify which file extensions to include or ignore via command-line arguments.

## Usage

### For Linux and macOS Users:

1. Create a shell script named `merge_files` (without extension) in the same directory as your `merge_files.py`. Paste the following code into it:

    ```bash
    #!/bin/bash
    # Wrapper script to run merge_files.py from anywhere
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    python3 "$DIR/merge_files.py" "$@"
    ```

2. Make your shell script executable by changing its permissions:

    ```bash
    chmod +x /path/to/merge_files
    ```

3. Add the directory containing `merge_files` to your system's PATH environment variable:

    ```bash
    export PATH=$PATH:/path/to/your/script
    ```
    
    Add this line to your `.bashrc` or `.zshrc` to make the change permanent.

4. Navigate to the directory where you want to merge and copy files. Run the script using the following command:

    ```bash
    merge_files --extensions ext1 ext2 --ignore ext3 ext4
    ```

    Replace `ext1`, `ext2`, `ext3`, and `ext4` with the file extensions you want to process or ignore.

## Setting up Python Scripts on Windows

To run these Python scripts seamlessly on Windows, you can follow these steps:

1. **Set Python as the default program for `.py` files:**
   - Right-click on any `.py` file in Windows Explorer.
   - Select 'Open with' > 'Choose another app'.
   - Select 'More apps', scroll down, and select 'Look for another app on this PC'.
   - Navigate to your Python executable (e.g., `C:\Users\YourUsername\Anaconda3\python.exe` for Anaconda or `C:\Python39\python.exe` for standard Python installations) and select it.
   - Ensure the 'Always use this app to open .py files' checkbox is checked before clicking 'OK'.

2. **Add Python Scripts to the Windows PATH:**
   - This step makes it possible to run your Python scripts from anywhere in Command Prompt or Windows Explorer.
   - Search for 'Environment Variables' in the Windows search bar and select 'Edit the system environment variables'.
   - In the System Properties window, click the 'Environment Variables...' button.
   - In the 'System variables' section, find the 'Path' variable and select 'Edit...'.
   - Click 'New' and add the path to your scripts' directory (e.g., `C:\Source\UsefulScripts`).
   - Click 'OK' on all dialogs to apply your changes.

Now, you should be able to double-click Python scripts to run them, or execute them directly from the command line or Windows Explorer's address bar without specifying the Python interpreter explicitly. Ensure that any script you intend to run has the correct shebang (`#!/usr/bin/env python3`) at the top if you plan on using them cross-platform.

## Usage Instructions

### Windows

After setting up your Python environment, navigate to the directory where you want to use the scripts and directly execute them:

```cmd
kill_named_process.py ProcessName
```

or

```cmd
merge_files.py --extensions txt py --ignore json log
```

### Linux and macOS

Make sure the scripts are executable:

```bash
chmod +x kill_named_process.py merge_files.py
```

Run the scripts from the terminal:

```bash
./kill_named_process.py ProcessName
```

or

```bash
./merge_files.py --extensions txt py --ignore json log
```

## Security Notice

Ensure you download and run scripts from trusted sources only. Running unverified scripts can pose a security risk to your system.

## Troubleshooting

- **Script does not run**: Ensure Python is correctly installed, and the `pyperclip` module is installed. Verify your PATH includes the directory containing the script.
- **Clipboard does not contain the expected content**: Check that files matching your specified extensions exist within the directory or its subdirectories. Also, ensure the clipboard is not too large for your system to handle.

For further assistance, please refer to the official Python documentation or the documentation for the `pyperclip` module.
