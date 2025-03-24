resource "kubernetes_manifest" "letsencrypt" {
  provider = kubernetes.default
  for_each = toset(var.cert_issuers)

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "ClusterIssuer"
    "metadata" = {
      "name" = each.value
    }
    "spec" = {
      "acme" = {
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "email" = var.cert_email
        "privateKeySecretRef" = {
          "name" = each.value
        }
        "solvers" = [
          {
            "http01" = {
              "ingress" = {
                "class" = "nginx"
              }
            }
          }
        ]
      }
    }
  }
}
