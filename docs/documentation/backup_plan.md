# Plan de sauvegarde
=======

## Contexte 

Toutes les informations importantes sont réparties de la façon suivante :

Dans Github, nous avons un réfrentiel qui contient 
* les différents manifestes qui composent notre Infrastructure As Code (IaC) déployés sur AWS.
* les pipelines CI/CD
* le code de notre application FastAPI

Dans AWS ECR, notre image de l'application Docker est générée dynamiquement à partir des manifestes présents sur GitHub.

Dans Terraform Cloud, l'état de notre déploiement dans le cloud AWS est géré, stocké, sauvegardé par le service Terraform Cloud. Dans une entreprise nous aurions sauvegardé et externalisé dans un AWS bucket S3 par exemple, toutefois dans le cadre de notre projet nous confions la sauvegarde à Terraform Cloud. 

Dans la base de données PostgreSQL, sont stockées les données utilisées par notre application FastAPI

## Notre choix

En conséquences notre plan de sauvegarde sera focalisé sur les données de FastAPI qui seront localisées dans la base de données PostgreSQL. 
D'une part parce que nous faisons confiances à Github pour le périmètre de notre projet. D'autre part, nous disposons d'un clone du projet sur nos machines. 
Dans une entreprise, nous aurions eu plus de temps pour envisager d'utiliser un outil tiers pour sauvegarder notre référentiel. 
 
Notre application FastAPI est immuable grâce à l'utilisation des images docker. 
Les sauvagardes des fichiers dans les pods n'est donc pas nécessaire. 

### Choix de l'outil de sauvegarde de la base de données.

Nous utilisons les capacités de notre postgres-operateur pour créer des sauvergardes automatiques dans un bucket S3 dans une régions us-east-1.
Nous allons donc précisé dans la documentation l'impémentation de l'outil.

### Stratégie de sauvegarde

* Le cluster est répliqué dans 3 AZ AWS ce qui le rend hautement disponibile. Nous avons donc une première sécurisation des données car la sauvegarde reste opérationnelle avec une AZ indisponible.
* LesClusters et le Bucket S3 qui stocke les sauvegardes sont dans des régiosn différentes. Ce qui nous garantie la disponibilité des données. 

---

## I - Configuration de la sauvegarde

## 1.1 Mise en oeuvre

> **IMPORTANT**
> 
> Cette manipulation sera réalisée manuellement sur la console AWS, sélectionner le service IAM
> * Nous devons créer un nouvel utilisateur "de service" IAM 
> * Générer une clé d'accès pour cet utilisateur IAM
>
> Manipulation manuelle depuis la Console AWS, sélectionner le service S3
> * Créer l'objet S3 bucket
> * Autoriser le rôle et les accès à dédier à l'utilisateur IAM
>
> Cette étape ne doit pas être répétée. Il parait suffisant de le réaliser manuellement et de bien le documenter ainsi il sera aisé de reproduire le déploiement à l'identique.


### Prérequis

- Accéder au site (https://aws.amazon.com/fr/console/)
- Se connecter en tant qu'utilisarteur IAM, avec notre compte (ID de compte, Nom d'utilisateur, mot de passe)
- Se positionner sur la région de
  * Paris pour gérer le service IAM
  * Californie pour le service S3. (limitation de notre compte IAM Datascientest)


### 1.2 Création d'un compte utilisateur

Le rôle IAM permet l'accès au Service S3 pour stocker les fichiers de sauvegarde. 

Ce rôle se différentie de notre accès IAM principal car il aura des privilèges limités car:
* il aura **accès uniquement au Bucket S3**,
* ses **permissions seront défines au stricte nécessaire** pour préserver les données en cas d'attaque.

#### Procédure

- Ouvrir le Console "Identity and Access Management (IAM)"
- Région Paris
- Selectionner Gestion des accès / Utilisateurs
- Bouton Créer un utilisateur

  * Nommer l'utilisateur (le nom n'a pas d'importance) : eks-srvuser
  * Pas d'accès console nécessaire, ne pas cocher.
  * Sélectionner "Ajouter un utilisateur à un groupe", suivant
  * Bouton "Créer un utilisateur"

- Selectionner l'utilisateur créé

  * **Relever la reférence ARN**


### 1.3 Générer la clé d'accès du rôle IAM

