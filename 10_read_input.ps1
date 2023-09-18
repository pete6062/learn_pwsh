# script prompts user for input


# Prompt user for input.
# $var = Read-Host -Prompt "Please enter some input"
# Write-Host "The input you entered is: $var"


# Prompt user for input; still works without '-Prompt' switch.
$name = Read-Host "Enter your name"
$date = Get-Date -Format yyyy-MMM-dd
Write-Host "Today is $date."
Write-Host "Today is the day $name began their powershell journey."