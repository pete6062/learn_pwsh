# This script demonstrates add/remove/get/set methods for fields in
# sharepoint document library

$SiteUrl = "https://exceng.sharepoint.com/sites/Extranet"
$List = "SharedFiles"

try {
    Write-Host "Connecting to Sharepoint..."
    Connect-PnPOnline -Url $SiteUrl -Interactive
    
    # gets all fields for the current site
    Write-Host "`nAll fields for $List"
    $fields = Get-PnpField -List $List
    foreach ($f in $fields) {
        Write-Host $f
    }

    # get existing field by internal name or id
    Write-Host "`nGetting field..."
    $field = Get-PnPField -List $List -Identity "Function"
    
    # get id of field
    Write-Host "Field Id is $field.Id"
    
    # is field hidden?
    if ($field.Hidden) {
        Write-Host "Field is hidden."
    }
    else {
        Write-Host "Field is visible."
    }
    
    # is field required?
    if ($field.Required) {
        Write-Host "Field is required."
    }
    else {
        Write-Host "Field is not required."
    }

    # get field type
    Write-Host "Field type is $field.FieldTypeKind"

    # show/hide field
    # Set-PnPField -List $List -Identity $field.Id -Values @{"Hidden"=$true}

    # make field required
    # Set-PnPField -List $List -Identity $field.Id -Values @{"Required"=$true}
        
    # get choices if field is multichoice type
    if ($field.FieldTypeKind -eq "MultiChoice") {
        Write-Host "Field has the following choices:"
        $field.Choices
    }
    
    # add new multichoice field
    Write-Host "Adding new MultiChoice field..."
    Add-PnpField -List $List `
        -DisplayName "Test MultiChoice" `
        -InternalName "TestMultiChoice" `
        -Type MultiChoice `
        -Group "Test Group" `
        -AddToDefaultView `
        -Choices "Choice A","Choice B","Choice C" `
        
    $testfield = Get-PnPField -List $List -Identity "TestMultiChoice"
    Set-PnPField `
        -Identity $testfield `
        -Values @{`
            Required=$true; `
            Hidden=$false`
        }
     
    # remove field
    Write-Host "Removing existing MultiChoice field..."
    Remove-PnPField -List $List -Identity $testfield.Id
}
catch {
    Write-Error $($_.Exception.Message)
}
finally {
    Write-Host "Disconnecting from SharePoint..."
    Disconnect-PnPOnline
}