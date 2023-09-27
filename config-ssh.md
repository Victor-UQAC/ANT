# Config SSH sécurisé
- sudo chmod -x /etc/update-motd.d/* (pour enlever les bannière de connexion)

## Création des clés
- ssh-keygen -t rsa -b 4096 -f ~/.ssh/ANT.local.<votre nom>.ssh
- envoyer la clé qui est dans ~/.ssh/ANT.local.<votre nom>.ssh.pub

## Changement des fichiers
- Remplacer le fichier /etc/ssh/sshd_config
- modifier les paths vers les clé public dans le host
