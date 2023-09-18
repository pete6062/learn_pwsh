# demonstrates common data type operations
# - some datatypes cannot be converted from one another (e.g. string to float)

# declare param
$val = 9
# $val = "hello"


# print out the current data type of $val
Write-Host $val.GetType()


# convert to other datatype 
# $val = [float]$val
# $val = [double]$val
# $val = [bool]$val
# $val = [int]$val
# $val = [datetime]$val
# $val = [string]$val
write-Host $val.GetType()


# data type comparisons
Write-Host $($val -is [datetime])
write-Host $($val -isnot [datetime])