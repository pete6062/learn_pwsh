# demonstrates basic control flow in powershell as well as goes over some
# comparison operators.
# 

Param (
    [Parameter(Mandatory, HelpMessage = "Please enter an integer")]
    [int16]$Val
)

if ($Val -gt 100){
    Write-Host "$Val > 100"
} 
elseif ($Val -le 50) {
    Write-Host "$Val <= 50"
}
else{
    Write-Host "50 > $Val <= 100"
}

# other operators:
# assignment:   +=, -=, /=, *=, ++, --
# equality:     -lt, -le, -gt-, -ge, -eq, -ne 
# logical:      -not, !, -or, -xor, -and
# matching:     -like, -notlike, -match, -notmatch
# containment:  -contains, -notcontains, -in, -notin
# type:         -is, -isnot
# replacement:  -replace