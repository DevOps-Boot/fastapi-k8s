resource "helm_release" "postgres_operator" {
  name       = "postgres-operator"
  repository = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart      = "postgres-operator"
  version    = "v1.10.1"
  depends_on = [helm_release.postgres_operator_config]
  values = [
    file("${path.module}/postgres-operator/postgres-operator-values.yaml")
  ]
}

resource "helm_release" "postgres_operator_config" {
  name    = "postgres-operator-config"
  chart   = "${path.module}/../../../helm/postgres-operator-config"
  version = "0.1.16"
  set {
    name  = "s3_backup_aws_access_key_id"
    value = var.s3_backup_aws_access_key_id
  }
  set {
    name  = "s3_backup_aws_secret_access_key"
    value = var.s3_backup_aws_secret_access_key
  }
}
