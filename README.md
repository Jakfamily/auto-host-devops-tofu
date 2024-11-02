
# Auto Host DevOps - Infrastructure Proxmox avec Opentofu

Ce projet met en place une infrastructure as code pour gérer un environnement Proxmox, destiné à héberger divers services DevOps et de monitoring. Il utilise OpenTofu, un fork de Terraform, pour orchestrer les ressources sur Proxmox.

## Structure des Fichiers

- **`maint.tf`** : Le fichier principal qui définit les ressources Terraform pour les machines virtuelles (VMs) dans Proxmox.
- **`outputs.tf`** : Définit les valeurs de sortie, comme les IDs et les noms des VMs, pour une utilisation ultérieure dans d'autres configurations ou scripts.
- **`provider.tf`** : Configure le fournisseur Proxmox pour Terraform, y compris les informations d'authentification.
- **`secrets.tfvars`** : Contient les variables sensibles (URL Proxmox, utilisateur, mot de passe) nécessaires pour accéder à l'API Proxmox. Ce fichier est ajouté au `.gitignore` pour éviter les fuites de secrets.
- **`variables.tf`** : Définit les variables globales pour la configuration, ce qui permet de rendre le projet plus dynamique et personnalisable.
- **`.gitignore`** : Fichier pour exclure certains fichiers et dossiers (comme `.terraform` et `secrets.tfvars`) du contrôle de version.

## Prérequis

- **Proxmox** : Un serveur Proxmox configuré et accessible via l'API.
- **OpenTofu** : Version 1.x ou supérieure. Installez [OpenTofu ici](https://opentofu.org/downloads).
- **Accès au réseau** : Assurez-vous que les VMs peuvent communiquer entre elles, en particulier pour les services DevOps et de monitoring.

## Variables

Vous pouvez configurer les variables dans `variables.tf` et `secrets.tfvars`. Voici les principales variables utilisées :

- **proxmox_url** : URL de l'API Proxmox.
- **proxmox_user** : Utilisateur pour accéder à l'API Proxmox.
- **proxmox_password** : Mot de passe ou token pour l'utilisateur Proxmox (sensitif).
- **vm_memory** : Mémoire allouée à chaque VM.
- **vm_cpu** : Nombre de CPU alloués à chaque VM.
- **vm_storage** : Espace disque pour chaque VM.

## Déploiement

### Étape 1 : Initialiser OpenTofu

Avant de commencer, initialisez OpenTofu pour télécharger les modules et plugins nécessaires :

```bash
tofu init
```

### Étape 2 : Valider la Configuration

Vérifiez la syntaxe et la validité de votre configuration avec la commande suivante :

```bash
tofu validate
```

### Étape 3 : Planifier le Déploiement

Vérifiez ce que OpenTofu va déployer avec la commande suivante :

```bash
tofu plan -var-file="secrets.tfvars"
```

Cela vous permet de voir les ressources qui seront créées, modifiées ou supprimées.

### Étape 4 : Appliquer le Déploiement

Si le plan vous convient, appliquez-le pour créer les ressources dans Proxmox :

```bash
tofu apply -var-file="secrets.tfvars"
```

## Ressources

- **pfSense** : Pare-feu assurant la sécurité du réseau, avec un système de détection d'intrusion (IDS) et un accès VPN sécurisé.
- **Traefik** : Gestionnaire de routage et reverse proxy pour diriger le trafic vers les conteneurs et applications selon les règles configurées.
- **Docker Host** : Plateforme d’hébergement des conteneurs pour les services DevOps et autres applications.
- **Database Server** : Serveur de bases de données pour le stockage et la gestion des données.
- **DevOps** : Serveur dédié aux pipelines CI/CD pour automatiser les processus de développement et de déploiement.
- **Monitoring** : Serveur pour le monitoring et la gestion des logs, intégrant des outils SIEM pour une surveillance avancée et l’analyse des journaux.

## Notes

- Assurez-vous que le fichier `secrets.tfvars` est exclu du contrôle de version et sécurisé.
- Adaptez les valeurs de `vmid` si vous utilisez des IDs spécifiques pour chaque VM.
- Si une VM existe déjà, Terraform ne la recréera pas automatiquement. Utilisez `terraform import` pour ajouter les VMs existantes à l'état Terraform si nécessaire.

## Problèmes Connus

- **Erreur de Cloud-Init** : Si vous voyez un avertissement relatif à Cloud-Init, assurez-vous que les configurations Cloud-Init ne sont pas activées si elles ne sont pas nécessaires.
- **Erreurs de VMID** : Vérifiez que chaque `vmid` est unique si vous définissez des valeurs spécifiques.

## Auteur

Développé par Jean-Baptiste. Retrouvez-moi sur [LinkedIn](https://www.linkedin.com/in/jean-baptiste-faria/).

Ce projet est un environnement DevOps d'apprentissage et de test. Utilisez-le comme point de départ pour déployer des infrastructures similaires.
