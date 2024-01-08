# Non functional user stories

The non-functional user stories delve into the operational qualities, performance standards, and constraints that shape the efficiency and reliability of our Traefik/FastAPI/PostgreSQL application on Kubernetes.

These stories encompass critical aspects such as security, scalability, maintainability, and compliance, which are pivotal for the system's overall robustness and effectiveness.

They are integral to ensuring that, beyond its functionalities, the system adheres to the highest standards of operational excellence and meets the broader technical and business requirements.


## Application user

- As an application user, I expect quick and seamless deployment of updates without downtime using rolling updates or blue-green deployments in Kubernetes.


## Architects and DevOps

- As a system architect, I want to design a containerized application architecture using orchestration to ensure scalability and resilience.

- As a DevOps engineer, I need to implement a CI/CD pipeline using a workflow pipeline that automates testing, building, and deployment of microservices.

- As a cloud engineer, I need to use an IaC tool and scripts to automate the provisioning of resources, ensuring infrastructure consistency and rollback capability.

- As a DevOps engineer, I want to establish a performance benchmarking routine for the application to ensure it meets the desired performance criteria.

- As an infrastructure engineer, I need to integrate a storage solution i ensuring data persistence across stateful pods restarts.


## Ops

- As a network administrator, I need to set up internal and external DNS routing to efficiently manage service discovery and accessibility.

- As a container cluster operator, I want to set up horizontal autoscaling based on CPU and memory usage metrics to handle load dynamically.

- As a system administrator, I want to set up detailed monitoring of container cluster metrics and application performance indicators.

- As a logging manager, I need to configure log rotation and archiving strategies to manage log data effectively.

- As a performance analyst, I want to monitor cloud resources using cost management tools and optimize where necessary.


## Devs & DBAs

- As a backend developer, I want to utilize a modern Python framework to create asynchronous APIs that can handle high volumes of requests concurrently.

- As a database administrator, I need to configure replication and failover mechanisms to ensure data integrity and availability.

- As a developer, I want a solution to manage cluster resource complexities and simplifying the deployment process.


## Testing & QA

- As a CI/CD engineer, I need to integrate static code analysis tools in the CI pipeline to enforce code quality standards.

- As a QA engineer, I want to implement end-to-end testing using tools in the CI/CD pipeline for thorough application testing.


## Compliance & Security Specialists

- As a security specialist, I want to integrate SSL/TLS termination for secure communication and data protection.

- As a security analyst, I need to set up cluster network policies to restrict internal traffic flows, enhancing network security.

- As a compliance officer, I need to ensure logging and monitoring setups comply with GDPR and other relevant data protection regulations.


## Technical Content Creators & UX/DX

- As a documentation writer, I need a solution to auto-generate API documentation that stays up-to-date with code changes.
