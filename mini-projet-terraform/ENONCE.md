# Mini-projet: Déployez un serveur jenkins

## Contexte
Il s'agit d'écrire plusieurs modules permettant de reproduire le déploiement de façon très aisée d'un serveur jenkins sur AWS, 
et ensuite d'exporter un certain nombre de métadonnées produites lors de l'exécution dans un fichier texte qui se trouvera sur notre machine Terraform.

## Etapes à réaliser

- Ecrivez un module pour créer une instance ec2 utilisant la version ubuntu jammy (qui
s’attachera l’ebs et l’ip publique) dont la taille et le tag seront variabilisés
- Ecrivez un module pour créer un volume ebs dont la taille sera variabilisée
- Ecrivez un module pour une ip publique (qui s’attachera la security group)
- Ecrivez un module pour créer une security qui ouvrira les ports 80, 443 et 8080
- Ecrivez un module pour créer une paire de clés de facon dynamique pour la connexion à l'ec2
- Créez un dossier app qui va utiliser les 5 modules pour déployer une ec2, bien-sûr vous allez surcharger
les variables afin de rendre votre application plus dynamique
- A la fin du déploiement, installez jenkins et enregistrez l’ip publique et le nom de domaine dans un fichier nommé jenkins_ec2.txt
- A la fin de votre travail, poussez votre rôle sur github et envoyez nous le lien de votre repo à
eazytrainingfr@gmail.com et nous vous dirons si votre solution respecte les bonnes pratiques
