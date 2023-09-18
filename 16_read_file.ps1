# demonstrates use of Get-Content cmdlet to read text data from file.


$filepath = "res/data.txt"


# following reads each line of the file into an element of an array; 
# $ip_addresses is now an array.
$ip_addresses = $(Get-Content -Path $filepath)
foreach ($elem in $ip_addresses)
{
    Write-Host $elem
}


# following writes number of lines in file to console.
$num_lines = $(Get-Content -Path $filepath).Length
Write-Host "$filepath contains $num_lines lines."


# following writes specific line from line to console.
# - base index zero.
$elem = 4
$val = $(Get-Content -Path $filepath)[$elem]
Write-Host "Line $elem starting from zero of $filepath is $val."


# What happens when you try to read line greater than number of lines in file?
# -> Attempting to read file line greater than the number of lines in the file 
# throws no error and simply outputs a blank line.
try {
    $oob = $(Get-Content -Path $filepath).Length
    $oob++
    Write-Host $(Get-Content -Path $filepath)[$oob]
}
catch {
    Write-Host "something went wrong: $_.execption.message"
}