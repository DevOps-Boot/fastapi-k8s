# Functional user stories

The functional user stories present specific functionalities and actions that our Traefik/FastAPI/PostgreSQL application on Kubernetes must perform, encompassing a range of functionalities from infrastructure setup to application behavior and user interaction.

These stories outline the core operational capabilities and tasks the system is expected to execute, defining the primary objectives and features essential for the project's success.

This section serves as a roadmap for the development and implementation of key functionalities, ensuring that our system meets the desired operational goals and user needs.

## Application user

- As an application user, I expect the system to remain available no mater what problem the system may face.

- As an application user, I expect the system to automatically scale during peak usage times to maintain performance and availability.


## Architects & DevOps

- As a system architect, I need to design a scalable microservices architecture so that the application can handle varying loads efficiently.

- As a DevOps engineer, I need to automate server provisioning to ensure a consistent and repeatable cloud environment setup.

- As a cloud engineer, I need to integrate managed Kubernetes, as well as other cloud services for enhanced functionality and compliance with industry and provider recommended best practices.

- As a DevOps team lead, I want to establish a continuous feedback loop with the development team to iteratively improve the system based on real-time usage data.


## Ops

- As a system administrator, I want to automate server creation using scripts and IaC tools and techniques so that the infrastructure setup is efficient (fast, unattended), reliable (tested) and repeatable.

- As a network administrator, I need to configure an application router and reverse proxy to efficiently route incoming requests to the appropriate services.

- As a Kubernetes operator, I want to configure clusters with appropriate resource allocation and scaling policies to manage application deployment effectively.

- As an infrastructure manager, I need to ensure high availability and disaster recovery capabilities for the Kubernetes cluster and its workloads.

- As a performance analyst, I want to track and optimize the resource utilization of the cloud infrastructure to maintain cost-effectiveness.

- As a system administrator, I want to implement a solution for monitoring system performance and setting up alerts for any anomalies.

- As a system administrator, I need to configure services for efficient log collection, analysis, and visualization.


## Devs & DBAs

- As a developer, I need a continuous integration process that automatically tests the latest code changes with static analysis and unit testing tools, ensuring code quality.

- As a developer, I need a continuous deployment process that automatically deploys the latest code changes to a test environment, ensuring rapid feedback and iteration.

- As a developer, I want to utilize a solution for easy packaging, deployment and management of cluster resources.

- As a backend developer, I want to build RESTful APIs using FastAPI that are well-documented and easy to consume for front-end developers.

- As a database administrator, I need to design a normalized PostgreSQL database schema that supports efficient data retrieval and storage.

- As a database administrator, I want to use state of the art, cloud ready open source Relational Database Management System.


## Testing & QA

- As a CI/CD engineer, I need to set up workflows for automating the build, test, and deployment processes of the application.

- As a QA engineer, I want to integrate automated testing in the CI/CD pipeline to ensure code quality and reliability.

- As a DevOps engineer, I want to automatically test and provision infrastructure using IaC code.


## Technical Content Creators & UX/DX

- As a documentation writer, I need to create comprehensive user guides and API documentation for the system to facilitate easy usage and maintenance.

- As a devolopper experience manager, I want the application API documentation to be constantly updated, synced with development, and published.

- As a system architect, I want the requirements and specifications documents for the system to be tracked and versioned.

- As a technical content manager, I want all docs to be managed as code using lightweight markup languages text diagram syntaxes.


## Compliance & Security Specialists

- As a security specialist, I want to implement robust security measures in the infrastructure setup to protect against vulnerabilities and attacks.

- As a security analyst, I need to enforce role-based access control in Kubernetes to provide secure and restricted access to the cluster resources.

- As a compliance officer, I need to ensure that the entire application stack, including all tools and processes, adheres to relevant industry standards and regulations.
