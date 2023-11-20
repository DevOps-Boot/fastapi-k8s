<!-- Improved compatibility of back-to-top link: See: https://github.com/devops-boot/fastapi-k8s/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<div align="center">

[![Contributors][contributors-shield]][contributors-url] [![Forks][forks-shield]][forks-url] [![Stargazers][stars-shield]][stars-url] [![Issues][issues-shield]][issues-url]
<!-- [![MIT License][license-shield]][license-url] -->
<!-- [![LinkedIn][linkedin-shield]][linkedin-url] -->

</div>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <!-- <a href="https://github.com/devops-boot/fastapi-k8s">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

  <h3 align="center">Traefik/FastAPI/PostgreSQL Microservices on Kubernetes</h3>

  <p align="center">
    DevUniversity DevOps Engineer Bootcamp 202309, Diploma Project
    <br />
    <a href="https://devops-boot.netlify.app/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <!-- <a href="https://github.com/devops-boot/fastapi-k8s">View Demo</a>
    · -->
    <a href="https://github.com/devops-boot/fastapi-k8s/issues">Report Bug</a>
    ·
    <a href="https://github.com/devops-boot/fastapi-k8s/issues">Request Feature</a>
  </p>
</div>


## About The Project

This project is part of the assessment for the French [DevOps Administrator Diploma (RNCP36061)](https://www.francecompetences.fr/recherche/rncp/36061)
It aims to demonstrate candidates' skills in architecting, building, deploying, and monitoring microservices applications on cloud infrastructure, adhering to DevOps culture, and using automation tools and techniques extensively.
The application stack includes Traefik, FastAPI, PostgreSQL, Kubernetes, and various DevOps tools for infrastructure automation, continuous integration and deployment, as well as monitoring and observability.

<!-- TODO: Add architecture schema -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Who this project is for

This project is mainly intended for the examination jury to assess candidates' skills and knowledge.

Nevertheless, authors are publishing it openly to give back to the community and hoping this may help other students or professionals.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Key Components

- **FastAPI**: A modern, fast web framework for building APIs with Python.
- **PostgreSQL**: Robust and scalable database for data persistence.
- **Traefik**: As a reverse proxy and load balancer to route traffic.
- **Kubernetes (EKS)**: Container orchestration for managing and scaling the application infrastructure.
- **Terraform, Ansible, Helm**: Infrastructure provisioning, configuration management, and cloud-native application packaging
- **GitHub Actions, Amazon ECR**: CI/CD platform and artifact registry
- **Prometheus, and ELK Stack**: Monitoring, logs and events management
- **Various DevOps processes and tools**.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Getting Started

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Prerequisites

Before using the project, ensure you have:

- Docker
- Kubectl
- AWS CLI (configured with necessary access)
- Terraform
- Helm
- Ansible

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Configuration

- Edit the `.env` file to customize environment-specific parameters.
- Configure Terraform manifests as needed for infrastructure provisioning.
- Configure Ansible playbooks as needed for server configuration.
- Configure Helm charts variables as needed for application deployment.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation & Deployment

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/devops-boot/fastapi-k8s.git
   ```

2. **Set Up Infrastructure**:
   - Use Terraform to provision the cloud infrastructure on AWS.
   - Configure Kubernetes cluster (EKS) using the provided scripts.

3. **Deploy the Application**:
   - Deploy the FastAPI application and PostgreSQL database using Helm charts.
   - Configure Traefik as the Ingress controller.

4. **Continuous Integration/Continuous Deployment**:
   - Set up GitHub Actions for CI/CD pipelines.
   - Automate the build, test, and deployment processes.

TODO: Automate all the previous steps in a single `bootstrap.sh` script.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Usage

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ### Run {Project Name}

1. {Write the step here.}
2. {Write the step here.}

<p align="right">(<a href="#readme-top">back to top</a>)</p>-->


### For users

- Access the FastAPI application through the Traefik load balancer URL.
- Utilize the APIs as per the API documentation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### For developers

TODO: Developers use cases
- Access CI/CD dashboard
- Run CI/CD tasks or pipelines in 'dev' environment

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### For DevOps and SRE

- Access 'production' environment through bastion host via {bastion_protocol} at {bastion_address}
- Access dashboards (AWS, Kubernetes?, Prometheus, Grafana, Kibana, etc)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ### Troubleshoot {Project Name}

1. {Write the step here.}
2. {Write the step here.} 

<table>
  <tr>
   <td>
    Issue
   </td>
   <td>
    Solution
   </td>
  </tr>
  <tr>
   <td>
    {Describe the issue here}
   </td>
   <td>
    {Write solution here}
   </td>
  </tr>
  <tr>
   <td>
    {Describe the issue here}
   </td>
   <td>
    {Write solution here}
   </td>
  </tr>
  <tr>
   <td>
    {Describe the issue here}
   </td>
   <td>
    {Write solution here}
   </td>
  </tr>
</table>



Other troubleshooting supports:
* {Link to FAQs}
* {Link to runbooks}
* {Link to other relevant support information}

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


## Contributing

<!-- {Include a link to your contributing guide here. If you do not have a contributing guide, incorporate the information in the README.} -->

Contributions are welcome. Please fork the repository and submit pull requests with any suggested changes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ## Additional documentation

{Include links and brief descriptions to additional documentation. Examples provided in README template guide.}

For more information:

* Reference link 1
* Reference link 2
* Reference link 3... -->


<!-- ## How to get help

{Include links and brief descriptions for support resources. Examples provided in README template guide.}

* Reference link 1
* Reference link 2
* Reference link 3... -->


## Terms of use

The project is licensed under {link to license file}.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ## Contact

- Your Name - [your-email@example.com]
- Project Link: [repository-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- ## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/devops-boot/fastapi-k8s.svg?style=for-the-badge
[contributors-url]: https://github.com/devops-boot/fastapi-k8s/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/devops-boot/fastapi-k8s.svg?style=for-the-badge
[forks-url]: https://github.com/devops-boot/fastapi-k8s/network/members
[stars-shield]: https://img.shields.io/github/stars/devops-boot/fastapi-k8s.svg?style=for-the-badge
[stars-url]: https://github.com/devops-boot/fastapi-k8s/stargazers
[issues-shield]: https://img.shields.io/github/issues/devops-boot/fastapi-k8s.svg?style=for-the-badge
[issues-url]: https://github.com/devops-boot/fastapi-k8s/issues
[license-shield]: https://img.shields.io/github/license/devops-boot/fastapi-k8s.svg?style=for-the-badge
[license-url]: https://github.com/devops-boot/fastapi-k8s/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png

 <!-- Explore other templates from [The Good Docs Project](https://thegooddocsproject.dev/). Use our [feedback form](https://thegooddocsproject.dev/feedback/?template=Readme) to give feedback on this template. -->
