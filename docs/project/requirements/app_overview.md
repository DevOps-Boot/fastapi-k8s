# Presentation de l'application

Voici une succincte description de l’application, point de départ du projet DevOps.

L'application est actuellement une implémentation de FastAPI, conçue pour une exécution dans un environnement Dockerisé.

Elle utilise Traefik comme reverse proxy et gestionnaire de certificats SSL, ce qui renforce la sécurité des échanges de données.

Les données utilisateur sont gérés à l'aide d'une base de données PostgreSQL assurant fiabilité et performance.

Cette approche centralisée facilite la gestion et le déploiement sur une seule machine ou serveur.


## Présentation des composants de l'application

On peut décrire les différents composants comme suit:

### FastAPI

FastAPI est un framework web moderne et réputé, conçu pour la création d'APIs avec Python, qui offre des performances élevées et une écriture de code facile et intuitive.

La validation des données et la sérialisation sont automatiquement gérées, réduisant ainsi le travail manuel et les risques d'erreur.

FastAPI supporte la programmation asynchrone, permettant la gestion efficace de requêtes simultanées, ce qui est particulièrement utile pour les opérations d'entrée/sortie ou pour les services qui doivent gérer de nombreuses connexions simultanément.


### Docker

Docker, un outil qui permet de 'containeriser' l'application pour un déploiement et une gestion simplifiés.

Le code est structuré et pensée pour un déploiement via Docker.


### Traefik

Traefik joue un double rôle.

D'une part, il agit comme un reverse proxy gèrant le routage et redirigeant les requêtes vers les bons services de l'application.

D'autre part, il sert de gestionnaire de certificats SSL, une fonctionnalité essentielle pour sécuriser les communications, les échanges de données sur Internet.

Cette intégration montre un souci de sécurisation et d'optimisation du trafic réseau.


### PostgreSQL

PostgrèsSQL est chargé de gérer, stocker les données utilisateur.
Il est reconnu pour sa robustesse, sa fiabilité, sa stabilité, sa performance et sa conformité aux standards SQL.

L'ensemble du code montre une cohérence dans le choix des technologies qui s’intègrent parfaitement ensemble.


## Description de l'architecture monolithique

Dans son format d’origine, l’application est structurée en tant que système monolithique.
Ceci signifie que toutes ses composantes fonctionnelles - base de données, traitement des données, interface utilisateur - sont intégrées dans une unique répertoire de code source.
Cette architecture centralisée facilite la gestion et le déploiement.


### Avantages

Cette architecture offre des avantages initiaux tels que la simplicité de développement et de déploiement.
En effet, en concentrant toutes les fonctions en un seul point, la coordination entre différents composants est intrinsèquement simplifiée, réduisant ainsi la complexité de communication entre divers modules.


### Limites de l'architecture monolithique*

Toutefois, cette architecture présente des limites, notamment en termes de scalabilité et de flexibilité. Avec l'évolution des besoins et des fonctionnalités, le système monolithique peut devenir lourd et difficile à maintenir. Chaque mise à jour ou modification nécessite le redéploiement de l'intégralité de l'application, ce qui augmente les risques d'erreurs et de temps d'arrêt. En outre, les performances peuvent être affectées par la taille croissante de l'application. Le système monolithique devient moins réactif et plus difficile à optimiser. La sécurité peut également devenir une préoccupation, car une faille dans un composant pourrait potentiellement compromettre l'ensemble du système.


## L'évolution vers le cloud et l'architecture micro-services

### Transition, réflexion sur l'Évolution vers le Cloud et l'architecture micro-services

Face à ces défis, nous allons repenser l'architecture de l'application pour mieux répondre aux exigences modernes de scalabilité, de performance et de sécurité.

C'est dans ce contexte que l'idée de la faire évoluer vers une architecture orientée micro-services, déployée dans un environnement cloud, que notre projet prendra forme.


### Objectif

Le projet s'orientera donc vers une migration de l'application vers le cloud, en utilisant les méthodes DevOps apprises en cours.

Bien que la structure monolithique actuelle soit maintenue, l'objectif est d'optimiser son déploiement et sa gestion dans le cloud, en exploitant les avantages des technologies et pratiques DevOps, sans nécessairement procéder à une restructuration complète ou au développement de nouvelles fonctionnalités, compte tenu des contraintes de temps.
