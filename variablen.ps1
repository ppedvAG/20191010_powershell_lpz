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


# Scopes 
$a = 5

if($a -eq 5) {
    $b = "If-Block wurde ausgeführt"
    write-host "a ist 5"
}

Write-Host $b


# Arrays: Index <-> Wert
# index ist automatisch

$array1 = 1..10
$leeresArray = @() # leeres Array definieren

# sog. "Array-Initialisierer"
$leeresArray2 = @("Erster Eintrag","Zweiter Eintrag", "Und so weiter")

# Elemente hinzufügen
#$leeresArray.Add("Erster Eintrag")

$leeresArray += "Erster Eintrag"
$leeresArray += "Zweiter Eintrag"
$leeresArray += "Dritter Eintrag"


# Element entfernen
 # It is not easy to delete elements from an array, but you can create a new
 # array that contains only selected elements of an existing array. For
 # example, to create the $t array with all the elements in the $a array 
 # except for the value at index position 2, type:

        $neuesArray = $leeresArray[0,1]


# --------------------- #
# Hashtable: Schlüssel <-> Wert
# Schlüssel kann selbst festgelegt werden
$farben = @{Auto = "rot"; Sand = "weiß"; Gras = "grün"; Himmel = "blau"}

# auch Objekte / Arrays / Listen können werte von Schlüsseln sein
$hashtable = @{Objekt = $einObjekt; Schlüssel2 = "Schlüssel2" }
$hashtable["Objekt"].EigenschaftZwei


#Funktionen / Operatoren