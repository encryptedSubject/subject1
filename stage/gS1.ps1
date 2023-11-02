$pw = ConvertTo-SecureString "mustbeSick!" -AsPlainText -Force
$set = @{
  Name = 'jadmin'
  Password = $pw
  Description = 'jeff admin acc'
}
New-LocalUser @set  
