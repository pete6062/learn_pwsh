# Demonstrates using Out-File cmdlet to write text data to file.

$collection = @(9, 89, 7, 763, 34)


# overwrite all data to file; need to first write data to output and then 
# pipe as input into Out-File cmdlet.
# foreach ($e in $collection)
# {
#     Write-Output $e | Out-File -FilePath "res/output.txt"
# }


# To append to file, same as above but add '-Append' switch:
# foreach ($e in $collection)
# {
#     Write-Output $e | Out-File -Append -FilePath "res/output.txt"
# }


# Writing the collection directly does NOT write all elements on single line.
# i.e. foreach loop is not necessary as in above example.
Write-Output $collection | Out-File -Append -FilePath "res/output.txt"