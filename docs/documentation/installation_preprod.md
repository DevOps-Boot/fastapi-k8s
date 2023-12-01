# [Environnement de préprod]

## Introduction

Cette étape arrive avant la phase d’automatisation complète.

La création des fichiers de configuration qui contiennent les caractéristiques de l’infrastructure est opérationnelle ce qui facilite les modifications, la distribution des configurations et nous avons l’assurance d’obtenir un environnement identique à chaque fois.

Nous gérons et approvisionnons l’infrastructure à l’aide de ligne de code plutôt que par des processus manuel désormais. (Infrastructure-as-Code).

Cette procédure décrit l'installation des outils nécessaires sous Linux pour déployer une infrastructure AWS et des applications en utilisant Terraform, basée sur des configurations stockées dans un dépôt GitHub.

## Prérequis

* Machine Linux
* Accès Internet
* Accès administrateur sur la machine
* Compte AWS (IAM), avec privilèges adéquats.

## Preparation de l'environnement

**Installation de dépendances**
Ouvrez un terminal et exécutez les commandes suivantes pour installer Git, Unzip, et Tree

```console
sudo apt install -y git-all`
sudo apt-get install -y install-info`
sudo apt-get install -y unzip tree                 # Pour aws
sudo apt-get install -y gpg apt-transport-https    # Pour terraform
```

**Cloner le dépôt Github du projet*
Se positionner dans le dossier. Un nouveau dossier avec notre dépôt sera créé.

```console
git clone https://github.com/DevOps-Boot/fastapi-k8s.git
cd NomDuDepot
```

**Configuration de git**
Pour permettre les actions git commit et git pull, il est nécessaire de réaliser cette étape. Sinon, vous pouvez la sauter.
Saisissez les informations de votre compte github.

```console
git config --global user.email VotreAdresseeMail@MonDomaine.com
git config --global user.name VotrePseudoGithub
git status 
```

**Installation de terraform**
Installez terraform: 
```console
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Vérifier l'installation de Terraform

```console
$ terraform --version
Terraform v1.6.5
on linux_amd64
```

**Installer le Client AWS**
Method : Using the AWS setup script
we will download the 64 bits aws cli version

Installez AWS CLI: 
```console
sudo apt update
curl -X GET "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
rm -rf ./aws
aws --version
```

By default, `aws cli` is installed in **/usr/local/aws-cli** as well as a symbolic link in **/usr/local/bin**. To verify that the installation has worked, expected result :

```console
 aws-cli/2.1.33 Python/3.8.8 Linux/5.4.0-70-generic exe/x86_64.ubuntu.20 prompt/off

```

**Gerer l'accès AWS**

Créer un nouveau fichier `.env` ou le compléter.
Ce fichier contient les accès AWS. (.env ajouté au fichier .gitignore du dépots)

Voicì le contenu à ajouter:

```console
AWS_ACCESS_KEY_ID="votre_aws_access_key_id"
AWS_SECRET_ACCESS_KEY="votre_aws_secret_access_key"
AWS_DEFAULT_REGION="eu-west-3"
AWS_DEFAULT_OUTPUT="json"
```

Ces informations sont remplaces la commande `aws configure` que nous remplissions manuellement.
En france, nous avons choisi la région `eu-west-3`.
Le format des sorties écrans de AWS se feront au format `json`. Vous pourriez le changer par le format `text`.

**Charger les variables AWS**
Nous pouvons chargés les variables dans notre environnement shell. Ce fichier est localisé à la racine du dépot. Préciser le chemin du fichier .env si besoin :
> *Notez: A relancer an cas de redémarrage et dans différentes étapes de la procédure qui suit.*

```console
`source .env` 
```

**Vérifions le contenu des variables AWS**
Vous devriez avoir la valeur de la variable qui s'affiche à votre écran.

```console
echo $AWS_DEFAULT_REGION
```

**installation de kubectl**
On installe l'outil kubectl

```console
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

Vérifier

```console
$ kubectl version --short
```

