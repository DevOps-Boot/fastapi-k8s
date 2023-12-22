
variable "s3_backup_aws_access_key_id" {
  description = "AWS access key ID for the S3 bucket"
  type        = string
  sensitive   = true
}

variable "s3_backup_aws_secret_access_key" {
  description = "AWS secret access key for the S3 bucket"
  type        = string
  sensitive   = true
}

variable "grafana_admin_password" {
  description = "Password for the admin user of Grafana"
  type        = string
  sensitive   = true
}
