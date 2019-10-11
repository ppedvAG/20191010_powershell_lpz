Get-Process | Sort-Object -Property Name,Id  #| Out-File c:\temp\prozesse_sort_format.txt

# Get-Process | Sort -Property Name | Out-File c:\temp\prozesse_sort_format.txt # Kurz-Variante Sort von Sort-Object funktioniert auch

Get-Process | Select-Object -First 4 # Select-Object 

Get-EventLog -LogName System -Newest 10 | Sort-Object -Property InstanceId | Format-List -Property EntryType,Message,Source

# Übung Sortieren - Selektieren

# GridView -> PassThru
Get-ADUser -Filter * | Select-Object -First 10 | Out-GridView -OutputMode Multiple | % { $_.GivenName }

Get-Process | Measure-Object -Property CPU -Average -Sum

