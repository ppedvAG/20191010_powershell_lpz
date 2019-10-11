$einObjekt = New-Object -TypeName PSCustomObject
$einObjekt | Add-Member -MemberType NoteProperty -Name Eigenschaft -Value "Wert"
$einObjekt | Add-Member -MemberType NoteProperty -Name EigenschaftZwei -Value 10


[int]$integerVariable = 5 # explizite Datentypangabe <- [int]
[string]$stringVariable = "Eine Textfolge"
[char]$charVariable = 'c'

$unbestimmteVariable = 'c' # obwohl nur ein char angegeben, wird datentyp der variable "string"
$unbestimmteVariable = 12345



$integerVariable = "Eine Textfolge" # funktioniert nicht .. Konvertierung schlägt fehl
$stringVariable = 5 # implizie Konvertierung in string

$integerVariable = "10" # funktioniert .. implizites parsing


[string]$eineStringVariable = "Hallo, ich bin eine Stringvariable"

Write-Host "In meiner Variablen vom Typen String steht: $eineStringVariable"

# Variablen wrappen, um Ausgabe von Eigenschaftswerten innerhalb eines Strings zu ermöglichen
Write-Host "Ich habe ein Objekt mit zwei Eigenschaften. Der erste Wert lautet: $($einObjekt.Eigenschaft), der zweite Wert lautet: $($einObjekt.EigenschaftZwei)" 