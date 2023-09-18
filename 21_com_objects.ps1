# several windows applications can be manipulated through pwsh by using 
# One way to think about COM objects is as a way for pwsh to launch apps. The
# example below launches and interfaces with a Microsoft Excel application 
# instance. 
# 
# Similar can be done for pretty much any other Microsoft app (Non-MS apps?).
# 
# https://social.technet.microsoft.com/Forums/office/en-US/33dbc1c4-40ee-4ef8-b25b-f29440ab3194/using-com-objects-excel-from-powershell?forum=ITCG
# https://www.getfishtank.com/blog/useful-powershell-commands-for-excel


# start Microsoft Excel application instance
$excel = New-Object -ComObject Excel.application


# print all methods and properties availble for the $excel object to
# powershell console
# $excel | Get-Member


# show the application instance
# $excel.visible = $true

j
# create a new workbook
# $wb = $excel.workbooks.add()


# load an existing workbook
$filepath = "repos/pwsh_sandbox/res/workbook.xlsx"
try {
    $wb = $excel.workbooks.open($filepath) 
}
catch {
    Write-Host "Something went wrong: $_.exception.message"
}


# update workbook properties
# $wb.author = "JP- jpeterson@exceleng.net"
# $wb.title = "some title"
# $wb.subject = "some subject"


# delete excess worksheets
# try {
#     for($i = $wb.sheets.count; $i -gt 1; $i--) {
#         $wb.sheets.item($num).delete()
#     }
# }
# catch {
#     Write-Host "Something went wrong: $_.exception.message"
# }


# rename worksheet to "data"
# $ws = $wb.sheets.item(1)
# $ws.name = "data"


# add data to worksheet cells
# $ws.range("A1:A10").cells = "90"
# $ws.cells.item(11, 1).value = "60"


# get last row and column in worksheet
$lr = $ws.usedrange.rows.count
$lc = $ws.usedrange.columns.count
$lr++ # increment to next empty row
$ws.cells.item($lr, $lc).value = "next empty cell"


# download data from internet and store in excel workbook
# TODO


# save workbook to a specific file location
# $wb.saveas("repos/pwsh_sandbox/res/workbook.xlsx")


# save existing workbook 
$wb.save() # save existing workbook


# terminate application instance
$excel.quit()