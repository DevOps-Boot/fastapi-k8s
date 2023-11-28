provider "kubernetes" {
  host                   = module.eks.aws_eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks.aws_eks_cluster.certificate_authority[0].data)
  token                  = module.eks.aws_eks_cluster_auth.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.aws_eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks.aws_eks_cluster.certificate_authority[0].data)
    token                  = module.eks.aws_eks_cluster_auth.token
  }
}

provider "aws" {
  region = var.region
}
