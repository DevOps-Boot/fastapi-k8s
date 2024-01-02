resource "helm_release" "efk" {
  name             = "efk"
  chart            = "${path.module}/../../../helm/efk"
  version          = "0.2.8"
  namespace        = "monitoring"
  create_namespace = true
  recreate_pods    = true
  set {
    name  = "namespace"
    value = "monitoring"
  }
}
