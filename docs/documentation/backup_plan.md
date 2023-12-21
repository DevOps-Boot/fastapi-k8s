Plan de sauvegarde
=======

# Contexte 

Toutes les informations importantes sont réparties de la façon suivante :

Dans Github, nous avons un réfrentiel qui contient 
* les différents manifestes qui composent notre Infrastructure As Code (IaC) déployés sur AWS.
* les pipelines CI/CD
* le code de notre application FastAPI

Dans AWS ECR, notre image de l'application Docker est générée dynamiquement à partir des manifestes présents sur GitHub.

Dans Terraform Cloud, l'état de notre déploiement dans le cloud AWS est géré, stocké, sauvegardé par le service Terraform Cloud. Dans une entreprise nous aurions sauvegardé et externalisé dans un AWS bucket S3 par exemple, toutefois dans le cadre de notre projet nous confions la sauvegarde à Terraform Cloud. 

Dans la base de données PostgreSQL, sont stockées les données utilisées par notre application FastAPI

# Notre choix

En conséquences notre plan de sauvegarde sera focalisé sur les données de FastAPI qui seront localisées dans la base de données PostgreSQL. 
D'une part parce que nous faisons confiances à Github pour le périmètre de notre projet. D'autre part, nous disposons d'un clone du projet sur nos machines. 
Dans une entreprise, nous aurions eu plus de temps pour envisager d'utiliser un outil tiers pour sauvegarder notre référentiel. 
 
Notre application FastAPI est immuable grâce à l'utilisation des images docker. 
Les sauvagardes des fichiers dans les pods n'est donc pas nécessaire. 

# Choix de l'outil de sauvegarde de la base de données.

Nous utilisons les capacités de notre postgres-operateur pour créer des sauvergardes automatiques dans un bucket S3 dans une régions us-east-1.
Nous allons donc précisé dans la documentation l'impémentation de l'outil. 

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

Accéder au site (https://aws.amazon.com/fr/console/)
se connecter en tant qu'utilisarteur IAM, avec notre compte (ID de compte, Nom d'utilisateur, mot de passe)
Se positionner sur la région de
* Paris pour gérer le service IAM
* Californie pour le service S3. (limitation de notre compte IAM Datascientest)

### 1.2 Création d'un compte utilisateur


Le rôle IAM permet l'accès au Service S3 pour stocker les fichiers de sauvegarde. 
Ce rôle se différentie de notre accès IAM principale car il aura des privilèges limités d'une part car il aura **accès uniquement au Bucket S3** et d'autre part ses **permissions seront défines au stricte nécessaire** pour préserver les données en cas d'attaque.

**Procédure**

* Ouvrir le Console "Identity and Access Management (IAM)"
* Région Paris
* Selectionner Gestion des accès / Utilisateurs
* Bouton Créer un utilisateur
  * Nommer l'utilisateur (le nom n'a pas d'importance) : eks-srvuser
  * Pas d'accès console nécessaire, ne pas cocher.
  * Sélectionner "Ajouter un utilisateur à un groupe", suivant
  * Bouton "Créer un utilisateur"

* Selectionner l'utilisateur créé
  * **Relever la reférence ARN**

### 1.3 Générer la clé d'accès du rôle IAM

La clé d'accès du rôle IAM est la methode d'authentification utilisée afin de permettre  l'accès au Bucket S3. Cette information sera ensuite renseignée dans les manifestes helm postgres.

**Procédure**

* Poursuivons dans la même fenêtre
  * selectionner l'onglet: "Information d'identification de sécurité"
  * Bouton Créer une clé d'accès
  * Cas d'utilisation: "Interface de ligne de commande (CLI)", cocher "Je comprends les recommandations...", suivant.
  * Renseigner la description "Description de la valeur d'identification", bouton "Créer une clé d'accès"
  * Important, bien **Récupérer les clés d'accès** (Clé d'accès et d'accès secrète)
  * Bouton Terminer.

### 1.4 Créer le Bucket S3

Le bucket S3 est un service géré dans le cloud par AWS parfaitement adapté à notre besoin.
Les sauvegardes de la base de données PostgreSQL seront stockées dans cette ressource.
Les buckets S3 permettent une combinaison de classes de stockage qui stockent de manière redondante des objets dans plusieurs zones de disponibilité.

