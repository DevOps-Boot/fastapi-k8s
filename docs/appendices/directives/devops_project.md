# DevOps : Déploiement et cycle de vie d’une application

<!-- [TOC] -->

## Description détaillée

L’objectif de ce projet est de faire la démonstration pratique de la plupart des éléments techniques appris durant le cursus DevOps.

L’activité de DevOps dans une *équipe* est une activité de *support au développement* et d’*automatisation* des divers éléments pratiques nécessaires au bon fonctionnement d’une application.

Ce projet consiste à rassembler les aspects pratiques découverts dans les modules du cursus et de les combiner autour d’une *infrastructure* pour réaliser le *déploiement d’une application*, conformément aux *exigences de validation* de votre formation.

Les projets sont réalisés en groupe de **3 ou 4 personnes maximum**.


## Application : FastAPI Traefik

Dépôt GitHub de l'application disponible [ici](https://github.com/DataScientest/fastapi-docker-traefik)

Un exemple d’API générique en Python proposé par DataScientest.
Ce projet pourra convenir pour ceux qui souhaitent créer une application ou modifier celle-ci.

Pour les objectifs du projet, on vous demandera de déployer l’application avec un *déploiement en mode “micro-service”* sur un tout *nouvel environnement* de façon *sécurisée*.
Il faudra également y inclure un *point d’entrée (proxy) via **Traefik***.