$ kubectl get nodes
NAME         STATUS   ROLES                       AGE     VERSION
aws-rncp01   Ready    control-plane,etcd,master   3m16s   v1.27.7+k3s2

**Installation de Helm**

```console
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
```

Vérifier

```console
$ helm version
version.BuildInfo{Version:"v3.13.1", GitCommit:"3547a4b5bf5edb5478ce352e18858d8a552a4110", GitTreeState:"clean", GoVersion:"go1.20.8"}
```

## Déployer l'environnement AWS CLOUD preprod

Nous utilisons terraform cli pour les étapes qui vont suivre.

### Structure des dossiers

Voici les dossiers dans lequel nous nous situerons pour lancer nos différentes commandes.

```console
.
├── terraform
│   ├── deployments     # Pour les applications
│   │   ├── preprod
│   └── provisioning    # Pour l'infrastructure
│       └── preprod
```

### Déploiement de l'infrastructure

**Initialisation de Terraform**
Initialisez Terraform pour préparer votre environnement de déploiement. Cela télécharge les modules nécessaires et prépare les providers.

Se positionner dans le dossier

```console
$ cd ./terraform/provisioning/preprod
$ terraform init
    [...]
    Terraform has been successfully initialized!
```

**Déployer**
Vous pouvez personnaliser le nom de votre cluster en remplacant cette information"GaudryPreprod"
Temps de chargement, d'attente: 10 minutes environ.

```console
terraform apply -var=cluster_name=GaudryPreprod
    Plan: 55 to add, 0 to change, 0 to destroy.

    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes 
```

* Terraform demandera une confirmation. Tapez yes pour procéder à l'installation de l'infrastructure.

Update kubeconfig
Afin d'utiliser les commandes kubectl

```console
aws eks update-kubeconfig --region eu-west-3 --name GaudryPreprod --kubeconfig ~/.kube/GaudryPreprod.config
export KUBECONFIG=~/.kube/GaudryPreprod.config

```

**Vérifier**

kubectl
Avec les commandes locale, nous pouvons interroger l'api AWS EKS pour obtenir des information de notre infra cloud. Utilisons `kubectl`

```console
kubectl get pods
```

AWS Management Console
La console vous permet de visualiser les ressources créées.  

### Déployer les applications dans AWS CLOUD

```console
$ cd fastapi-k8s/terraform/deployments/preprod
$ terraform init
$ terraform plan # optionnel
$ terraform apply -var=cluster_name=GaudryPreprod
    Plan: 4 to add, 0 to change, 0 to destroy.

    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes 
$ kubectl get service -n traefik
```

* Terraform demandera une confirmation. Tapez yes pour procéder au déploiement des applications.

### Vérifications Post-Déploiement

Vérifiez l'infrastructure :

```console
terraform output
aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress"
```

### Accéder à l'Application avec votre navifateur web

Mettre à jour votre Serveur DNS (clouddns) avec une entrée CNAME A.
Le nom de domaine de load-balancer correspond à l'adresse "external ip" de notre resource "traefik":

```console
$ kubectl get service -n traefik
  NAME      TYPE           CLUSTER-IP       EXTERNAL-IP                                                                     PORT(S)                      AGE
  traefik   LoadBalancer   172.20.125.173   a8ec399d1b379465694ee0617c6f4615-1104f5c6d7d11296.elb.eu-west-3.amazonaws.com   80:30265/TCP,443:31119/TCP   3m59s
```

Se connecter chez notre provider dns, cloudns, en ce qui nous concerne...  

```console
  Cloudns.net = 
        CNAME A 
        HOST = devops-fastapi-staging.kvark.fr
        Points to = a8ec399d1b379465694ee0617c6f4615-1104f5c6d7d11296.elb.eu-west-3.amazonaws.com 
```

Alors, avec un serveur DNS qui sera en mesure de valider l'url à traefik et cert-manager.
Cert manager va prendre en compte l'url et va valider en HTTPS (package HELM).
Sans CNAME A, traefik vous refusera l'accès avec une erreur 404.

