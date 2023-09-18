# If you need to add elements to an array in an efficient manner, use
# a .NET Generic List object; user must specify the type of data that will
# make up the collection.

# to shorten namespace in declaration, use 'using' keyword; must appear as
# first line in your script.
using namespace System.Collections.Generic


# $arr = [System.Collections.Generic.List[int]]::new()
$arr = [List[int]]::new()


# add elements to ArrayList
for ($i = 0; $i -lt 4; $i++)
{
    # $arr += $i
    $arr.Add($i) # use [void] to suppress unexpected output
}


# print out array 
Write-Host $arr