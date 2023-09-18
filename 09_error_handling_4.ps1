# Following script demonstrates the following:
# - usage of switch parameter
# - using 'throw' keyword to cause a terminating error.
# - Get-ChildItem, Sort-Object, and -match to test if directory contains
#   certain file extensions.
#
# usage for switch parameter:
# e.g. ./Backup2.ps1 -PathIsWebApp -Path <path>

# switch parameter type defined; value is initially $false; if switch parameter 
# is included in the command, then switch parameter value becomes true.
Param(
     [string]$Path = './app',
     [string]$DestinationPath = './',
     [switch]$PathIsWebApp # added a switch parameter (boolean type)
)

# read this as "if switch parameter is present in command"
if ($PathIsWebApp -eq $True)
{
    # user has indicated the path is a webapp, but lets check the path contents for 
    # web app files (i.e. extensions .css, .html, .js)
    try {
        $ContainsApplicationsFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match '\.js|\.html|/.css'

        if (-not $ContainsApplicationsFiles) {
            throw "Not a web app"
        }
        else {
            Write-Host "Source files look good, continuing..."
        }
    } 
    catch {
        throw "Something went wrong: $($_.exception.message)"
    }
}

If(-Not (Test-Path $Path)) 
{
   Throw "The source directory $Path does not exist, please specify an existing directory"
}

$date = Get-Date -format "yyyy-MM-dd"

$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
If (-Not (Test-Path $DestinationFile)) 
{
  Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
  Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')"
} Else {
  Write-Error "Today's backup already exists"
}