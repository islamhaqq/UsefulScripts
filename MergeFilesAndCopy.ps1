param(
    [string[]]$Extensions = @("*.ts", "*.tsx", "*.js", "*.jsx")
)

# Create an empty array to store file contents
$allFilesContent = @()

# Get all the items with the specified extensions in the current directory and subdirectories
foreach ($ext in $Extensions) {
    $items = Get-ChildItem -Path .\ -Filter $ext -Recurse
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
