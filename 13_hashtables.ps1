# demonstrates use of hashtables; consists of key-value pairs similar to 
# a dictionary.


# declare hashtable:
$hashtbl = @{   Id=98723758,23579787,35878297; 
                Name="World","Hat","Ball"; 
                Alive=$false,$true,$true}


# return Id value of hashtbl
Write-Host $hashtbl.Id
Write-Host $hashtbl.Name
Write-Host $hashtbl.Alive


# add value to hashtable
# TODO