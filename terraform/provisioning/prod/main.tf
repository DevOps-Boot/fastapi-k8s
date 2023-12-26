module "eks" {
  source = "../modules/eks"

  cluster_name = var.cluster_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    node_group_1 = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 4
      max_size     = 6
      desired_size = 5
    }
  }
}

module "vpc" {
  source = "../modules/network"

  cluster_name = var.cluster_name
  azs          = module.eks.azs

  cidr            = "10.1.0.0/16"
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets  = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
}
