# merge_files_wrapper.ps1
param(
    [String[]]$Extensions,
    [String[]]$Ignore
)

# Initialize an arguments string
$arguments = @()

# Add extensions to the arguments string if they exist
if ($Extensions) {
    $arguments += "--extensions"
    $arguments += $Extensions
}

# Add ignore patterns to the arguments string if they exist
if ($Ignore) {
    $arguments += "--ignore"
    $arguments += $Ignore
}

# Define the path to your Python script
# Update this path to where you actually store merge_files.py
$scriptPath = "merge_files.py"

# Print the full command for debugging
Write-Output "Executing command: python $scriptPath $($arguments -join ' ')"

# Run the Python script with the constructed arguments string
Start-Process python -ArgumentList ($scriptPath, $arguments) -NoNewWindow -Wait
