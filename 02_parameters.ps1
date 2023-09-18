# To make a script more flexible, you can write it such that you can 
# pass parameters to it to affect the execution logic.
#
# Usage:
# ./parameters.ps1 -Path './newfile.txt' # File ./newfile.txt was created.
# ./parameters.ps1 -Path './anotherfile.txt' # File ./anotherfile.txt was created.
#
# Considerations for parameters:
# - is the param mandatory?
# - what data types does the param accept?
# - what values for the param are reasonable?
# - can the param rely on a default value?
# - what are appropriate initial values for the param?


# Define parameters for the script with the 'Param' keyword.
# Param (
#     $Path
# )
#
# New-Item $Path # Creates new file at $Path
# Write-Host "File $Path was created"


# Check param value with if/else statement:
# Param (
#     $Path
# )
#
# if (-not $Path -eq '') {
#     New-Item $Path # Creates new file at $Path
#     Write-Host "File $Path was created"
# }
# else {
#     Write-Error "Path cannot be blank"
# }


#  Make param mandatory with decorator
# Param(
#     [Parameter(Mandatory)]
#     $Path
# )
#
# New-Item $Path
# Write-Host "File $Path was created"


# Check param value with decorator and optional HelpMessage:
# Param (
#     [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
#     $Path
# )
#
# New-Item $Path
# Write-Host "File $Path was created"


# Require param to be specific type:
Param (
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [string]$Path
)

New-Item $Path
Write-Host "File $Path was created"