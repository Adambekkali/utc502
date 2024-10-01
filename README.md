FindMe Service - README

Description
Ce projet implémente un service système (systemd) sur une machine Ubuntu. Le service exécute un script Bash qui recherche et supprime tous les fichiers nommés FindMe.txt dans le répertoire /home et ses sous-répertoires. Ce service s'exécute à chaque démarrage du système et redémarre toutes les 60 secondes, permettant de nettoyer automatiquement ces fichiers.

Fichiers inclus
Script : /usr/local/bin/findme.sh

Le script recherche les fichiers FindMe.txt et les supprime.

Service : /etc/systemd/system/findme.service

Un service systemd qui exécute le script findme.sh périodiquement.

Prérequis
Système d'exploitation : Ubuntu ou une autre distribution Linux compatible avec systemd.
Accès root pour installer les fichiers et activer le service.
Installation
1. Créer le script findme.sh
Le script suivant sera placé dans /usr/local/bin/findme.sh et aura pour fonction de rechercher et supprimer les fichiers FindMe.txt.

Étapes :
1.Crée le script avec les permissions appropriées.

Rendre le script executable : 

sudo chmod +x /usr/local/bin/findme.sh


2. Créer le service findme.service
Ensuite, nous allons créer le fichier de configuration du service pour systemd. Ce fichier doit être placé dans /etc/systemd/system/findme.service.


3. Recharger systemd

Après avoir ajouté le fichier de service, recharge systemd pour qu'il prenne en compte le nouveau service :


sudo systemctl daemon-reload

4. Activer et démarrer le service
Pour que le service soit activé à chaque démarrage et qu'il fonctionne immédiatement, il faut suivre les étapes suivantes :

Activer le service au démarrage :

sudo systemctl enable findme.service

Démarrer le service immédiatement :

sudo systemctl start findme.service

5. Vérifier le service
Pour vérifier que le service est bien en cours d'exécution et qu'il fonctionne comme prévu, utilise la commande suivante :


sudo systemctl status findme.service

Fonctionnement

À chaque démarrage du système, le service findme.service est automatiquement exécuté.
Il exécute le script findme.sh qui recherche et supprime tous les fichiers FindMe.txt dans /home et ses sous-répertoires.
Si le script se termine pour quelque raison que ce soit (soit qu'il ait fini son travail, soit à cause d'une erreur), il est redémarré automatiquement après un délai de 60 secondes, grâce à l'option Restart=always et RestartSec=60.
Le service continue à s'exécuter et redémarre toutes les 60 secondes, supprimant ainsi les fichiers FindMe.txt qui pourraient être créés entre-temps.
