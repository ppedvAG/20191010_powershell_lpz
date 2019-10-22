# Hilfstool f�r WMI-Klassen und Namensr�ume: WMI Explorer
# ms docs: https://docs.microsoft.com/en-us/windows/win32/wmisdk/wmi-classes
#
# Default Namespace "ROOT\cimv2"
# Eigenschaft: Name - aller verf�gbaren Namespaces  auflisten
Get-WmiObject -namespace "root" -class "__Namespace" | Select Name # "__Namespace" = Master-"Container"

# Ansprechen einer Eigenschaft einer "gewrappten" WMI-Instanz
# Intellisense beim Ansprechen einer Eigenschaft nicht vorhanden .. siehe Zeile 22 u. 23
(Get-WmiObject -Class "Win32_PerfRawData_Tcpip_IPv4").Timestamp_PerfTime

Get-WmiObject -List # listet alle verf�gbaren Klassen im Default Namespace "ROOT\cimv2" auf
#
#
# instanzen der klasse "Win32_PerfRawData_Tcpip_IPv4" mit Eigenschafts-Wert "DatagramsOutboundDiscarded" mit Wert 4
#
#Instanzen auflisten: Powershell
Get-WmiObject -Class "Win32_PerfRawData_Tcpip_IPv4" -Filter "DatagramsOutboundDiscarded = 4"

# Instanzen auflisten: Powershell/WQL (�hnlich SQL)
# Abfrage mit einem Abfrage-String (WQL, �hnlich wie SQL)
Get-WmiObject -Query "SELECT * FROM Win32_PerfRawData_Tcpip_IPv4 WHERE DatagramsOutboundDiscarded = 4" 

# Instanzen auflisten: zur Weiterverarbeitung in Skripten
Get-WmiObject -Class "Win32_PerfRawData_Tcpip_IPv4" | Where-Object -FilterScript { $PSItem.DatagramsOutboundDiscarded -eq 4 }
#(# kurzschreibweise mit alias und namenlosen parametern)
gwmi Win32_PerfRawData_Tcpip_IPv4 | ? {$_.DatagramsOutboundDiscarded -eq 4 }


# generell intellisense bei WMI nicht so fortgeschritten wie das arbeiten mit CIM-Klassen
# deshalb bessere wahl: CIM klassen ("moderneres WMI", auf gleicher Architektur basierend)

# aufbau einer session zu einem remote client
$CimSessionVonComputerName = New-CimSession -ComputerName $env:COMPUTERNAME
Get-CimSession -ComputerName $env:COMPUTERNAME # offene Sessions zu einem remote client abfragen

# objekte abfragen
Get-CimClass -ClassName "Win32_PerfRawData_Tcpip_IPv4" -Namespace "root\cimv2" -CimSession $CimSessionVonComputerName
Get-CimClass # listet alle verg�baren Klassen im Default-Namespace auf
# instanzen einer klasse holen
Get-CimInstance -CimSession $aktuelleSession -ClassName "Win32_PerfRawData_Tcpip_IPv4"

# schlie�en der session mit WMI-Methode
$aktuelleSession.Close() 