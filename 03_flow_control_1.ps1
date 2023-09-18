# creates backup at SrcPath and writes to DestPath.

# params are constrained to specific data type.
# params are given default values.
Param (
    [string]$SrcPath = './app',
    [string]$DestPath = './'
)

# verify the supplied source path is valid.
if (-not (Test-Path $SrcPath))
{
    Throw "Specified path $SrcPath does not exist, please specify valid source path"
}

# perform compress files into zipped format (Compress-Archive has 2GB max limitation)
$date = Get-Date -format "yyyy-MM-dd"

# use backtick (`) to wrap long commands onto newline
Compress-Archive `
    -Path $SrcPath `
    -CompressionLevel 'Fastest' `
    -DestinationPath "$($DestPath + 'backup-' + $date)"

Write-Host "Created backup at $($DestPath + 'backup-' + $date + '.zip')"