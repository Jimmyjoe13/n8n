# Guide de déploiement sur Render

Ce document contient les étapes détaillées pour déployer n8n sur Render.

## Étape 1 : Préparer votre dépôt GitHub

1. Assurez-vous que votre code est sur GitHub. Si ce n'est pas le cas, créez un nouveau dépôt et poussez votre code.

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/votre-nom-utilisateur/n8n.git
git push -u origin main
```

## Étape 2 : Générer les clés de sécurité

1. Exécutez le script de génération de clés :

```bash
node generate-keys.js
```

2. Notez la clé de chiffrement générée, vous en aurez besoin lors de la configuration sur Render.

## Étape 3 : Créer un compte Render

1. Allez sur [Render](https://render.com/) et créez un compte si vous n'en avez pas déjà un.
2. Connectez votre compte GitHub à Render.

## Étape 4 : Déployer via Blueprint

1. Dans le tableau de bord Render, cliquez sur "New +" puis sélectionnez "Blueprint".
2. Sélectionnez votre dépôt GitHub contenant le code n8n.
3. Render détectera automatiquement le fichier `render.yaml` et configurera les services.
4. Cliquez sur "Apply Blueprint".

## Étape 5 : Configurer les variables d'environnement

1. Une fois les services créés, allez dans la section "Environment" de votre base de données.
2. Ajoutez les variables suivantes :
   - `ENCRYPTION_KEY` : Utilisez la clé générée à l'étape 2
   - `BASIC_AUTH_USER` : Choisissez un nom d'utilisateur
   - `BASIC_AUTH_PASSWORD` : Choisissez un mot de passe sécurisé

## Étape 6 : Vérifier le déploiement

1. Attendez que le déploiement soit terminé.
2. Cliquez sur l'URL fournie par Render pour accéder à votre instance n8n.
3. Connectez-vous avec les identifiants que vous avez configurés.

## Étape 7 : Configuration supplémentaire (optionnel)

Si vous souhaitez utiliser PostgreSQL au lieu de SQLite :

1. Créez une base de données PostgreSQL sur Render.
2. Mettez à jour les variables d'environnement de votre service n8n pour utiliser PostgreSQL.

## Dépannage

Si vous rencontrez des problèmes :

1. Vérifiez les journaux de votre service sur Render.
2. Assurez-vous que toutes les variables d'environnement sont correctement configurées.
3. Vérifiez que votre Dockerfile est correctement configuré.

Pour plus d'informations, consultez [RENDER_DEPLOYMENT.md](./RENDER_DEPLOYMENT.md).
