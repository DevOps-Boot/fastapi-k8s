# DevOps: deployment and lifecycle of a ReST API web application


## Detailed Description

The objective of this project is to demonstrate most of the technical elements learned during the DevOps curriculum.

DevOps, in a *team*, is an activity of *support for development* and *automation* of the various practical elements necessary for the proper functioning of an application.

This project consists of gathering the practical aspects discovered in the modules of the curriculum, and combining them into an *infrastructure* to realize the *deployment of an application*, in accordance with the *validation requirements* of your training.

Projects are carried out in groups of **3 or 4 people maximum**.


## Application: FastAPI Traefik

The Git repository of the application is available on [GitHub](https://github.com/DataScientest/fastapi-docker-traefik)

The application is an example of a generic Python ReST API proposed by DataScientest.

This project may be suitable for those who want to create an application or modify it.

For the project objectives, you will be asked to deploy the application in a *micro-services architecture*, on a completely *new environment*, and in a *secure* way.

You will also need to include an *proxy entry point via **Traefik***.


> [Traefik Documentation](https://doc.traefik.io/traefik/)

There are several options:

* Deploy this application on Kubernetes
* Deploy this application to the cloud
* Deploy this application on a local environment

The application is simple, but any new functionality will be greatly appreciated and valued for project validation.

This project is also suitable for profiles who are not comfortable with programming languages.


## Project planning and expectations

### Specifications

#### Description

Build the specifications and take control of the application


#### Objectives

Understand project objectives and functional requirements:

* Definition of business needs and application used.
* Import the application into your VCS
* Implementation Schema
* Instantiate a Git repository: organize and document it
* Organizing project management: Choice of methods


#### Modules / Masterclass / Templates

* External documentation
* GitHub Repository
* Trello / GitHub Project


#### Deliverable and validation conditions

* Specifications in PDF format


### Infrastructure

#### Description

Configure, deploy and secure infrastructure for the application


#### Objectives

Create a micro-services architecture of the project with an IaC solution:

* Containerization and orchestration
* Choice of the infrastructure components of your application (Front, Back, BDD...)
* Manage network and connection ports
* Security with encrypted protocols
* Architecture on multiple servers or instances: high availability
* Backup management, Disaster Recovery


#### Modules / Masterclass / Templates

Infrastructure:

* Docker
* Kubernetes
* Linux and NGINX administration
* AWS (ECS, Kubernetes, EC2, auto-scaling, ELB, Route 53, ElasticBeanstalk)


#### Deliverable and validation conditions

GitHub repository with:

* Backup system script
* Application script


### Data Management

#### Description

Ingestion and consumption of data


#### Objectives

Define the nature, velocity and volume of data for the application:

* Choose the technical data storage solution according to the application
* Create database if needed to store application data
* Schedule backup of application data
* Set up access rights
* Ingestion of data in the application
* Consumption by users
* Log management


#### Modules / Masterclass / Templates

* SQL
* MongoDB
* AWS (RDS, Dynamo DB, S3, EFS)


#### Modules / Masterclass / Templates

* SQL
* MongoDB
* AWS (RDS, Dynamo DB, S3, EFS)


#### Deliverable and validation conditions

* Functional database
* Log storage
* Authentication / Authorization


### Pipeline CI/CD

#### Description

Configure pipelines to automate build, test, deploy, and delivery processes.


#### Objectives

* Avoid human error through automation.
* Ensure deployments are efficient and reliable.
* Perform automated tests and integration tests to ensure code is working properly
* Deploy code to a production or test environment using automated tools
* Integrate source code into a centralized development environment
* Limit deployment/continuous delivery interruptions (blue/green)
* Collect KPIs to measure the effectiveness and success of DevOps practices. (Deployment Cycle Time, Deployment Frequency, Deployment Success Rate)


#### Modules / Masterclass / Templates

Deployment and Automation:

* Jenkins
* Ansible
* Github Actions
* Circle CI/CD
* AWS (CodeBuild, CodePipeline, CodeCommit, CodeStar)

Tests:

* Unittest
* Pytest
* Selenium
* JUnit


#### Deliverable and validation conditions

Scripts in the GitHub repository


### Supervision

#### Description

Define metrics and monitor the system in production to detect errors and potential problems.


#### Objectives

* Using a monitoring system, which includes a server, collection agents and a monitoring console, deploy the agents to collect the defined metrics.
* Configure monitoring dashboards to track key metrics and configure alerts to notify potential issues.
* Set threshold values and create relevant alarms based on measured metrics
* Define and create automatic actions in response to these
* Define and create automatic actions in response to these alarms
* When the console shows a fault on an indicator, determine the cause of the problem
* Regularly report to developers on performance statistics of their applications in production


#### Modules / Masterclass / Templates

* Prometheus
* Grafana
* Datadog
* AWS (CloudWatch, EventBrige)


#### Deliverable and validation conditions

* Operation of the monitoring solution
* Access to tools
* Dashboard


### Automation

#### Description

Automate deployment, environment and application infrastructure.


#### Objectives

* Automate server configuration deployment (IaC)
* Create declarative models (YAML) to deploy infrastructure, environments and application
* Use environment variables to secure sensitive data and avoid model redundancy.
* These models will be reusable, repeatable regardless of the deployed environment


#### Modules / Masterclass / Templates

* Automation (IaC)
* Terraform
* AWS (CloudFormation)


#### Deliverable and validation conditions

* GitHub repository with functional IaC templates


<! -- markdownlint-disable MD026 -->
## Skills required for the R.N.C.P.
<! -- markdownlint-enable MD026 -->

For the RNCP diploma, the project must cover the following skills:

* **Automate infrastructure deployment**
* **Micro-service architecture: manage containers**
* **Operate a monitoring solution**


<! -- markdownlint-disable MD026 -->
## R.N.C.P.
<! -- markdownlint-enable MD026 -->

The project involves two productions:

* A **project file** to be submitted to the jury
* One **presentation media** slideshow type


### Project dissertation 

The project file is **individual** and **adheres to the following standard plan**:

* **Specifications**

* **Project Technical Specifications**

* Developed by the candidate,
* Preferably including a **schema** of the *infrastructure* to be deployed and/or the *application* to be put into production;
* Description of the **approach** and the **tools** used as well as any **collaborations** with other teams;
* **Achievements** of the candidate with the most significant *configurations* and *scripts* with a rationale;
* **Description of a work situation** that required *research* by the applicant during the project.


### Presentation Media

The candidate presents **individually** his or her project using a slideshow presentation media made prior to the test, and according to this outline:

* Presentation of the company and/or service;
* Project context (specifications, constraints, expected deliverables);
* Presentation of the infrastructure to be deployed and/or the application to be put into production;
* Presentation of a significant example of the work done by the candidate;
* Presentation of an example of research carried out;
* Summary and conclusion (satisfactions and difficulties encountered).

Further information on technical maintenance:

* The technical interview must take place after the presentation of the project carried out before the session.


## DataScientest Certified Diploma

### General DataScientest validation

* Project requirements and content will be **identical.**
* You will work **in a group**.
  Does not apply to alternating learners or individual projects.
* All project groups will be mentored by **a mentor**.
* One sprint meeting to provide an update on progress.
* A dedicated Slack lounge for your project with your mentor will be at your disposal.
* The final evaluation is based on two elements:
  * the **defence** and
  * your **deliverable** project (GitHub, GitLab...)


### Project Eligibility Criteria

* **Validate the modules** of the first sprint:

  * Python 101 DevOps
  * Virtualization and Vagrant
  * Introduction to Linux and Bash

* Validate module **Linux Systems Administration**


### Work Evaluation Criteria

* Quality of **intermediate renderings**:
  No obligation of results, but an obligation of effort.
* Managing your time and effort.
* Evidence of teamwork.
  Does not apply to alternating learners or individual projects.
* Communication and follow-up with your mentor.
* Taking a step back.

!!! note
    The mentor is not a team member.
!!!


### Validation Conditions (Bootcamp & POEI & Continue)

* **Proper GitHub repository delivery**:

  * Organized and functional production.
  * Documentation, “README” with project installation procedure.

* **35 minute group final defence**

  * 10 Minutes to present
  * 10 minutes demonstration
  * 15 minutes questions / answers
