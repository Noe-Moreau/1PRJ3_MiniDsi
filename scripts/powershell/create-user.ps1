$Prenom = Read-Host "Entrez votre prenom: "
$Nom = Read-Host "Entrez votre nom: "
$OU = Read-Host "Entrez votre OU: "

$path = "OU=$OU,DC=pme,DC=local"
$OUExiste = Get-ADOrganizationalUnit -Filter { DistinguishedName -eq $path } -ErrorAction SilentlyContinue

if (-not $OUExiste) {
    Write-Host "L'OU '$OU' n'existe pas."
    exit
}

$name = ($Prenom[0] + "." + $Nom ).ToLower()
$nameMail = "$name@pme.local"
$pwd = ConvertTo-SecureString "user123!" -AsPlainText -Force

New-ADUser `
	-Name "$($Prenom) $($Nom)" `
	-GivenName $Prenom `
	-Surname $Nom `
	-SamAccountName $name `
	-UserPrincipalName $nameMail `
	-Path $path `
	-AccountPassword $pwd `
	-Enabled $true

Write-Host "Cree : $name dans $($OU)"