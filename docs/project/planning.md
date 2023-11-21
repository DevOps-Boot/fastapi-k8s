---
tags:
  - project
  - planning
  - milestones
---

# Planning

<!-- [TOC] -->

## Stage 0: Project framing

### Activities

* Inception meeting


### Deadline

2023.10.25


## [Stage 1: Requirements specifications and Project setup](https://github.com/DevOps-Boot/fastapi-k8s/milestone/1)


### Activities

* Define project context and scope/perimeter
* Analyze project objectives
* Definition of business needs and application use.
* Functional requirements elicitation
* Define project specifications
* Implementation schema of the DevOps orientated solution

* Create and import application source code into a dedicated VCS repository
* Organize and document code repository organization
* Organizing project management: Choice of methods

### Deliverables


### Deadline

2023.10.30


## [Stage 2: Configure, deploy and secure application infrastructure](https://github.com/DevOps-Boot/fastapi-k8s/milestone/2)

### Activities

* Create a micro-services application architecture considering all its components (Kubernetes, Vagrant, etc.)
  * Containerization and orchestration
  * Choice of infrastructure components for the application (frontend, backend, DBMS, etc.)
* Secure application deployment and network connections
* High-Availability
* Backup and Disaster Recovery

### Deliverables

* Infrastructure and application deployment scripts

### Extras

* Implement IaC tools and techniques
* Use Cloud services to host and deploy the application

### Deadline

2023.11.10


## [Stage 3: Data ingestion and consumption](https://github.com/DevOps-Boot/fastapi-k8s/milestone/3)

### Activities

* Define data architecture, including how to link different data together.
* Define the nature, velocity and volume of data for the application
* Choose the technical data storage solution according to the application and/or database:
  * Relational
  * NoSQL_
  * File system / Bloc Storage / Object Storage
* Create a database if needed to store application data
* Schedule backup of application data
* Set up access rights
* Ingestion of data in the application
* Consumption by users
* Log management

### Deliverable

* Any document describing and explaining the chosen architecture (UML diagram)
* Database and/or storage implementation files
* Query files

### Deadline

2023.11.20



## [Stage 4: CI/CD pipelines](https://github.com/DevOps-Boot/fastapi-k8s/milestone/4)

!!! note
    This is the most important step in the project, as it is the heart of the DevOps training.

### Activities

**Configure pipelines to automate build, test, deploy and delivery processes.**

* Perform automated tests and integration tests to ensure code is working properly
* Deploy code to a production or test environment using automated tools
* Integrate the source code into a centralized development environment
* Limit deployment/continuous delivery interruptions (blue/green)
* Collect KPIs to measure the effectiveness and success of DevOps practices. (Deployment Cycle Time, Deployment Frequency, Deployment Success Rate)

Pipelines should automate application deployment.

**Two environments** should be created: one for *development* and one for *production*.
Environments can consist of dedicated VMs, containers, or any other compute resource.
The environments simply have to be separated.

Source code should go through automated tests before being deployed to production to ensure correct behavior.

### Deadline

2023.11.25


## [Stage 5: Monitoring and Observability](https://github.com/DevOps-Boot/fastapi-k8s/milestone/5)


### Activities

**Define metrics and monitor the system** in production to detect errors and potential issues.

Using a monitoring system, which includes a server, collection agents and a monitoring console, deploy the agents to collect the defined indicators (metrics).

* Configure monitoring dashboards to track key metrics and configure alerts to notify potential issues.
* Set threshold values and create relevant alarms based on measured metrics
* Define and create automatic actions in response to these alarms
* When the console shows a fault on an indicator, determine the cause of the problem
* Regularly report to developers on performance statistics of their applications in production

### Bonus step

* Define metrics, "health points" relevant to the application.
* Create dashboard to make sense of metric collection.
* Define thresholds from which it is considered that there is a malfunction of the architecture and/or the application, this must trigger an alarm.
* Define automatic actions in response to these alarms.

### Deadline

2023.12.01

## Stage 6: Automation

**Automate deployment of infrastructure, environments, and application.**

* Automate server deployment (IaC)
* Create declarative templates (YAML) to deploy infrastructure, environments and application
* Use environment variables to secure sensitive data and avoid template redundancy.
  These templates will be reusable, repeatable regardless of the deployed environment

### Deadline

2023.12.05


## Training certification project demonstration and defense

For the demonstration, the application should be:

* organized and documented on GitHub,
* with a functional installation procedure.

The DataScientest defence takes place in groups as follows:

* 20 min of presentation
* 10 min Q and A with jury members

You have the choice to either make:

* a presentation slide show and a demonstration, or
* all the presentation of the application on GitHub

Particular attention will be given to the form of intermediate renderings. Including organizing your Git project, communication and teamwork.

If the renderings are not up to par and delivered on time, your project cannot be validated.


### Deadline

Semaine du 12 Décembre


## Entretien final

To validate the RNCP36061 “DevOps System Administrator” professional title:

The evaluation session to obtain the professional title brings together a jury of professionals in the field, is organized face-to-face in Paris and is based on several elements:

The Professional File (PD) completed by the candidate no later than 15 days before the examination session;

The presentation of the project carried out before the session;
The written report (Word format) or technical file of the project.

Tous les détails concernant la validation se trouvent dans [ce document](../appendices/directives/validation_devops.md)
