Get-Domain
Get-DomainSID
Get-DomainPolicyData
Get-DomainController
Start-Sleep -Seconds 278
Get-DomainUser | select -ExpandProperty samaccountname
Get-DomainUser -Properties samaccountname,logonCount
Get-DomainGroup | select name
Get-DomainGroupMember -Identity "Domain Admins"
Start-Sleep -Seconds 359
Get-DomainComputer | select Name
Get-DomainOU | select name
Get-ForestDomain -Verbose
Get-DomainTrust
Start-Sleep -Seconds 319
Get-DomainComputer -UnConstrained
Get-DomainUser -TrustedToAuth
