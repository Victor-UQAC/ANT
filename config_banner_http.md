# Config http banner

[ici](https://www.inmotionhosting.com/support/server/apache/hide-apache-version-and-linux-os/)

changer le fichier `nano /etc/apache2/conf-enabled/security.conf`

## Mettre
- ServerTokens Prod
- ServerSignature Off￼

et restart apache2
