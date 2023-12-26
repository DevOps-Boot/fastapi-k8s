terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.28"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
  required_version = "~> 1.6"
}
