param(
    [string[]]$Extensions = @("*"), # Default is all files if not specified
    [string[]]$Ignore = @("node_modules", "*.json") # Default values to ignore if not specified
)

# Create an empty array to store file contents
$allFilesContent = @()

# Convert ignore patterns to array of regex for matching paths and filenames
$ignorePatterns = $Ignore -replace '\.', '\\.' -replace '\*', '.*' -replace '\?', '.'
$ignoreRegex = $ignorePatterns | ForEach-Object { [regex]$_ }

# Define a helper function to check if the file or path should be ignored
function Should-Ignore {
    param([string]$Path)
    foreach ($pattern in $global:ignoreRegex) {
        if ($Path -match $pattern) {
            return $true
        }
    }
    return $false
}

# Get all the items with the specified extensions in the current directory and subdirectories
foreach ($ext in $Extensions) {
    $items = Get-ChildItem -Path .\ -Filter $ext -Recurse | Where-Object { -not (Should-Ignore $_.FullName) }
    # Loop through each item
    foreach ($item in $items) {
        # Check if the item is a file
        if ($item -is [System.IO.FileInfo]) {
            # Calculate the relative path from the current directory
            $relativePath = $item.FullName.Substring((Get-Location).Path.Length + 1)

            # Add file path with comment format to the array
            $allFilesContent += "// " + $relativePath
            # Add file content to the array
            $allFilesContent += Get-Content $item.FullName
            # Add a new line for separation between files
            $allFilesContent += "`n"
        }
    }
}

# Convert the array to a single string
$finalContent = $allFilesContent -join "`n"

# Copy the concatenated string to the clipboard
$finalContent | Set-Clipboard
