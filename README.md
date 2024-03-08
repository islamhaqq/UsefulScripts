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

### For Windows Users:

Refer to the earlier provided instructions for setting up and running the batch file wrapper for the Python script.

## Security Notice

Ensure you download and run scripts from trusted sources only. Running unverified scripts can pose a security risk to your system.

## Troubleshooting

- **Script does not run**: Ensure Python is correctly installed, and the `pyperclip` module is installed. Verify your PATH includes the directory containing the script.
- **Clipboard does not contain the expected content**: Check that files matching your specified extensions exist within the directory or its subdirectories. Also, ensure the clipboard is not too large for your system to handle.

For further assistance, please refer to the official Python documentation or the documentation for the `pyperclip` module.

---

This README now includes instructions for both Windows and Linux/macOS users, making your script accessible to a broader audience. Adjust the content according to your script's specifics or your users' needs.
