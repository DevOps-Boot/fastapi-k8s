module "eks" {
  source = "../modules/eks"

  cluster_name = var.cluster_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    node_group_1 = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 3
      max_size     = 5
      desired_size = 3
    }
  }
}

module "vpc" {
  source = "../modules/network"

  cluster_name = var.cluster_name
  azs          = module.eks.azs

  cidr            = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

module "releases" {
  # Helm deployments that are independent of the enviroment
  source = "../modules/releases"
}

module "preprod-releases" {
  # Helm deployments that depend on the environment (preprod, prod, etc.)
  source = "./releases"
}
