Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object {
            New-ADUser -GivenName $_.GivenName `
                       -Surname $_.SurName `
                       -Name $_.Name `
                       -SamAccountName $_.SamAccountName `
                       -Department $_.Department `
                       -Path $_.Path `
                       -Enabled $true `
                       -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}