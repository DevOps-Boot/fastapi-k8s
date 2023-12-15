resource "kubernetes_namespace" "preprod" {
  metadata {
    name = "preprod"
  }
}

module "storageclass" {
  # Setting up dynamic storageClass
  source = "../modules/storageclass"
}

module "releases" {
  # Helm deployments that are independent of the enviroment
  source                          = "../releases"
  s3_backup_aws_access_key_id     = var.s3_backup_aws_access_key_id
  s3_backup_aws_secret_access_key = var.s3_backup_aws_secret_access_key
}

module "environment_specific_releases" {
  # Helm deployments that are dependent of the enviroment
  source          = "./releases"
  cert_manager_id = module.releases.cert_manager_id
  depends_on      = [module.releases]
}

data "aws_eks_cluster" "default" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = var.cluster_name
}
