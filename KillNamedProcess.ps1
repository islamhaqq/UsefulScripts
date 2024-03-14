# Accepts a process name as a parameter
param(
    [string]$ProcessName = "Raaq" # Default is 'Raaq' if no argument is provided
)

# Get all processes with the specified name
$processes = Get-Process | Where-Object { $_.Name -eq $ProcessName }

if ($processes) {
    # Attempt to stop each found process
    foreach ($process in $processes) {
        try {
            $process | Stop-Process -Force
            Write-Output "Killed process: $($process.Id) ($($process.Name))"
        } catch {
            Write-Output "Failed to kill process: $($process.Id) ($($process.Name))"
        }
    }
} else {
    Write-Output "No processes found with the name $ProcessName"
}
