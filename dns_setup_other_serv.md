## Setup du DNS sur les autres serveurs
1. Aller dans `/etc/systemd/resolved.conf`
2. Décommenter la ligne `DNS=x.x.x.x` et mettre l'adresse du DNS
3. `sudo systemctl restart systemd-resolved.service`
4. Tester avec `nslookup ant.local`

### Si jamais ça ne marche pas
1. `sudo apt-get install resolvconf`
2. Aller dans `/etc/resolvconf/resolv.conf.d/head`
3. Ajouter une ligne `nameserver 10.8.128.xxx`
4. `sudo systemctl enable --now resolvconf.service`
5. Redémarrer la machine