La clé d'accès du rôle IAM est la methode d'authentification utilisée afin de permettre  l'accès au Bucket S3. Cette information sera ensuite renseignée dans les manifestes helm postgres.

#### Procédure

Poursuivons dans la même fenêtre

- Selectionner l'onglet: "Information d'identification de sécurité"
- Bouton "Créer une clé d'accès"
- Cas d'utilisation: "Interface de ligne de commande (CLI)", cocher "Je comprends les recommandations...", suivant.
- Renseigner la description "Description de la valeur d'identification", bouton "Créer une clé d'accès"
- Important, bien **Récupérer les clés d'accès** (Clé d'accès et d'accès secrète)
- Bouton "Terminer".


### 1.4 Créer le Bucket S3

Le bucket S3 est un service géré dans le cloud par AWS parfaitement adapté à notre besoin.
Les sauvegardes de la base de données PostgreSQL seront stockées dans cette ressource.
Les buckets S3 permettent une combinaison de classes de stockage qui stockent de manière redondante des objets dans plusieurs zones de disponibilité.

On utilise pas `Object lock` ou `chiffrement par défaut` pour simplifier notre installation, mais avec Object Lock nous pouvons préciser pendant combien de temps les objets ne peuvent pas être modifié. En cas d’attaque, les objets seront sécurisés et conserveront leurs intégrités. Les données reste fiable et accessible.  

#### Procédure

- Ouvrir le Console "Amazon S3"
- Bouton "Créer un compartiment" ou "Bucket"
- Région AWS, selectionner USA Est (Californie du Nord) us-east-1
- Type: "usage général"
- Nom du compartiement (bucket name): "devops-boot-s3backup".

  Atttention, il doit être **unique** dans l'espace de nommage global!

- Le type de chiffrement par défaut (Objet lock): "Chiffrement côté serveur avec des clés gérées par Amazon S3 (SSE-S3)"
- Section Clé de compartiement: "Désactivée"
- Bouton: "Créer un compartiement"

Une fois créé, afficher les détails du bucket "devops-boot-s3backup", dans l'onglet "Propriétés", **relever la chaine ARN** (Amazon Ressource Name): "arn:aws:s3:::devops-boot-s3backup"


### 1.5 Attribuer les permissions au rôle IAM et Sécuriser

Cette étape consiste à créer, attribuer les accès nécessaires et limités pour permettre le processus de sauvegarde et de restauration qui seront réalisés par l'opérateur PostgreSQL.

#### Procédure

Poursuivons dans la même fenêtre:

- Selectionner l'Onglet "Permission"
- Bucket Policy, "Editer"
- Lancer le "AWS Policy Generator" pour générer le code JSON standard:

  - Step 1 - Policy Type selectionnée : S3 Bacuket Policy
  - Step 2 - Add Statement(s):
    * Effect : allow (Objectif est d’autoriser, permettre l’accès) 
    * Principal : arn:aws:iam::424571028400:user/eks-srvuser (Notre utilisateur IAM role pour l’accès)
    * Actions : All actions (temporaire)
    * Amazon Ressource Name (ARN) : arn:aws:s3:::devops-boot-s3backup (Notre bucket fraichement créé)
  - Step 3 - "Generate Policy".
  
    Il s’agit de valider nos choix. Une seule règle est nécessaire dans notre cas.

  - Copier / Coller du code dans notre espace Bucket Policy.
  - Bouton "Save changes"

Désormais, notre utilisateur ("principal") a accès au Bucket.

Il est maintenant nécessaire d'adapter la politique générée à nos besoins (niveau d'accès, ressources concernées) et nos données spécifiques, en l'occurence, les informations que nous avons relevées plus tôt.


```json
{
    "Version": "2012-10-17",
    "Id": "Policy1702545271204",
    "Statement": [
        {
            "Sid": "Stmt1702545224877",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::424571028400:user/eks-srvuser"   # AWS user account
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::devops-boot-s3backup",     # Bucket S3 path
                "arn:aws:s3:::devops-boot-s3backup/*"    # Bucket S3 level access.
            ]
        }
    ]
}
```
***Règle JSON personnalisée attribuée au compartiement (JSON Bucket policy)***


### 2.1 - Installer et utiliser K9S pour superviser Kubernetes

