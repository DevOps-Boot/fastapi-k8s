resource "kubernetes_manifest" "clusterissuer_letsencrypt_prod" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name"            = "letsencrypt-prod"
      "cert_manager_id" = var.cert_manager_id
    }
    "spec" = {
      "acme" = {
        "email" = "github@kvark.fr"
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "http01" = {
              "ingress" = {
                "class" = "traefik"
              }
            }
          },
        ]
      }
    }
  }
}
