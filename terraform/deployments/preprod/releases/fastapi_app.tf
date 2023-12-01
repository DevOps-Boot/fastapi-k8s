resource "helm_release" "fastapi_app" {
  name             = "fastapi-app"
  chart            = "${path.module}/../../../../helm/fastapi-app"
  create_namespace = true
  values = [
    file("${path.module}/../../../../helm/fastapi-app/values-preprod.yaml")
  ]
  description = var.cert_manager_id # Used for dependency on cert_manager
  depends_on  = [helm_release.postgres_cluster]
}
