# demonstrates how to handle system processes through pwsh


# get list of processes
# Get-Process


# look up process by name
# Get-Process -Name "d*"
Get-Process -Name "*host"


# look up process by id
Get-Process -Id 0 # Idle process
Get-Process -Id 99 # Error msg that process 99 does not exist.


# list all processes not responding; recall that $_ is a special built-in 
# variable for "current object"
# Get-Process | Where-Object -FilterScript {$_.Responding -eq $false}


# stop all processes not responding
# Get-Process | Where-Object -FilterScript {$_.Responding -eq $false} | Stop-Process