resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.13.2"
  set {
    name  = "installCRDs"
    value = true
  }
}

resource "helm_release" "cluster_issuer" {
  name       = "cluster-issuer"
  chart      = "${path.module}/../../../helm/clusterissuer"
  version    = "0.1.6"
  depends_on = [helm_release.cert_manager]
}
