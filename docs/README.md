# Mini-DSI pour PME

**Contexte :** Une PME de 30 personnes vous confie le déploiement de son socle IT. Mission : fournir un environnement de travail complet, sécurisé et documenté.

---

## Technologies mobilisées

`Windows Server 2022` `Active Directory` `Ubuntu Server` `DHCP / DNS` `PowerShell`

## Niveau de difficulté

> **Débutant - Couvre tout U3**

---

## Fonctionnalités à implémenter

- Active Directory (1 DC) avec 3 OU (Direction, Tech, Commercial) et 15 utilisateurs créés par script PowerShell
- DHCP + DNS Windows pour le domaine interne
- Serveur de fichiers Linux (Samba) rejoint au domaine, partages par OU avec permissions différenciées
- GPO de sécurité de base (mot de passe, verrouillage de session, fond d'écran d'entreprise)
- Sauvegarde quotidienne des données utilisateurs vers une VM dédiée (rsync ou Windows Backup)
- Procédure de restauration testée et chronométrée

---

## Contraintes techniques

- 4 VMs minimum : 1 DC Windows, 1 serveur Linux, 1 poste client, 1 VM sauvegarde
- Plan d'adressage IP statique pour les serveurs, dynamique pour les clients
- Toutes les connexions SSH par clé (mot de passe désactivé)
- Aucun mot de passe par défaut dans les comptes de service