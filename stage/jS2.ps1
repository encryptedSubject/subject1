#IP range needs to be changed
1..254 | % {"10.0.2.$($_): $(Test-Connection -count 1 -comp 10.0.2.$($_) -quiet)"} | Out-File -FilePath C:\Users\Public\aliveresults.txt
foreach ($ip in 1..254) {Test-NetConnection -Port 3389 10.0.2.$ip}
foreach ($ip in 1..254) {Test-NetConnection -Port 445  10.0.2.$ip}
foreach ($ip in 1..254) {Test-NetConnection -Port 3306  10.0.2.$ip}
Remove-Item C:\Users\Public\aliveresults.txt
