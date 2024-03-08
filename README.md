# MergeFiles Python Script

## Description

`merge_files.py` is a Python script designed to concatenate the contents of files with specified extensions from the current directory and all its subdirectories, prefixing each file's content with its relative file path. The combined contents are then copied to the clipboard for easy pasting.

## Requirements

- Python 3.6 or higher.
- The `pyperclip` module for accessing the clipboard. This can be installed using `pip install pyperclip`.

## Installation

1. Ensure Python and pip are installed on your system.
2. Install the `pyperclip` module using pip:
   ```bash
   pip install pyperclip
   ```
3. Download the `merge_files.py` file to your preferred directory.

## Configuration

The script can be run with default settings, which will process all files. You can specify which file extensions to include or ignore via command-line arguments.

## Usage

1. Add the directory containing `merge_files.py` to your system's PATH environment variable. This allows you to run the script from any directory.
2. Navigate to the directory where you want to merge and copy files.
3. To run the script, enter the following command in your terminal or command prompt:

   ```bash
   merge_files.py --extensions ext1 ext2 --ignore ext3 ext4
   ```

   Replace `ext1`, `ext2`, `ext3`, and `ext4` with the file extensions you want to process or ignore. For example, if you want to process `.html` and `.css` files and ignore `.md` and `.txt` files, use:

   ```bash
   merge_files.py --extensions html css --ignore md txt
   ```

   If you don't specify any extensions, the script will process all file types.

4. After the script has finished running, the combined content of the files will be copied to your clipboard. You can paste it wherever needed.

## Security Notice

Ensure that you only download and execute scripts from trusted sources. Running unverified scripts can pose a security risk.

## Troubleshooting

- **Script does not run**: Ensure that Python is correctly installed and that the `pyperclip` module is installed. Verify your PATH includes the directory containing the script.
- **Clipboard does not contain the expected content**: Verify that there are files matching your specified extensions within the directory or its subdirectories. Also, ensure the clipboard is not too large for your system to handle.

For further assistance, please refer to the official Python documentation or the documentation for the `pyperclip` module.

---

Adjust this README according to the specifics of your script or the needs of your users.
