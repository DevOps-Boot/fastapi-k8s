output "azs" {
  description = "Availability zones"
  value       = data.aws_availability_zones.available
}

output "aws_eks_cluster" {
  description = "Manage the EKS cluster"
  value       = data.aws_eks_cluster.default
}

output "aws_eks_cluster_auth" {
  description = "Authentication token to communicate with an EKS cluster"
  value       = data.aws_eks_cluster_auth.default
}