<!-- TODO Split out and expand -->

```console
sudo apt-get install snapd
sudo snap install k9s

### 2.2 Configurer le Cluster Postgres

Cette partie se décompose en plusieurs sous-étapes:

- Rechercher les paramètres nécessaires pour consituer la configuration adéquate
- Configuer les manifestes helm
- Déterminer les variables et les informations sensibles, secrètes puis les sécuriser.
- Tester les permissions et accès du rôle IAM
- Déployer la configuration
- Vérifier le fonctionnement, les tests.

#### Les parémétrages

Postgres-operateur est installé comme un Helm chart.
Il a été configuré pour la mise en oeuvre de le cluster posgreSQL composé de ses 3 pods. 

Pour réaliser le paramétrage, nosu avons été amené à effectuer des recherches en compélement sur le site officiel et sur des blogs spécialisées.

Un fichier de ConfigMap est utilisé pour les variables et secret.
Les accès sont gérés avec des paires de clés pour se connecter sur les ressources AWS. 
La configuration est déployées avec le code IaC.

##### Configuration générale

Dans ce fichier, Postres-Operateur en tant que Helm Chart apporte la configuration spécifique dans le ConfigMap qui sera interprété par Kubernetes. Il précise les valeurs personnalisées à prendre en compte. Nous précisons ici l'emplacement où aller les chercher. (voir le contenu du fichier ci-dessous)

```console
    file("${path.module}/postgres-operator/postgres-operator-values.yaml")
  ]
```
Extrait du Fichier : /fastapi-k8s/terraform/deployments/releases/postgres_operator.tf

##### Configuration de la sauvegarde

**La configuration - "postgres_operator.tf" :**

Le values "configKubernetes.pod_environment_configmap" précise le configmap qui contient l'information des configuration des cluster postgres dans notre environment.

Chaque pod utilise l'information, les valeurs du configMap "postgres-operator-pod-config". 
L'emplacement du backup est précisé par le nom de la région : "us-east-1"  
```console
configKubernetes:
  pod_environment_configmap: "postgres-operator-pod-config"
configAwsOrGcp:
  aws_region: "us-east-1"
```


**Le ConfigMap - pod-config.yaml :**

On utulise le ConfigMap pour itnitialiser les variables d'environnement dans chaque pod Postgres.
Parmi les variables d'environnement qui sont dans le ConfigMap, il y 2 parties :

Dans cette configuration, nous précisons, 
* le nom du bucket, 
* la methode de sauvegarde WAL,
* le planning de sauvegarde,
* les secrets, pour avoir accès au backup AWS S3, la paire de clé.
* La rotation des backup, avec le nombre de backup à conserver  
* Extrait du Fichier : /fastapi-k8s/helm/postgres-operator-config/templates/pod-config.yaml :

#### Procédure
```console
  # Backup definition
  WAL_S3_BUCKET: devops-boot-s3backup         # Préciser le nom du Backet
  WAL_BUCKET_SCOPE_PREFIX: ""
  WAL_BUCKET_SCOPE_SUFFIX: ""
  USE_WALG_BACKUP: "true"                     # Activation de la sauvegarde avec la methode WAL
  USE_WALG_RESTORE: "true"                    # Activation de la restauration
  BACKUP_SCHEDULE: '00 12 * * *'              # Planning de sauvegarde chaque 12h UTC
  AWS_ACCESS_KEY_ID: {{ .Values.s3_backup_aws_access_key_id }}     # La paire de Clés d'accès AWS S3 pour accéder au Bucket ID et et CLE
  AWS_SECRET_ACCESS_KEY: {{ .Values.s3_backup_aws_secret_access_key }}
  AWS_REGION: us-east-1                      # La régions de notre Bucket S3 
  WALG_DISABLE_S3_SSE: "true"                # Le chiffrement est désactivé
  BACKUP_NUM_TO_RETAIN: "5"                  # Nombre de backup à conserver
