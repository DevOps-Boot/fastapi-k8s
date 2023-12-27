resource "helm_release" "fastapi_app" {
  name             = "fastapi-app"
  chart            = "${path.module}/../../../../helm/fastapi-app"
  create_namespace = true
  version          = "0.1.8"
  values = [
    file("${path.module}/../../../../helm/fastapi-app/values-prod.yaml")
  ]
  description = var.cert_manager_id # Used for dependency on cert_manager
  depends_on  = [helm_release.postgres_cluster]
}