Ouvrir le Browser

```console
http://devops-fastapi-staging.kvark.fr
https://devops-fastapi-staging.kvark.fr
```

Résutat attendu:

```console
[{"id":1,"email":"test@test.com","active":true}]
```

### Gestion des Modifications
Pour des modifications, ajustez les fichiers de configuration et répétez les étapes de planification et d'application avec Terraform.

### Desinstallation de notre environnement

Suppression de l'infrastructure : Lorsque vous n'avez plus besoin de l'infrastructure, utilisez Terraform pour la détruire proprement et éviter des coûts inutiles.

```console
$ terraform destroy -var=cluster_name=GaudryPreprod
    Plan: 0 to add, 0 to change, 55 to destroy.

    Do you really want to destroy all resources?
    Terraform will destroy all your managed infrastructure, as shown above.
    There is no undo. Only 'yes' will be accepted to confirm.

    Enter a value: yes 
```

* Terraform demandera une confirmation. Tapez yes pour procéder à la suppression.

---

# Annexe 01

## Résultat d'une commande `terraform init`

---

Voici ce qu'on obtient normalement avec la commande `terraform init` :

```console
$ terraform init

    Initializing the backend...
    Initializing modules...
    - eks in ..\modules\eks
    Downloading registry.terraform.io/terraform-aws-modules/eks/aws 19.15.3 for eks.eks...
    - eks.eks in .terraform\modules\eks.eks
    - eks.eks.eks_managed_node_group in .terraform\modules\eks.eks\modules\eks-managed-node-group
    - eks.eks.eks_managed_node_group.user_data in .terraform\modules\eks.eks\modules\_user_data
    - eks.eks.fargate_profile in .terraform\modules\eks.eks\modules\fargate-profile
    Downloading registry.terraform.io/terraform-aws-modules/kms/aws 1.1.0 for eks.eks.kms...
    - eks.eks.kms in .terraform\modules\eks.eks.kms
    - eks.eks.self_managed_node_group in .terraform\modules\eks.eks\modules\self-managed-node-group
    - eks.eks.self_managed_node_group.user_data in .terraform\modules\eks.eks\modules\_user_data
    - vpc in ..\modules\network
    Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 5.0.0 for vpc.vpc...
    - vpc.vpc in .terraform\modules\vpc.vpc

    Initializing provider plugins...
    - Finding hashicorp/kubernetes versions matching ">= 2.10.0, ~> 2.24"...
    - Finding hashicorp/time versions matching ">= 0.9.0"...
    - Finding hashicorp/tls versions matching ">= 3.0.0"...
    - Finding hashicorp/cloudinit versions matching ">= 2.0.0"...
    - Finding hashicorp/helm versions matching "~> 2.12"...
    - Finding hashicorp/aws versions matching ">= 3.72.0, >= 4.47.0, >= 4.57.0, >= 5.0.0, ~> 5.28"...
    - Installing hashicorp/time v0.9.2...
    - Installed hashicorp/time v0.9.2 (signed by HashiCorp)
    - Installing hashicorp/tls v4.0.5...
    - Installed hashicorp/tls v4.0.5 (signed by HashiCorp)
    - Installing hashicorp/cloudinit v2.3.3...
    - Installed hashicorp/cloudinit v2.3.3 (signed by HashiCorp)
    - Installing hashicorp/helm v2.12.0...
    - Installed hashicorp/helm v2.12.0 (signed by HashiCorp)
    - Installing hashicorp/aws v5.28.0...
    - Installed hashicorp/aws v5.28.0 (signed by HashiCorp)
    - Installing hashicorp/kubernetes v2.24.0...
    - Installed hashicorp/kubernetes v2.24.0 (signed by HashiCorp)

    Terraform has created a lock file .terraform.lock.hcl to record the provider
    selections it made above. Include this file in your version control repository
    so that Terraform can guarantee to make the same selections by default when
    you run "terraform init" in the future.

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
```
