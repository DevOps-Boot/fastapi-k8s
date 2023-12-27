resource "helm_release" "postgres_cluster" {
  name             = "postgres-cluster"
  chart            = "${path.module}/../../../../helm/postgres-cluster"
  create_namespace = true
  version          = "0.1.12"
  values = [
    file("${path.module}/../../../../helm/postgres-cluster/values-prod.yaml")
  ]
}
