# demonstrates raising errors by throwing custom error
# 
Param(
    [Parameter(Mandatory)]
    [string]$path
)

# array/collection of forbidden paths
$forbidden = "./forbidden/path1/", "./forbidden/path2/"

try {
    foreach ($val in $forbidden) {
        if ($path -eq $val) {
            Throw "Path is forbidden!"
        }
    }
    write-host "Path is NOT forbidden!"
}
catch {
    Write-Error "Something went wrong... $($_.exception.message)"
}
finally {
    Write-Host "Cleaning up..."
}