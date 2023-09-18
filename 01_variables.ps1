# https://learn.microsoft.com/en-us/training/modules/script-with-powershell/2-introduction-scripting


# use '$' to declare a variable.
$PI = 3.14

# Use single quotes to print literal strings
# Use backtick (`) to escape interpolation.
Write-Output 'The value of `$PI is $PI' # prints: The value of `$PI is $PI

# Use double quotes to interpolate the variable.
Write-Host "The value of `$PI is $PI" # prints: The value of $PI is 3.14

# Can also write expression within double quotation marks using '$()'
Write-Host "An expression $($PI + 1)" # prints: An expression 4.14.