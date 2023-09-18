# this script writes file data from a sharepoint document library into a 
# cvs file.

$SiteUrl = "https://exceng.sharepoint.com/sites/Extranet"
$List = "SharedFiles"

try {
    Write-Host "Connecting to Sharepoint..."
    Connect-PnPOnline -Url $SiteUrl -Interactive
    
    # loop through all listitems and write file information to csv.
    $items = Get-PnPListItem -List $List 
    foreach ($item in $items) {
        [string]$line = $item.FieldValues 

        # TODO...
        # get title
        # get relative url
        # get filter criteria values
        # get check in comment
        # get approval status

    }

}
catch {
    Write-Error $($_.Exception.Message)
}
finally {
    Write-Host "Disconnecting from SharePoint..."
    Disconnect-PnPOnline
}