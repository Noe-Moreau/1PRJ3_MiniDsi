Write-Host "=== ATTENTION SUPPRESSION D'UN UTILISATEUR ==="
$Prenom = Read-Host "Entrez votre prenom"
$Nom = Read-Host "Entrez votre nom"

$name = ($Prenom[0] + "." + $Nom).ToLower()

Remove-ADUser -Identity $name -Confirm:$false
Write-Host "Utilisateur $name supprime."