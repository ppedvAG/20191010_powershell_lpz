$a = "Daniel"
$b = "daniel"

if($a -ceq $b) {
    write-host "OK"
} else {
 Write-Host "Nicht OK"
}


# Filterung mit Where-Object
Get-Service | Where-Object -FilterScript { 
    if($PSItem.Status -eq "Running") { 
        Write-Host "Der Dienst $($PSItem.DisplayName) hat den Status $($_.Status)" 
    } 
}

# Filterung mit Where-Object - Kurzschreibweise
Get-Service | ? { 
    if($_.Status -eq "Running") {
        Write-Host "Der Dienst $($_.DisplayName) hat den Status $($_.Status)" 
    }
}


# Filterung mit Filter-Parameter von Objekt = schneller als Filterung mit Where-Object
#
Get-ADUser -Filter "Givenname -eq 'Daniel'" # schneller

Get-ADUser -Filter * | Where-Object -FilterScript { $PSItem.Givenname -eq "Daniel" } # langsamer

# Switch-Case

[int]$a = 6

switch ($a)
{
    1 {"Der Wert ist 1"}
    2 {"Der Wert ist 2"}
    3 {"Der Wert ist 3"}
    4 {"Der Wert ist 4"}
    5 {"Der Wert ist 5"}

    Default {"Eine Zahl zwischen 1 oder 5 nicht in der zu prüfenden Variable enthalten ist"}
}

# Foreach - Foreach-Object (Commandlet)

$array = 1..100

$counter1 = [datetime]::Now.Millisecond
foreach($zahl in $array) {
    $zahl
}
$counter2 = [datetime]::Now.Millisecond
$dauer1 = $counter2 - $counter1
Write-Host "Dauer Schleife: " $dauer1


$counter3 = [datetime]::Now.Millisecond
$array | ForEach-Object { $PSItem }
$counter4 = [datetime]::Now.Millisecond
$dauer2 = $counter4 - $counter3
Write-Host "Dauer CMDlet: " $dauer2

# Schleifen - While kopfgeprüft 
