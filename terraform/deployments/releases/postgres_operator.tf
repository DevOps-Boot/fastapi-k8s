resource "helm_release" "postgres_operator" {
  name       = "postgres-operator"
  repository = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart      = "postgres-operator"
  version    = "v1.10.1"
  depends_on = [helm_release.postgres_operator_config]
  set {
    name  = "configKubernetes.pod_environment_configmap"
    value = "pod-config"
  }
  set {
    name  = "configAwsOrGcp.aws_region"
    value = "us-east-1"
  }
}

resource "helm_release" "postgres_operator_config" {
  name  = "postgres-operator-config"
  chart = "${path.module}/../../../helm/postgres-operator-config"
  set {
    name  = "s3_backup_aws_access_key_id"
    value = var.s3_backup_aws_access_key_id
  }
  set {
    name  = "s3_backup_aws_secret_access_key"
    value = var.s3_backup_aws_secret_access_key
  }
}
