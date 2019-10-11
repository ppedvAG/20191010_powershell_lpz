# Funktions-Definition
function Get-SecurityEvents { # Schlüsselwort function, Bezeichner für die Funktion (Get-SecurityEvents)

    [CmdletBinding()]

    # Parametrisierung
    Param(
        [Parameter(Mandatory=$true)] # Erforderlicher Parameter
        [string]$computerName,

        [int]$eventID = 4624 # Optionaler Parameter, mit Defaultisierung
    )

    # Logik - variabel
    try {
        $Error.Clear()
        Get-EventLog -LogName Security -ComputerName $computerName | Where EventID -eq $eventID | Select -fIrst 10
    }  catch {
        $Error
    }
}

