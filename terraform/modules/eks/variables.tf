variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  type = any
}

variable "eks_managed_node_group_defaults" {
  type = any
}