On utilise pas `Object lock` ou `chiffrement par défaut` pour simplifier notre installation, mais avec Object Lock nous pouvons préciser pendant combien de temps les objets ne peuvent pas être modifié. En cas d’attaque, les objets seront sécurisés et conserveront leurs intégrités. Les données reste fiable et accessible.  

**Procédure**

* Ouvrir le Console "Amazon S3"
* Bouton "Créer un compartiment" ou "Bucket"
* Région AWS, selectionner USA Est (Californie du Nord) us-east-1
* Type: "usage général"
* Nom du compartiement (bucket name): "devops-boot-s3backup", Atttention, il doit être unique dans l'espace de nommage global!
* Le type de chiffrement par défaut (Objet lock): "Chiffrement côté serveur avec des clés gérées par Amazon S3 (SSE-S3)"
* Section Clé de compartiement: "Désactivée"
* Bouton: "Créer un compartiement"

Une fois créé, afficher les détails du bucket "devops-boot-s3backup"

* Onglet Propriété, **Relever la chaine ARN** (Amazon Ressource Name): "arn:aws:s3:::devops-boot-s3backup"


### 1.5 Attribuer les permissions au rôle IAM et Sécuriser

Cette étape consiste à créer, attribuer les accès nécessaires et limités pour permettre le processus de sauvegarde et de restauration qui seront réalisés par l'opérateur PostgreSQL.

**Procédure**

* Poursuivons dans la même fenêtre
* Selectionner l'Onglet "Permission"
* Bucket Policy, "Editer"
* Nous avons utilisé le bouton "AWS Policy Generator" pour générer le code JSON standard.
  * Step 1 - Policy Type selectionnée : S3 Bacuket Policy
  * Step 2 - Add Statement(s):
        - Effect : allow (Objectif est d’autoriser, permettre l’accès) 
        - Principal : arn:aws:iam::424571028400:user/eks-srvuser (Notre utilisateur IAM role pour l’accès)
        - Actions : All actions (temporaire)
        - Amazon Ressource Name (ARN) : arn:aws:s3:::devops-boot-s3backup (Notre bucket fraichement créé)
  * Step 3 - Generate Policy # Il s’agit de valider nos choix. Une seule règle est nécessaire dans notre cas.
  * copier / Coller du code dans notre espace Bucket Policy.
  * Bouton Save changes

Maintenant, nous avons autorisé au principal de pouvoir accéder au Bucket. Notre utilisateur a maintenant accès au Bucket.

> Contrainte, il est nécessaire d'adapter avec nos besoins (niveau d'accès, quelle ressources) et nos données spécifiques en l'occurence les informations que nous avons relevés plus tôt dans notre démarche.

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

**A developper** ..

``` 
sudo apt-get install snapd
sudo snap install k9s
```
* configurer les variables d'environnement: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
* Récupérer le cluster config:
```
aws eks update-kubeconfig --region eu-west-3 --name [cluster_name] --kubeconfig ~/.kube/[cluster_name].config
```
* Configure le variable KUBECONFIG: 
```
export KUBECONFIG=~/.kube/[cluster_name].config
k9s
```

### 2.2 Configurer le Cluster Postgres

Cette partie se décompose en plusieurs sous-étapes.

* Rechercher les paramètres nécessaires pour consituer la configuration adéquate
* Configuer les manifestes helm
* Déterminer les variables et les informations sensibles, secrètes puis les sécuriser.
* Tester les permissions et accès du rôle IAM
* Déployer la configuration
* Vérifier le fonctionnement, les tests.

Nous modifions les fichiers du `"Chart Helm Postgres"` suivant pour activer le fonctionnement de la sauvegarde.
(helm/postgres/templates/postgres.yaml)

**Contraintes**

* L'opérateur PostGresSQL doit être dans le namespace default. Sinon, un paramétrage complémentaire RBAC est nécessaire.
  
* Nous avons pu observer que en cas d'erreur l'outil à réaliser une restauration automatiquement. Il faudra inclure un controle d'intégrité de la sauvegarde ?

**Procédure**



## 3.1 La sauvegarde

## 3.2 La restauration


# Sources de documentation

Création de la clé d'accès pour le Rôle IAM
(https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

Prérequis et Configuration de Zalando Postgres-Operator 
(https://github.com/zalando/postgres-operator/blob/master/docs/administrator.md#using-aws-s3-or-compliant-services)

