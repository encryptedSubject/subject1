Write-Output "[!] TARU Test Clean-Up"

Write-Output "[*] Cleaning gS1."
Remove-LocalGroupMember -Group Administrators -Member jadmin
Write-Output "[!] User jadmin removed."
Disable-NetFirewallRule -DisplayGroup "Remote Desktop"
Write-Output "[!] Disabled Remote Desktop firewall rule"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
Write-Output "[!] Removed Terminal Server registry value"

Write-Output "[*] Cleaning jS2"
Remove-Item -Path "C:\Users\Public\aliveresults.txt"
Write-Output "[!] Removed aliveresults.txt"

Write-Output "[*] Cleaning jS3"
Remove-Item -Path "C:\temp\AnyDesk.exe"
Write-Output "[!] Removed C:\temp\Anydesk.exe"

Write-Output "[*] Cleaning kS1"
Remove-Item 'C:\temp\2exfil' -Recurse
Write-Output "[!] Removed C:\temp\2exfil directory."

Write-Output "[*] Clean up complete."
PAUSE
