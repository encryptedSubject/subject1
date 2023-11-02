$pw = ConvertTo-SecureString "mustbeSick!" -AsPlainText -Force
$set = @{
  Name = 'jadmin'
  Password = $pw
  Description = 'jeff admin acc'
}
New-LocalUser @set  
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
