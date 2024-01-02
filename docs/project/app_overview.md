# Application Overview

Here is a brief description of the application, starting point of the DevOps project.

The application is currently an implementation of FastAPI, designed for execution in a Dockerised environment.

It uses Traefik as a reverse proxy and SSL certificate manager, which increases the security of data exchanges.

User data is managed using a PostgreSQL database for reliability and performance.

This centralized approach makes it easy to manage and deploy on a single machine or server.


## Application Components Overview

The various components can be described as follows:


### FastAPI

FastAPI is a modern and reputable web framework, designed for the creation of web APIs with Python, which offers high performance and easy and intuitive code writing.

Data validation and serialization are automatically managed, reducing manual work and the risk of errors.

FastAPI supports asynchronous programming, allowing efficient management of simultaneous requests, which is particularly useful for input/output operations or for services that need to manage multiple connections simultaneously.


### Docker

Docker is a tool to 'containerize' the application for simplified deployment and management.

The code is structured and designed for deployment via Docker.


### Traefik

Traefik plays a double role.

On one hand, it acts as a reverse proxy that manages routing and redirects requests to the right application services.

On the other hand, it serves as an SSL certificate manager, an essential feature to secure communications and data exchanges on the Internet.

This integration shows an attention for securing and optimizing network traffic.


### PostgreSQL

PostgresSQL is responsible for managing, storing user data.
It is known for its robustness, reliability, stability, performance and compliance with SQL standards.

The whole code shows consistency in the choice of technologies that integrate perfectly together.


## Monolithic Architecture Description

In its original format, the application is structured as a monolithic system.

This means that all its functional components - database, data processing, user interface - are integrated into a single source code directory.

This centralized architecture facilitates management and deployment.


### Benefits

This architecture offers initial advantages such as ease of development and deployment.

By concentrating all functions at one point, coordination between different components is inherently simplified, reducing the complexity of communication between various modules.


### Limits of monolithic architecture*

However, this architecture has limitations, especially in terms of scalability and flexibility.

With changing needs and features, the monolithic system can become cumbersome and difficult to maintain.
Each update or change requires redeployment of the entire application, increasing the risk of errors and downtime.

In addition, performance can be affected by the increasing size of the application.
The monolithic system becomes less responsive and more difficult to optimize.

Security can also become a concern, as a flaw in a component could potentially compromise the entire system.


## Evolution towards cloud and micro-services architecture

Faced with these challenges, we will rethink the application deployment architecture to better meet modern scalability, performance and security requirements.

It is in this context that the idea to evolve it towards a micro-service oriented architecture, deployed in a cloud environment, will take shape.


### Goal

The project will therefore move towards a migration from legacy application hosting to cloud, using the DevOps methods learned in progress.

While the current monolithic structure is maintained, the goal is to optimize its deployment and management in the cloud, leveraging the benefits of DevOps technologies and practices, without necessarily undertaking a complete restructuring or the development of new functionalities, given the time constraints.
