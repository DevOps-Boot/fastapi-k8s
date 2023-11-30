resource "helm_release" "postgres_operator" {
  name             = "postgres-operator"
  repository       = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart            = "postgres-operator"
  create_namespace = true
  version          = "v1.10.1"
}
