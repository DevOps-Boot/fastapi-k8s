terraform {
  /*
  cloud {
    workspaces {
      name = "devops-boot-preprod"
    }
  }
*/
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }
  }

  required_version = "~> 1.6"
}
