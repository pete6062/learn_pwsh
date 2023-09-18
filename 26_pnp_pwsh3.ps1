# This script demonstrates updating page properties for a single sharepoint 
# site.

$Url = "https://exceng.sharepoint.com/sites/KB/"
$TargetPageName = "TestPage"

try {
    # connect to sharepoint
    Connect-PnPOnline -Url $Url -Interactive

    # determine if page exists
    $TargetPage = Get-PnpPage -Identity $TargetPageName
    
    # change page name
    $TargetPage.PageTitle = "Accountability Chart"

    # get list of page web parts (e.g. buttons, embedded documents, etc.)
    $WebParts = $TargetPage.Controls

    # cycle through web parts and only modify the first "File and Media" web
    # part found; otherwise do nothing.
    foreach ($i in $WebParts) {
        # print out InstanceId if web part title equals "File and Media"
        if ($i.Title = "File and Media") {
            Write-Host "Found File and Media web part"
            $PropertiesJson = Get-Content "res/propertiesjson3.json"
            $PropertiesJson = [string]$PropertiesJson

            Write-Output "Updating web part properties..."
            Set-PnPPageWebPart -Page $TargetPage -Identity $i.InstanceId -PropertiesJson $PropertiesJson
            
            # publish page
            Write-Host "Publishing page..."
            $TargetPage.Publish()
       
            break
        }
    }
} 
catch {
    Write-Error $($_.Exception.Message)
}
finally {
    # disconnect from sharepoint
    Write-Host "Disconnecting from SharePoint..."
    Disconnect-PnPOnline
}