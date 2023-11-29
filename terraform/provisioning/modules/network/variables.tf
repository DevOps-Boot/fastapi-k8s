variable "cluster_name" { # Required field
  description = "Cluster name"
  type        = string
}

variable "cidr" {
  description = "CIDR block"
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "azs" {
  description = "Availability zones"
  type        = any
}
