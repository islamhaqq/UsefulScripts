# Create an empty array to store file contents
$allFilesContent = @()

# Get all the files with the specified extensions
$files = Get-ChildItem -Path .\ -Include *.ts, *.tsx, *.js, *.jsx -Recurse

# Loop through each file
foreach ($file in $files) {
    # Add file name with comment format to the array
    $allFilesContent += "// " + $file.Name
    # Add file content to the array
    $allFilesContent += Get-Content $file.FullName
    # Add a new line for separation between files
    $allFilesContent += "`n"
}

# Convert the array to a single string
$finalContent = $allFilesContent -join "`n"

# Copy the concatenated string to the clipboard
$finalContent | Set-Clipboard
