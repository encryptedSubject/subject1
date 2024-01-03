Write-Output "[*] Removing jadmin"
Remove-LocalGroupMember -Group Administrators -Member jadmin
Remove-LocalUser -Name "jadmin"
Write-Output "[*] jadmin removed."

Write-Output "[*] Removing RDP rule."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
Write-Output "[*] Rule removed"

Write-Output "[*] Removing Firewall RDP rule"
Disable-NetFirewallRule -DisplayGroup "Remote Desktop"
Write-Output "[*] Firewall RDP rule removed.

Write-Output "[*] Removing 2exfil directory"
Remove-Item 'C:\temp\2exfil' -Recurse
Write-Output "[*] C:\temp\2exfil removed."

Write-Output "[*] All Actions Completed."
