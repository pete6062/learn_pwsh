# script demonstrates basic error handling
#
# how severe is the error? can you recover from the error or is it best to
# stop the script?
#
# cmdlets and functions provided by PowerShell generate many errors; it is
# recommended that your script is able to handle all of them.
#
# Determine the possible errors that can be generated from cmdlets and functions
# from documentation.
#
# Two types of errors in PowerShell: 
# - Terminating Errors (script execution haults)
# - Non-terminating Errors (notify something is wrong, but execution continues)
#
# Inspect the exception object using the built-in variable '$_'

try {
    $val = 1
    $val = $val/0 # division by zero!
}
catch [System.DivideByZeroException] {
    # do something for a specific type of error
    Write-Host "Diving by zero is undefined. $($_.exception.message)"
}
catch {
    # do something for all other errors.
    Write-Host "Something went wrong... $($_.exception.message)"
}
finally {
    # do something at end of block; this code always runs.
    Write-Host "Cleaning up..."
}