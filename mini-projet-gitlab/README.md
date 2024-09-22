# Projet : Création d'une Pipeline CI/CD avec GitLab

## Objectif
L'objectif de ce projet est de créer une pipeline d'intégration continue (CI) et de déploiement continu (CD) pour le déploiement d'une application web sur un serveur accessible via SSH. L'apprenant devra mettre en œuvre les étapes nécessaires pour garantir la qualité et la sécurité du code tout en automatisant le processus de déploiement.

## Étapes de la Pipeline CI/CD

La pipeline doit inclure les étapes suivantes :

1. **Pre-commit**
   - Validation des modifications avant le commit.

2. **Compilation**
   - Compilation du code source.

3. **Scan de Sécurité (Image Docker)**
   - Analyse de l'image Docker pour détecter les vulnérabilités de sécurité.

4. **Tests Automatisés**
   - Exécution de tests unitaires et d'intégration.

5. **Vérification de la Qualité de Code**
   - Analyse statique du code pour respecter les normes de qualité.

6. **Packaging**
   - Création d'un package déployable de l'application.

7. **Déploiement en Review**
   - Déploiement de l'application dans un environnement de revue.

8. **Staging**
   - Déploiement dans un environnement de pré-production.

9. **Production**
   - Déploiement final dans l'environnement de production.

10. **Tests de Validation des Déploiements**
    - Vérification que le déploiement a réussi et que l'application fonctionne comme prévu.

## Modèle Gitflow

- Sur la **branche principale** (`main`), toutes les étapes doivent être exécutées, sauf le déploiement en review.
- Sur les **autres branches**, seules les étapes suivantes doivent être exécutées :
  - Pre-commit
  - Compilation
  - Scan de Sécurité (Image Docker)
  - Tests Automatisés
  - Vérification de la Qualité de Code
- Lors d'une **Pull Request (PR)**, en plus des étapes précédentes, les étapes de packaging et de déploiement en review doivent être exécutées.

## Exigences Techniques

- Utiliser un fichier `.gitlab-ci.yml` pour définir la pipeline.
- S'assurer que le script est optimal et respecte les meilleures pratiques de CI/CD.

## Résultats Attendus

À la fin de ce projet, l'apprenant doit être capable de :

- Configurer une pipeline CI/CD complète avec GitLab.
- Déployer une application web de manière sécurisée et automatisée.
- Garantir la qualité et la sécurité du code à chaque étape du processus de développement.

## Ressources

- [Documentation GitLab CI/CD](https://docs.gitlab.com/ee/ci/)
- [Meilleures pratiques CI/CD](https://docs.gitlab.com/ee/topics/gitlab_ci_cd_best_practices.html)
