
# Nginx CI/CD Demo - Niveau 2

## Description
Ce dépôt `nginx-ci-demo` est une **démo de pipeline CI/CD niveau 2**. 
Il contient un projet Nginx simple avec :
- Une page HTML (`index.html`)
- Un endpoint `/health` (`health.html`) pour vérifier la disponibilité du service
- Une configuration Nginx (`default.conf`)
- Un Dockerfile pour construire l'image Nginx

Grâce à **GitHub Actions**, le pipeline s’exécute automatiquement à chaque push ou pull request vers la branche `main` : il construit l’image Docker, teste la configuration Nginx, vérifie que les fichiers essentiels existent et teste que le serveur répond sur HTTP, y compris le endpoint `/health`.  
L’intérêt pédagogique est de montrer comment **la CI peut détecter les erreurs et vérifier le service automatiquement** avant tout déploiement.

## Schéma du pipeline CI/CD Niveau 2

```
Commit / Pull Request
        │
        ▼
  GitHub Actions Trigger
        │
        ▼
Vérification des fichiers essentiels (index.html, default.conf, Dockerfile)
        │
        ▼
  Build Docker Image
        │
        ▼
  Test Nginx Configuration (nginx -t)
        │
        ▼
  Run Nginx Container & Test HTTP + /health
        │
        ▼
Pipeline Status: Success / Failed
```

## Contenu du pipeline

1. **Vérifier les fichiers essentiels** : s’assure que tous les fichiers critiques sont présents.
2. **Build Docker image** : construction de l’image Nginx personnalisée.
3. **Test Nginx configuration** : vérifie la syntaxe Nginx pour éviter des erreurs de déploiement.
4. **Run Nginx container & Test HTTP + /health** : lance le conteneur et teste que la page principale et le endpoint `/health` répondent correctement.
5. **Validation automatique** : si une étape échoue, le pipeline est marqué `Failed`.

## Instructions pour lancer le projet en local (optionnel)

```bash
# Construire l'image Docker
docker build -t nginx-ci-demo .

# Lancer le conteneur
docker run -p 8080:80 nginx-ci-demo

# Vérifier dans le navigateur
http://localhost:8080
http://localhost:8080/health
```

## Remarques
- Le pipeline montre comment un **pipeline CI peut détecter automatiquement les erreurs** et vérifier que le service est disponible.
- Si la configuration Nginx est volontairement cassée ou un fichier est manquant, le pipeline échouera et signalera l’erreur.
