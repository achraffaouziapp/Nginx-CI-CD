
# Nginx CI/CD - Niveau 1

## Description
Ce dépôt `nginx-ci-demo` est une **démo de pipeline CI/CD niveau 1**. 
Il contient un projet Nginx simple avec :
- Une page HTML (`index.html`)
- Une configuration Nginx (`default.conf`)
- Un Dockerfile pour construire l'image Nginx

Grâce à **GitHub Actions**, le pipeline s’exécute automatiquement à chaque push ou pull request vers la branche `main` : il construit l’image Docker, teste la configuration Nginx et vérifie que le serveur répond sur HTTP.  
L’intérêt pédagogique est de montrer comment **l’intégration continue détecte automatiquement les erreurs** avant le déploiement.

## Schéma du pipeline CI/CD

```
Commit / Pull Request
        │
        ▼
  GitHub Actions Trigger
        │
        ▼
  Build Docker Image
        │
        ▼
  Test Nginx Configuration (nginx -t)
        │
        ▼
  Run Nginx Container & Test HTTP
        │
        ▼
Pipeline Status: Success / Failed
```

## Contenu du pipeline

1. **Build Docker image** : construction de l'image avec le Dockerfile.
2. **Test Nginx configuration** : vérifie que la configuration du serveur est correcte.
3. **Run Nginx container & Test HTTP** : lance le conteneur et teste que la page web est accessible.
4. **Validation automatique** : si une étape échoue, le pipeline est marqué `Failed` pour empêcher l’intégration de code erroné.


## Remarques
- Le pipeline montre comment un **pipeline CI peut détecter les erreurs** automatiquement.  
- Si la configuration Nginx est volontairement cassée, le pipeline échouera et signalera l’erreur.
