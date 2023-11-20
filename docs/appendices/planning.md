# Planning

## Étape 0/ Cadrage (Notre première réunion) : Deadline 25 Octobre

## Étape 1/ Construire le cahier des charges et prise en main de l’applications

Deadline 30 Octobre 2023

Votre première tâche consistera à définir le contexte et le périmètre du projet : j’attends que vous preniez vraiment le temps de bien comprendre les objectifs du projet et les exigences fonctionnelles. L’application est fonctionnelle mais ne respecte pas les exigences des principes DevOps.
L’objectifs de n’est pas construire l’application mais de travailler sur l’existant
Il faudra créer et importer l’application dans un repository Git dédié à l’équipe projet.
Rendu : J’attendrai également un schéma d’implémentation de la solution orientée DevOps.

## Etape 2/ Configurer, déployer et sécuriser l’infrastructure pour l’application

Deadline 10 Novembre 2023

Créer une architecture pour votre application en prenant en compte tous les composants de celle-ci. (Kubernetes, Vagrant..)
Sécuriser le déploiement et des connexions réseaux de votre application.
Votre application doit être hautement disponible.
Gérer les sauvegardes
Etapes Bonus:
Privilégier une solution d’Infrastructure as Code
Utiliser le cloud et ses services pour déployer votre application
Rendu : Scripts utilisés et déploiement de l’application sur votre architecture.

## Étape 3/ Ingestion et consommation des données

Deadline 20 Novembre 2023

Choisir la solution technique de stockage de données selon l’application et/ou une base de données :
Relationnelle
NoSQL
File system / Bloc Storage / Object Storage
Il faudra penser à l’architecture des données, notamment comment relier les différentes données entre elles.
Rendu : Tout document expliquant l’architecture choisie (Diagramme UML)
Fichier implémentant les bases de données ou/et le stockage
Fichier de requête

## Étape 4/ Configurer les pipelines pour automatiser les processus de compilation, de test, de déploiement et de livraison.

Deadline 25 Novembre 2023

C’est l’étape la plus importante de votre projet car elle constitue le cœur de votre projet et apprentissage en ingénierie DevOps
L’idée est d’automatiser le déploiement de l’application via une pipeline CI/CD.
Vous devrez créer deux environnements :
un environnement dédié au développement
un environnement dédié au production
Cela peut être une VM dédiée, des conteneurs, ou tout autre serveur de calcul. Il faut simplement que l’on puisse distinguer ces deux environnements.
Effectuer des tests automatisés avant le déploiement du code en production pour s’assurer que le code fonctionne correctement.

## Étape 5/ Définir des métriques et surveiller le système en production pour détecter les erreurs et les problèmes potentiels

## Etape bonus

Définir des métriques, des “points de santé” pertinent pour l’application
Création d’un dashboard pour donner du sens à la collecte de métrique.
Définir des seuils à partir duquel on considère qu’il y a un dysfonctionnement de l’architecture ou/et de l’application, cela doit déclencher une alarme.
Définir des actions automatiques en réponse à ces alarmes.

## Étape 6/ Démo + Soutenances

Semaine du 12 Décembre

Pour votre démo, il faudra que votre application soit :
organisée et documentée sur GitHub avec la procédure d’installation.
fonctionne sans bugs.

La soutenance DataScientest se déroule en groupe de la manière suivante :
20 minutes de présentation
10 minutes de questions de la part des membres du jury

Vous avez la possibilité de réaliser soit :
une présentation Powerpoint + Démo
toute la présentation de votre application sur GitHub

Pour valider le titre professionnel RNCP “Administrateur Système DevOps” RNCP36061. :
La session d’évaluation visant l’obtention du titre professionnel réunit un jury de professionnels du domaine, est organisée en présentiel à Paris et s’appuie sur plusieurs éléments :
Le Dossier professionnel (DP) complété par le candidat au plus tard 15 jours avant la session d’examens ;
La présentation du projet fil rouge réalisé en amont de la session ;
Le rapport écrit (format Word) ou dossier technique du projet.

Entretien technique ;
Questionnaire professionnel ;

## Entretien final.

Tous les détails concernant la validation se trouvent dans ce document :  RNCP
Voici un document pour vous aider à la rédaction du dossier projet et sa forme : Dossier Projet

---------------------------------------------------------------------------------------------------------------------------------------------------

Une attention particulière sera donnée à la forme des rendus intermédiaires. Notamment à l’organisation de votre projet Git, la communication et le travail d’équipe.
Si les rendus ne sont pas à la hauteur et délivrés à temps, votre projet ne pourra pas être validé.                                   
Vous l’aurez compris, le projet demande une implication conséquente et constitue pour cette raison un pilier de votre formation. Un bon projet sera le meilleur moyen pour vous de montrer que cette formation a été concluante et que vous êtes opérationnels !