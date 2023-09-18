# This script writes all metadata for all files on a sharepoint document 
# library to file.

$Url = "https://exceng.sharepoint.com/sites/Extranet/"
$List = "SharedFiles"
$WriteFilePath = "res/spo_metadata.txt"

try {
    # connect to sharepoint site
    Write-Host "Connecting to SharePoint..."
    Connect-PnPOnline -Url $Url -Interactive

    # extract sharepoint fields data
    Write-Host "Extracting SharePoint data..."
    # $data = (Get-PnPListItem -List $List -Fields $Fields).FieldValues

    # retrieve list items
    $items = Get-PnPListItem -List $List
    
    # write all metadata for each list item to file
    foreach ($item in $items) {
        Write-Output $item.FieldValues | Out-File -FilePath $WriteFilePath -Append
        write-Output "`n" | Out-File -FilePath $WriteFilePath -Append
    }
}
catch {
    Write-Error "$($_.Exception.Message)"
}
finally {
    Write-Host "Disconnecting from SharePoint..."
    Disconnect-PnPOnline
}