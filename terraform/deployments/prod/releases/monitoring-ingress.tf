resource "helm_release" "monitoring_ingress" {
  name    = "monitoring-ingress"
  chart   = "${path.module}/../../../../helm/monitoring-ingress"
  version = "0.1.3"
  values = [
    file("${path.module}/../../../../helm/monitoring-ingress/values-prod.yaml")
  ]
}
