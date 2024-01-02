# Architecture outline

Kanban = Pull system
WIP = 2 maximum

? GH Action link status to labels


## Architecture requirements

[The twelve-factor app](https://12factor.net/)

* Microservices application
  * N-tier
  * Containerized
* Cloud (EKS)/Kubernetes based infrastructure
* Automated provisioning and deployment
* High availability
* Auto-scaling
* Load balancing
* Backup
* Disaster Recovery
* Versioning and rollback management of application and infrastructure
* Network isolation
* Identity and Access Management
* Docs as first class citizen


## Architecture components


### Application stack

* Reverse-Proxy / Load-Balancer: Traefik
* Application: FastAPI
  * Language: Python
* Base de Données:
  * AWS RDS
    * Multi-AZ
    * Master/Slave
  * AWS Aurora
  * PostgreSQL


## Infrastructure stack

* Compute nodes (EC2)
  * Node types
  * NodeGroups
    * App, DB, Bastion, Logs, Metrics
    * Spread across private subnets
* Container orchestration: EKS / GCP / k8s
  * Namespaces
    * (Dev /) Staging / Production
    * Others ?
  * Deployments / ReplicaSets
  * DaemonSets
  * Services
  * Ingress
  * ConfigMaps
  * Secrets
  * Horizontal Pod Autoscalers (HPAs)
* Network
  * DNS
    * Route 53
    * Resolver/AmazonProvidedDN has VPC+2 IP address
  * Public IP
  * Internet gateway
    * Number ?
  * Region
    * Number: eu-west-3
    * Choice
  * VPC
    * Availability zones
      * Three availability zones in the chosen AWS region (eu-west-3)
    * Subnets
      * Public subnets
      * Private subnets
        * Application subnets: host application service nodes/containers
        * Database subnets: host database service nodes/containers
        * Admin subnets: host system administration and operation services
      * CIDRs
        | --- | --- | --- |
        | VPC || 10.0.0.0/13 |
        | Public subnets || 10.6.0.0/22 |
        | | Spare subnet capacity | 10.6.0.0/24 |
        | | Availability Zone 1 | 10.6.1.0/24 |
        | | Availability Zone 2 | 10.6.2.0/24 |
        | | Availability Zone 3 | 10.6.3.0/24 |
        | App subnets || 10.4.0.0/22 |
        | | Spare subnet capacity | 10.4.0.0/24 |
        | | Availability Zone 1 | 10.4.1.0/24  |
        | | Availability Zone 2 | 10.4.2.0/24 |
        | | Availability Zone 3 | 10.4.3.0/24 |
        | Database subnets with dedicated custom network ACL || 10.2.0.0/22 |
        | | Spare subnet capacity | 10.2.0.0/24 |
        | | Availability Zone 1 | 10.2.1.0/24 |
        | | Availability Zone 2 | 10.2.2.0/24 |
        | | Availability Zone 3 | 10.2.3.0/24 |
        | Admin subnets with dedicated custom network ACL || 10.0.0.0/22 |
        | | Spare subnet capacity | 10.0.0.0/24 |
        | | Availability Zone 1 | 10.0.1.0/24 |
        | | Availability Zone 2 | 10.0.2.0/24 |
        | | Availability Zone 3 | 10.0.3.0/24 |
        | Spare subnets capacity || 10.[1,3,5,7].0.0/22|
    * IP addressing
      * 5 IP addresses in each subnet CIDR block are reserved and unavailable for use
    * VPC Endpoint(s)
    * NAT Gateways for each public subnet
  * Security
    * Security Groups
      * Stateful Inbound only: source / port range / protocol
      * Act as virtual stateful inbound firewalls with a `deny all`` default rule
      * All evaluated before decision
      * Default VPC security group
    * Network ACLs
      * Subnet level stateless inbound and outbound access control
      * Evaluated on a first match basis
      * Extra layer of security to security groups
      * Default VPC NACL: all inbound and outbound network traffic
        * Special **`*`** rule: denies traffic if no rule matches
      * Number / Type / Protocol / Port range / Source / Destination / Allow or Deny
    * Security SSL/TLS
      * CertManager
    * Bastion
      * SSH
      * VPN
* Storage
  * Persistent Volumes
    * Block Storage: EBS
    * File Storage: ?
* Artifacts registries
  * ECR / GCR / Private registry


## IaC / GitOps stack

* Git
* Terraform
  * Providers
  * State storage (S3?)
    * Versioning
    * RBAC Policies
  * Terraform cloud ?
* Helm
  * Charts
  * Values
* Bash or Python maintenance and glue scripts
* Go or Jinja templating
* YAML data
* GitHub Actions


## CI/CD

* Developers
  * Code
  * Commit
  * Push
* GitHub Repository
  * Branches
  * Pull Request
  * Merge
* GitHub Actions
  * Triggers
    * Repository events
    * Manual
  * Environment creation
  * Checkout
  * Actions
    * Test code
      * Static analysis
      * Unit testing
      * Code security testing
      * Build testing
    * Build artifacts
    * Test artifacts
      * Images security (Clair, Trivy)
    * Release (push) staging artifacts to registry(ies)
    * Deploy to Staging
    * Test Staging deployment
      * User Acceptance Testing / Functionnal testing
      * Load testing
      * DAST; Dynamic Application Security Testing
    * Release (push) stable artifacts to registry(ies)
    * Deploy to production

* Pipelines
  * Separation per microservice + docs

* Environments
  * Dev: provides app view/access to dev code
  * Test: application testing
  * Staging: application+env test


## Observability


### Architecture

* ELK / Graylog ?
* Prometheus
* Grafana
* Auto-discovery / agents
  * Exporters (FastAPI ?)
  * Filebeat / Fluentbit
  * rsyslog
* Alerting ?


### Logs

* System logs
* Application logs
* Process logs

### Metrics

* Compute statistics
  * CPU
  * Memory
* Network statistics
  * Latency
  * Bandwith
* Storage statistics
  * IOPS
  * Bandwidth
* Services statistics
  * HTTP statistics
  * Database statistics
* Processes statistics
  * Deployment statistics
  * Testing statistics

### Tracing
