# Architecture

Un schéma d'implémentation détaillé sera établi pour décrire l'architecture globale de l'infrastructure, y compris les différents composants, leur interaction et leur déploiement.


## Application


### Proxy: Traefik

* Application router
* High-availability by fault tolerance
* Load-balancing by requests distribution
  ALB ?
* Helm chart
* Version


### Application: FastAPI

* Python
  * Version:
  * Packaging
* Project management? Poetry?


### Databases: PostgreSQL

* Application is using the well known and battle-tested OSS PostgreSQL database management system.

  FIXME pg version

* Use a specialized Kubernetes operator to manage the PostgreSQL cluster

  Zalando's **postgres-operator** is chosen because...
  FIXME main reason(s) to choose it over alternatives

  Alternative OSS solutions available are: ...
  FIXME list alternative solution considered

* Helm chart
* Single read/write Master / Multi read-only slaves architectur

  It provides both high availability and read load balancing, without the additional complexity of multi-master configuration, which the application doesn't require at the moment.

* Master failover


## Infrastructure


### Network


#### Application Load Balancer (ALB)


#### Virtual Private Cloud (VPC)

* VPC subnet


#### Internet Gateways (IGW)

* Global egress


#### Availability Zones (AZ)

* 3 availability zones for high availability


#### NAT Gateways (NGW)

* Per AZ egress
* In public subnet


#### Subnets


##### Public subnets

* Application access
* Bastion access
* NAT gateways ?


##### Private subnets

* Database
* Admin


### Compute

#### Nodes

* EC2 compute nodes
  * Application nodes
  * Database nodes
  * Bastion node
* Auto-scaling groups


#### Orchestration: Kubernetes

#### Pods

##### ReplicaSets

* Traefik
* Application
* Database
* cert-manager
* Metrics server
* bastion

##### DaemonSets

* Any ?


### Storage

#### CSI

##### EBS

* For persistent storage needs (application data, logs, and monitoring metrics) AWS Elastic Block Storage (EBS) is used to provide persistent block devices to stateful pods
* To integrate EBS with Kubernetes, the Container Storage Interface is leveraged by using the `aws-ebs-csi-driver` cluster addon from EKS which registers EBS volumes as a backend for K8s Persistant Volumes.



## CI/CD

### GitHub Actions


#### Actions

#### Workflows

* Application
* Infrastructure


## Observability

### Log management (ELK/EFK)

### Metrics (Prometheus/Grafana)

### Event and alerting


## Business continuity & Disaster Recovery

### TODO Recap HA features

### Backup

### Disaster Recovery
