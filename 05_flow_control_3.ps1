# performs backup given source and destination directory paths.
# includes the following checks:
# - specified paths are valid
# - only performs backup if backup hasn't already been performed.

param(
    [string]$Path = './app',
    [string]$DestPath = './'
)

# check if source path is valid
if (-not (Test-Path $Path))
{
    throw "Source directory $Path does not exist!"
}

# check if destination path is valid
if (-Not (Test-Path $DestPath))
{
    throw "Destination directory $Path does not exist!"
}

# start backup
$Date = Get-Date -format "yyyy-MM-dd"
$FullBackupPath = $DestPath + 'backup-' + $Date + '.zip'

# check if backup already exists
if (-not (Test-Path $FullBackupPath))
{
    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath $FullBackupPath
    Write-Host "Created backup at $FullBackupPath"
}
else
{
    Write-Error "$FullBackupPath has already been archived!"
}