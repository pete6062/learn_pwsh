# following demonstrates ways of 'adding' to an existing array.
# - Arrays are fixed size in memory and there is no operation to allocated
#   or de-allocate memory to change an existing array's size; basically, if
#   you need a bigger/smaller array, you need to create a new array.
#   It's important to understand that this is happening in the background as
#   it can have large implications on application speed.
#
#   The += and + operators can be used to "add" elements to an array, but the
#   arrays involved are actually being copied into a new array of the 
#   appropriate size.
#   
#   There are no operations to "decrease" the size of an existing array.

# $arr1 = @(34, 67, 187, 20002, 568)
# $arr2 = @("tree", "house", "rope")


# "Append" element to existing array:
#
# $arr1 += 65
# Write-Host $arr1


# Combine elements of two arrays containing different types in a new array
#
# $arr3 = $arr1 + $arr2
# Write-Host $arr3


# To enforce data type contained in array, use strongly typed array
#
[int[]]$typed_array = @(98, 78, 102, 33)
try {
    # try adding a string type element to int array
    $typed_array += "tree"
}
catch {
    Write-Host "Something went wrong: $_.exception.message"
}