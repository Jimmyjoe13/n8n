# Déploiement de n8n sur Render

Ce guide explique comment déployer n8n sur Render.

## Prérequis

- Un compte [Render](https://render.com/)
- Un dépôt GitHub contenant votre code n8n (forké ou créé à partir de ce projet)

## Étapes de déploiement

### 1. Connectez votre dépôt GitHub à Render

1. Connectez-vous à votre compte Render
2. Allez dans le tableau de bord et cliquez sur "New +"
3. Sélectionnez "Blueprint"
4. Connectez votre dépôt GitHub contenant le code n8n
5. Render détectera automatiquement le fichier `render.yaml` et configurera les services

### 2. Configurez les variables d'environnement

Le fichier `render.yaml` définit déjà la plupart des variables d'environnement nécessaires. Cependant, vous devrez configurer manuellement les valeurs suivantes dans la base de données Render :

- `ENCRYPTION_KEY` : Une clé de chiffrement aléatoire pour n8n
- `BASIC_AUTH_USER` : Nom d'utilisateur pour l'authentification de base
- `BASIC_AUTH_PASSWORD` : Mot de passe pour l'authentification de base

### 3. Déployez l'application

1. Cliquez sur "Apply Blueprint"
2. Render créera automatiquement les services définis dans le fichier `render.yaml`
3. Attendez que le déploiement soit terminé

### 4. Accédez à votre instance n8n

Une fois le déploiement terminé, vous pourrez accéder à votre instance n8n à l'URL fournie par Render.

## Configuration supplémentaire

### Stockage persistant

Par défaut, n8n utilise SQLite comme base de données. Pour une utilisation en production, vous pourriez vouloir utiliser une base de données plus robuste comme PostgreSQL.

Pour configurer PostgreSQL :

1. Créez une base de données PostgreSQL sur Render
2. Ajoutez les variables d'environnement suivantes à votre service n8n :
   - `DATABASE_TYPE=postgresdb`
   - `DB_POSTGRESDB_HOST=<votre-hôte-postgres>`
   - `DB_POSTGRESDB_PORT=5432`
   - `DB_POSTGRESDB_DATABASE=<nom-de-votre-base-de-données>`
   - `DB_POSTGRESDB_USER=<votre-utilisateur-postgres>`
   - `DB_POSTGRESDB_PASSWORD=<votre-mot-de-passe-postgres>`

### Mise à l'échelle

Si vous avez besoin de plus de ressources, vous pouvez modifier le plan de votre service n8n dans le tableau de bord Render.

## Dépannage

Si vous rencontrez des problèmes lors du déploiement :

1. Vérifiez les journaux de votre service sur Render
2. Assurez-vous que toutes les variables d'environnement sont correctement configurées
3. Vérifiez que votre Dockerfile est correctement configuré

Pour plus d'informations, consultez la [documentation officielle de n8n](https://docs.n8n.io/) et la [documentation de Render](https://render.com/docs).
