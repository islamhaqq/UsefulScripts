param(
    [string[]]$Extensions = @("*.ts", "*.tsx", "*.js", "*.jsx")
)

# Create an empty array to store file contents
$allFilesContent = @()

# Get all the files with the specified extensions in the current directory and subdirectories
foreach ($ext in $Extensions) {
    $files = Get-ChildItem -Path .\ -Filter $ext -Recurse
    # Loop through each file
    foreach ($file in $files) {
        # Calculate the relative path from the current directory
        $relativePath = $file.FullName.Substring((Get-Location).Path.Length + 1)

        # Add file path with comment format to the array
        $allFilesContent += "// " + $relativePath
        # Add file content to the array
        $allFilesContent += Get-Content $file.FullName
        # Add a new line for separation between files
        $allFilesContent += "`n"
    }
}

# Convert the array to a single string
$finalContent = $allFilesContent -join "`n"

# Copy the concatenated string to the clipboard
$finalContent | Set-Clipboard
