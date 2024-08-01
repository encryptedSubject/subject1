$pw = ConvertTo-SecureString "mustbeSick!" -AsPlainText -Force
$set = @{Name='jadmin'
    Password=$pw
    Description='jeff admin acc'}
New-LocalUser @set
Add-LocalGroupMember -Group "Administrators" -Member "jadmin"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
