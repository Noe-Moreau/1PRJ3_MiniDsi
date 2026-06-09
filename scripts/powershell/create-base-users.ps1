$users = @(
	@{Prenom="Alice"; Nom="Martin"; OU="Tech"},
	@{Prenom="Bob"; Nom="Dupont"; OU="Tech"},
	@{Prenom="Claire"; Nom="Durand"; OU="Tech"},
	@{Prenom="David"; Nom="Leroy"; OU="Tech"},
	@{Prenom="Emma"; Nom="Moreau"; OU="Tech"},
	@{Prenom="Franck"; Nom="Simon"; OU="Commercial"},
	@{Prenom="Grace"; Nom="Laurent"; OU="Commercial"},
	@{Prenom="Hugo"; Nom="Bernard"; OU="Commercial"},
	@{Prenom="Iris"; Nom="Thomas"; OU="Commercial"},
	@{Prenom="Jules"; Nom="Robert"; OU="Commercial"},
	@{Prenom="Kara"; Nom="Petit"; OU="Direction"},
	@{Prenom="Luc"; Nom="Richard"; OU="Direction"},
	@{Prenom="Marie"; Nom="Blanc"; OU="Direction"},
	@{Prenom="Nina"; Nom="Garcia"; OU="Direction"},
	@{Prenom="Patrick"; Nom="Martinez"; OU="Direction"}
)

foreach ($u in $users) {
	$name = ($u.Prenom[0] + "." + $u.Nom).ToLower()
	$nameMail = "$name@pme.local"
	$path = "OU=$($u.OU),DC=pme,DC=local"
	$pwd = ConvertTo-SecureString "user123!" -AsPlainText -Force

	New-ADUser `
		-Name "$($u.Prenom) $($u.Nom)" `
		-GivenName $u.Prenom `
		-Surname $u.Nom `
		-SamAccountName $name `
		-UserPrincipalName $nameMail `
		-Path $path `
		-AccountPassword $pwd `
		-Enabled $true
	Write-Host "Cree : $name dans $($u.OU)"
}