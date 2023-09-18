# This script demonstrates setting various metadata for existing files on 
# a sharepoint document library

$SiteUrl = "https://exceng.sharepoint.com/sites/Extranet"
$RelativeUrl = "/sites/Extranet/SharedFiles/Test/test.txt"
$Folder = "SharedFiles/Test"
$Path = "res/test.txt"

try {
    Write-Host "Connecting to Sharepoint..."
    Connect-PnPOnline -Url $SiteUrl -Interactive
    
    # test if file exists
    $file = Get-PnPFile -Url $RelativeUrl
    if ($file) {
        Write-Host "File already exists."
    }
    else {
        # add new test item
        Write-Host "File doesn't exist, uploading test file..."
        Add-PnPFile -Path $Path -Folder $Folder
    }
    
    # get handle to test file as list item using relative url
    $ListItem = Get-PnPFile -Url $RelativeUrl -AsListItem
    
    Write-Host "Updating fields..."

    # set Title field
    Set-PnPListItem -Identity $ListItem -Values @{"Title"="Test Title2"}
    
    # set custom Choice type metadata
    Set-PnPListItem -Identity $ListItem -Values @{"Department"="HR","Admin","IT"}
    Set-PnPListItem -Identity $ListItem -Values @{"Function"="Policy","Form","Onboarding"}
    Set-PnPListItem -Identity $ListItem -Values @{"Client"="N/A"}
}
catch {
    Write-Error $($_.Exception.Message)
}
finally {
    Write-Host "Disconnecting from SharePoint..."
    Disconnect-PnPOnline
}