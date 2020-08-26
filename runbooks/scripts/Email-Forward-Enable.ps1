$credObject = Get-AutomationPSCredential -Name "****"
Connect-MsolService -Credential $credObject

$Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid -Credential $Credobject -Authentication Basic -AllowRedirection
Import-PSSession -Session $Session -DisableNameChecking:$true -AllowClobber:$true | Out-Null

Set-Mailbox -Identity "bookings@****" -DeliverToMailboxAndForward $false -ForwardingSMTPAddress $null
Set-Mailbox -Identity "bookings@****" -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "outofhours@****"

Remove-PSSession $Session