> [Documentation Traefik](https://doc.traefik.io/traefik/)

Il y a plusieurs possibilités :

* Déployer cette application sur Kubernetes
* Déployer cette application sur le Cloud
* Déployer cette application sur un environnement local

L’application est simple, mais toute nouvelle fonctionnalité sera grandement appréciée et valorisée pour la validation du projet.

Ce projet convient également aux profils non à l’aise avec les langages de programmation.


## Planning et attendus du projet


### Cahier des charges


#### Description

Construire le cahier des charges et prise en main de l’application


#### Objectifs

Comprendre les objectifs du projet et les exigences fonctionnelles :

* Définition des besoins métiers et de l’application utilisée.
* Importation de l’application sur votre VCS
* Schéma d’implémentation
* Instancier un dépôt Git : l’organiser et le documenter
* Organiser la gestion du projet : Choix des méthodes


#### Modules / Masterclass / Modèles

* Documentation externe
* Dépôt GitHub
* Trello / Projet GitHub


#### Livrable et conditions de validation

* Cahier des charges au format PDF


### Infrastructure

#### Description

Configurer, déployer et sécuriser l'infrastructure pour l’application


#### Objectifs

Créer une architecture “micro-services” du projet avec une solution IaC :

* Conteneurisation et orchestration
* Choix des composants d'infrastructure de votre application (Front, Back, BDD...)
* Gérer le réseau et les ports de connexion
* La sécurité avec des protocoles chiffrés
* Architecture sur plusieurs serveurs ou instances : haute disponibilité
* Gestion des sauvegardes, Disaster Recovery


#### Modules / Masterclass / Modèles

Infrastructure :

* Docker
* Kubernetes
* Administration Linux et NGINX
* AWS (ECS, Kubernetes, EC2, auto-scaling, ELB, Route 53, ElasticBeanstalk)


#### Livrable et conditions de validation

Dépôt GitHub avec :

* Script système de sauvegarde
* Script application


### Gestion des données

#### Description

Ingestion et consommation des données


#### Objectifs

Définir la nature, la vélocité et le volume de données pour l’application :

* Choisir la solution technique de stockage de données selon l’application
* Créer la base de données si besoin pour stocker les données de l’application
* Programmer la sauvegarde des données de l’application
* Mettre en place les droits d’accès
* Ingestion des données dans l’application
* Consommation par les utilisateurs
* Gestion des logs

#### Modules / Masterclass / Modèles

* SQL
* MongoDB
* AWS (RDS, Dynamo DB, S3, EFS)

#### Livrable et conditions de validation

* Base de données fonctionnelle
* Stockage des logs
* Authentification / Autorisation


### Pipeline CI/CD

#### Description

Configurer les pipelines pour automatiser les processus de compilation, de test, de déploiement et de livraison.

#### Objectifs

* Éviter les erreurs humaines par l'automatisation.
* S'assurer que les déploiements se déroulent de manière efficace et fiable.
* Effectuer des tests automatisés et des tests d'intégration pour s'assurer que le code fonctionne correctement
* Déployer le code sur un environnement de production ou de test en utilisant des outils automatisé
* Intégrer le code source dans un environnement de développement centralisé
* Limiter les interruptions de déploiement/livraison continue (blue/green)
* Collecter les KPI afin de mesurer l'efficacité et le succès des pratiques DevOps. (Deployment Cycle Time, Deployment Frequency, Deployment Success Rate)


#### Modules / Masterclass / Modèles

Déploiement et automatisation :

* Jenkins
* Ansible
* Github Actions
* Circle CI/CD
* AWS (CodeBuild, CodePipeline, CodeCommit, CodeStar)

Tests :

* Unittest
* Pytest
* Selenium
* JUnit

#### Livrable et conditions de validation

Scripts dans le dépôt GitHub


### Supervision

#### Description

Définir des métriques et surveiller le système en production pour détecter les erreurs et les problèmes potentiels.

#### Objectifs

* En utilisant un système de supervision, qui comprend un serveur, des agents de collecte et une console de supervision, déployer les agents afin de collecter les indicateurs (métriques) définis.
* Configurer des tableaux de bord de surveillance pour suivre des métriques clés et configurer des alertes pour notifier les problèmes potentiels.
* Définir les valeurs seuils et créer des alarmes pertinentes selon les métriques mesurées
* Définir et créer des actions automatiques en réponse à ces alarmes
* Lorsque la console fait apparaître un défaut sur un indicateur, déterminer l’origine du problème
* Régulièrement, rapporter aux développeurs les statistiques de performance de leurs applications en production


#### Modules / Masterclass / Modèles

* Prometheus
* Grafana
* Datadog
* AWS (CloudWatch, EventBrige)


#### Livrable et conditions de validation

* Fonctionnement de la solution de monitoring
* Accès aux outils
* Tableau de bord


### Automatisation

#### Description

Automatiser le déploiement, de l'infrastructure des environnements et de l’application.


#### Objectifs

* Automatiser le déploiement de la configuration du serveur (IaC)
* Créer des modèles déclaratifs (YAML) pour déployer l’infrastructure, les environnements et l’application
* Utiliser les variables d’environnement pour sécuriser les données sensibles et éviter la redondance de modèles.
* Ces modèles seront réutilisables, répétables peu importe l’environnement déployé


#### Modules / Masterclass / Modèles

* Automatisation (IaC)
* Terraform
* AWS (CloudFormation)

#### Livrable et conditions de validation

* Dépôt GitHub avec modèles IaC fonctionnels

<!-- markdownlint-disable MD026 -->
## Compétences requises pour le titre R.N.C.P.
<!-- markdownlint-enable MD026 -->

Pour le diplôme RNCP, le projet couvre obligatoirement les compétences suivantes :

* **Automatiser le déploiement d'une infrastructure**
* **Architecture micro-services : gérer des conteneurs**
* **Exploiter une solution de supervision**

<!-- markdownlint-disable MD026 -->
## Condition de validation du titre R.N.C.P.
<!-- markdownlint-enable MD026 -->

Le projet donne lieu à deux productions :

* Un **dossier de projet** à remettre au jury
* Un **support de présentation** de type diaporama

### Dossier de projet

Le dossier de projet est **individuel** et **respecte le plan type** suivant :

* **Cahier des charges** ;
* **Spécifications techniques** du projet
  * Élaborées par le candidat,
  * Comprenant de préférence un **schéma** de l’*infrastructure* à déployer et/ou de l’*application* à mettre en production ;
* Description de la **démarche** et des **outils** utilisés ainsi que des **collaborations** éventuelles avec les autres équipes ;
* **Réalisations** du candidat comportant les *configurations* et *scripts* les plus significatifs accompagnés d'un argumentaire ;
* **Description d’une situation de travail** ayant nécessité une *recherche* effectuée par le candidat durant le projet.


### Support de présentation

Le candidat présente **individuellement** son projet à l’aide d’un support de présentation de type diaporama réalisé en amont de l’épreuve, et selon ce canevas :

* Présentation de l’entreprise et/ou du service ;
* Contexte du projet (cahier des charges, contraintes, livrables attendus) ;
* Présentation de l’infrastructure à déployer et/ou de l’application à mettre en production ;
* Présentation d’un exemple significatif du travail réalisé par le candidat ;
* Présentation d’un exemple de recherche effectuée ;
* Synthèse et conclusion (satisfactions et difficultés rencontrées).

Informations complémentaires concernant l’entretien technique :

* L'entretien technique se déroule obligatoirement à l'issue de la présentation du projet réalisé en amont de la session.


## Diplôme certifié DataScientest


### Généralités validation DataScientest

* Les exigences et le contenu du projet seront **identiques.**
* Vous travaillerez **en groupe**.
  Ne s’applique pas aux apprenants en alternance ou projets individuels.
* Tous les groupes de projets seront encadrés par **un mentor**.
* Une réunion par sprint pour faire le point sur les avancements.
* Un salon dédié sur Slack pour votre projet avec votre mentor sera à votre disposition.
* L'évaluation finale repose sur deux éléments :
  * la **soutenance** et
  * votre **livrable** du projet (GitHub, GitLab...)


### Critères d’éligibilité au projet

* **Valider les modules** du premier sprint :
  * Python 101 DevOps
  * Virtualisation et Vagrant
  * Introduction à Linux et Bash
* Valider le module **Administration des systèmes Linux**


### Critères d'évaluation des travaux

* Qualité des **rendus intermédiaires** :
  Pas d’obligation de résultats, mais une obligation d’effort.
* Gestion de votre temps et de votre effort.
* Preuve de travail en équipe.
  Ne s’applique pas aux apprenants en alternance ou projets individuels.
* Communication et suivi avec votre mentor.
* Prise de recul sur le sujet.


!!! note
    Le mentor n’est pas un membre de l’équipe.
!!!


### Conditions de validation (Bootcamp & POEI & Continue)

* **Remise du dépôt GitHub en bonne et due forme** :
  * Production organisée et fonctionnelle.
  * Documentation, “README” avec procédure d’installation du projet.

* **Soutenance finale en groupe de 35 minutes**
  * 10 Minutes de présentation
  * 10 minutes de démonstration
  * 15 minutes questions / réponses
