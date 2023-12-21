resource "helm_release" "postgres_cluster" {
  name             = "postgres-cluster"
  chart            = "${path.module}/../../../../helm/postgres"
  create_namespace = true
  values = [
    file("${path.module}/../../../../helm/postgres-cluster/values-preprod.yaml")
  ]
}
