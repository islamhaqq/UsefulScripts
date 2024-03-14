#!/usr/bin/python3

import argparse
import os
from pathlib import Path
import pyperclip
import fnmatch

# Parse command line arguments
parser = argparse.ArgumentParser(description='Merge file contents.')
parser.add_argument('--extensions', nargs='*', help='List of file extensions to include (e.g., txt, py). Default is all files.', default=None)
parser.add_argument('--ignore', nargs='*', help='List of file extensions to ignore (e.g., json, log).', default=[])
parser.add_argument('--ignore_dirs', nargs='*', help='List of directory patterns to ignore (supports wildcards, e.g., .git, *__pycache__*).', default=[])
args = parser.parse_args()

def main():
    # Convert extensions to sets for faster lookups
    extensions = set(args.extensions) if args.extensions is not None else None
    ignore_extensions = set(args.ignore)

    all_files_contents = []

    # Walk through all directories and files
    for root, dirs, files in os.walk(".", topdown=True):
        # Filter out ignored directories using wildcard patterns
        dirs[:] = [d for d in dirs if not any(fnmatch.fnmatch(d, pattern) for pattern in args.ignore_dirs)]
        for file in files:
            filepath = Path(root) / file
            # Check if file should be ignored based on its extension
            if filepath.suffix[1:] in ignore_extensions:
                continue
            # If extensions are provided, check if the file matches
            if extensions is None or filepath.suffix[1:] in extensions:
                # Read file content and add it to the list
                with open(filepath, 'r', encoding='utf-8', errors='ignore') as file:
                    content = file.read()
                    all_files_contents.append(f"// {os.path.relpath(filepath)}\n{content}")

    # Merge all file contents separated by the file path
    merged_contents = "\n\n".join(all_files_contents)

    # Copy to clipboard
    pyperclip.copy(merged_contents)
    print("The contents have been copied to the clipboard.")

if __name__ == "__main__":
    main()
