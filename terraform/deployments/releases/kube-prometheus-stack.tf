resource "helm_release" "kube-prom-stack" {
  name             = "kube-prom-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  version          = "55.1.0"
  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
  values = [
    file("${path.module}/kube-prometheus-stack/kube-prometheus-stack-values.yaml")
  ]
}
