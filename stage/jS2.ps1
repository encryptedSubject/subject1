<#
#IP range needs to be changed
1..254 | % {"10.0.2.$($_): $(Test-Connection -count 1 -comp 10.0.2.$($_) -quiet)"} | Out-File -FilePath C:\Users\Public\aliveresults.txt
foreach ($ip in 1..254) {Test-NetConnection -Port 3389 10.0.2.$ip}
foreach ($ip in 1..254) {Test-NetConnection -Port 445  10.0.2.$ip}
foreach ($ip in 1..254) {Test-NetConnection -Port 3306  10.0.2.$ip}
Remove-Item C:\Users\Public\aliveresults.txt
#>

# Get IP addresses from the ARP table
$arpTable = arp -a
$ipAddresses = $arpTable | Where-Object { $_ -match "\d+\.\d+\.\d+\.\d+" } | ForEach-Object {
    if ($_ -match "\d+\.\d+\.\d+\.\d+") {
        $matches[0]
    }
}

# Define the ports to scan
$ports = @(22, 3389, 445, 1433)

# Scan each IP on each port
foreach ($ip in $ipAddresses) {
    foreach ($port in $ports) {
        $result = Test-NetConnection -ComputerName $ip -Port $port -WarningAction SilentlyContinue
        if ($result.TcpTestSucceeded) {
            Write-Output "Port $port on $ip is open."
            Out-File "Port $port on $ip is open." -FilePath C:\Users\Public\aliveresults.txt
        } else {
            Write-Output "Port $port on $ip is closed."
            Out-File "Port $port on $ip is closed." -FilePath C:\Users\Public\aliveresults.txt
        }
    }
}
