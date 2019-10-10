get-command -Verb Get # Alle Commandlets mit dem Verb "Get"
get-command -Noun *AD* # Commandlets welche im Substantiv AD beinhalten
get-help get-command # Hilfe zum Commandlets "get-command" anzeigen
get-help get-command -Examples # Beispiele für Commandlets anzeigen

get-command -Module ModulName # Commandlets eines Moduls anzeigen
get-module # importierte Module anzeigen
get-module -ListAvailable # verfügbare Module anzeigen (nicht importierte)
