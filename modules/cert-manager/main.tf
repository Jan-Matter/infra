resource "kubernetes_manifest" "letsencrypt" {

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-prod" # Replace with your desired name
    }
    "spec" = {
      "acme" = {
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "email" = var.cert_email
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod" # Replace with your desired secret name
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

resource "kubernetes_manifest" "letsencrypt" {

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-test" # Replace with your desired name
    }
    "spec" = {
      "acme" = {
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "email" = var.cert_email
        "privateKeySecretRef" = {
          "name" = "letsencrypt-test" # Replace with your desired secret name
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
