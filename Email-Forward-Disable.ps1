$credObject = Get-AutomationPSCredential -Name "emailautomation"
Connect-MsolService -Credential $credObject

$Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid -Credential $Credobject -Authentication Basic -AllowRedirection
Import-PSSession -Session $Session -DisableNameChecking:$true -AllowClobber:$true | Out-Null

Set-Mailbox -Identity "bookings@lockdoctor.ie" -DeliverToMailboxAndForward $false -ForwardingSMTPAddress $null
Set-Mailbox -Identity "bookings@lockdoctor.ie" -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "jack@****"

Remove-PSSession $Session
