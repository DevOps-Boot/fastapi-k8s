# FastAPI / traefi project blabla

Context: The fastapi-traefik application provided by DataScientest
originally used the docker compose format. The application was updated
to be used in a kubernetes cluster environment.

* Observation:

  * the application uses postgres. The database will be deployed independently to allow for better scaling.

  * The application fastapi uses environmental variables for the DB connection. This meant that we didn't need to change the code itself, just the environment.

  * Traefik comes preinstalled with k3s, this is what the development environment will use. The staging / production environments will need further testing to find the optimal solution.

The fastapi application has been repackaged to an image and published on a container registry, initially on DockerHub, but eventually it will be published on ECR.

The new image uses the latest python packages and a secure
python base image from Chainguard.

We're using HELM charts to launch the application in a k8s cluster. 



# Local development enviroment

## Preparation of the dev environment

### Install kubectl
TODO

### Install helm
TODO

### Install k3s

We install the cluster with etcd and set up the kubeconfig file.

```
curl -sfL https://get.k3s.io | K3S_TOKEN=SECRET sh -s - server --cluster-init

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```

### Install cert manager:

```
helm repo add jetstack https://charts.jetstack.io

helm repo update
```

```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.13.2 \
  --set installCRDs=true
```

### Clone the repository

```
git clone git@github.com:DevOps-Boot/fastapi-k8s.git
```

### Launch the development environment

```
cd fastapi-k8s

helm install fastapi-chart ./helm --values=helm/values-dev.html
```

### Connect to the local instance

Open `http://fastapi.localhost:80` in a browser on the local machine (or using a port forward, if it's on a remote host).

