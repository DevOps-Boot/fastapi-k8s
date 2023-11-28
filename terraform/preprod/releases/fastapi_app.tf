resource "helm_release" "fastapi_app" {
  name             = "fastapi-app"
  chart            = "${path.module}/../../../helm"
  create_namespace = true
  values = [
    file("${path.module}/../../../helm/values-preprod.yaml")
  ]
}
