# demonstrates various ways to iterate through an array


# array declaration
$arr = @(90, 102, 24, 36) # @() syntax is preferred


# foreach - iterate through array #1
#
foreach ($elem in $arr)
{
    # perform some operation on array
    Write-Host $elem
}


# for - iterate through array #2
#
# for ($i = 0; $i -lt $arr.Count; $i++) {
#     Write-Host $arr[$i]
# }


# do-until - iterate through array #3
#
# $i = 0
# do {
#     Write-Host $arr[$i]    
#     $i++
# } until (
#     $i -ge $arr.Count
# )


# do while - iterate through array #4
#
# $i = 0
# do {
#     Write-Host $arr[$i]
#     $i++
# } while (
#     $i -lt $arr.Count
# )