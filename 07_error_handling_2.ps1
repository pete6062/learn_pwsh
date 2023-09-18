# demonstrates raising errors
# 
# the -ErrorAction parameter has a 'Stop' value that will stop script
# execution if error is encountered.

try {
    # file doesn't exist and will throw error.
    Get-Content "./file.txt" -ErrorAction Stop
}
catch {
    Write-Error "Something went wrong... $($_.exception.message)"
}
finally {
    Write-Host "Cleaning up..."
}