```

##### Configuration de la restauration 

Dans cette configuration, nous précisons ce qui se passe à l'initialisation du Cluster
* On va gérer l'accès AWS S3 avec les paires de clés, préciser la région, mentionner le nom du bucket concerné par la restauration.
* On veut restaurer la dernière sauvegarde.
> Il s'agit de prendre la dernière sauvegarde pour restaurarer l'état.
> Le master est restauré, puis les replicas ont le choix d'aller chercher les données dans le backup puis de > se synchroniser avec le master, soit ils font un transfert de données du master.
> Selon le pourcentage de modification du master, l'idée est de solliciter le master le moins possible. plus > de 30%, il restaure à partir du master. A moins de 30%, ils restaurent à partir du backup.
* Extrait du Fichier : /fastapi-k8s/helm/postgres-operator-config/templates/pod-config.yaml :

#### Procédure
```console
  # Auto restore at cluster initiation
  CLONE_AWS_ACCESS_KEY_ID: {{ .Values.s3_backup_aws_access_key_id }}  # La paire de clé, l'authenbtification.
  CLONE_AWS_SECRET_ACCESS_KEY: {{ .Values.s3_backup_aws_secret_access_key }}
  CLONE_AWS_REGION: us-east-1                   #La région où se situe le Bucket S3
  CLONE_METHOD: CLONE_WITH_WALE                 # La methode de clonage, de sauvegarde
  CLONE_WAL_BUCKET_SCOPE_PREFIX: ""
  CLONE_WAL_S3_BUCKET: devops-boot-s3backup    # Le nom du bucket à restaurer
```

Cette configuration est globale pour notre postres-cluster, quelques soit le nombre de cluster. Chaque cluster créé dans notre Kubernetes sera automatiquement configuré pour la sauvegarde et la restauration.   

En complément, au niveau du cluster des précisions sont à prendre en compte.
Dans la configuration de Postrgres-cluster, nous devons spécifier quel cluster doit être restauré parmis les backup, dons notre cas, c'est "fastapi-db".

> Note : 
> fastapi-db = nom du cluster 
> fastapi_traefik = nom d'utilisateur dans la base de données
> fastapi_traefik = nom de la base de données

#### Procédure
Extrait Fichier helm : /fastapi-k8s/helm/postgres-cluster/templates/postgres.yaml :
```console
  env:
    - name: CLONE_SCOPE
      value: fastapi-db
```

#### Contraintes

* L'opérateur PostGresSQL doit être dans le namespace default.

  Sinon, un paramétrage complémentaire RBAC est nécessaire.
  
* Nous avons pu observer que, en cas d'erreur, l'outil effectue une restauration automatiquement.

  Il faudra inclure un controle d'intégrité de la sauvegarde ?


## 3.1 La sauvegarde

La sauvegarde est planifiée. 
Il réalise un clone, puis effectue un baseBackup (snapshot) pour qui est sockée sur S3 Bucket. 

Une autre sauvegarde, configuré par défaut, s'éxécute après le déploiement du cluster.

## 3.2 La restauration

La restauration est réalisée automatiaquement si on démarre un cluster vide. 
Pour rappel, nous avons 3 pods postesgres, chacun dans une AZ différentes. Un master et 2 réplicas configuré par défaut dans un environnement.

## 3.3 Les commandes utiles

```console
terraform apply -auto-approve
terraform destroy -auto-approve
```

## Sources de documentation

* Documentation officielle de Zalando Postgres-Operator
> La documentation générale. Elle comprend tous les apects de l'administration général de l'opérateur.
> Cette documentation est difficile à suivre.
(https://github.com/zalando/postgres-operator/blob/master/docs/administrator.md)

* Création de la clé d'accès pour le Rôle IAM
(https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

* Prérequis et Configuration de Zalando Postgres-Operator 
(https://github.com/zalando/postgres-operator/blob/master/docs/administrator.md#using-aws-s3-or-compliant-services)

* Comment installer, configurer et sauvegarder avec Postres-Operator Zalando
(https://medium.com/@zkapishov/zalando-postgres-operator-in-production-the-way-of-helm-ccfd639ccb2d)

* Artlicle du mois de mars 2023, Support pour la Configuration de S3
> Mise en place des sauvegardes en utilisant Zalando
(https://thedatabaseme.de/2022/03/26/backup-to-s3-configure-zalando-postgres-operator-backup-with-wal-g/)

* Article du mois de mai 2023, Support pour la Configuration de S3
> Mise en oeuvre de la restauration
(https://thedatabaseme.de/2022/05/03/restore-and-clone-from-s3-configure-zalando-postgres-operator-restore-with-wal-g/)


