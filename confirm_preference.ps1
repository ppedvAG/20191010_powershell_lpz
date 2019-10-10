$ErrorActionPreference = "SilentlyContinue"

$Error.Clear()

Get-ChildItem C:\einPfad

$Error.FullyQualifiedErrorId | Out-File c:\temp\log.log

Write-Host "Nachdem ein Fehler passiert ist"