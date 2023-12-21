resource "helm_release" "kube-prom-stack" {
  name             = "kube-prom-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  version          = "55.1.0"
  values = [
    file("${path.module}/kube-prometheus-stack/kube-prometheus-stack-values.yaml")
  ]
}

resource "helm_release" "custom_monitoring" {
  name       = "custom-monitoring" # Setting up our own custom monitoring configuration
  chart      = "${path.module}/../../../helm/monitoring"
  depends_on = [helm_release.kube-prom-stack]
}
