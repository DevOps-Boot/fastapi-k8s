resource "helm_release" "postgres_cluster" {
  name             = "postgres-cluster"
  chart            = "${path.module}/../../../../postgres"
  create_namespace = true
  values = [
    file("${path.module}/../../../../postgres/values-preprod.yaml")
  ]
}
