locals {
    argocd_version = "7.8.13"
    host = "argocd.dataplumbers.ch"
}

module "argocd" {
  
    source = "./modules/argocd"
    values_path = "./helm_values/argocd.yaml"
    
    argocd_version = local.argocd_version
    k8s_host = local.k8s_host
    k8s_client_certificate = local.k8s_client_certificate
    k8s_client_key = local.k8s_client_key
    k8s_cluster_ca_certificate = local.k8s_cluster_ca_certificate
    
}

#further add ingress

resource "kubernetes_manifest" "argocd_ingress" {
  manifest = {
    apiVersion = "networking.k8s.io/v1"
    kind = "Ingress"
    metadata = {
      name = "argocd-ingress"
      namespace = "argocd"
      annotations = {
        "kubernetes.io/ingress.class" = "nginx"
        "cert-manager.io/cluster-issuer" = "letsencrypt-prod"
        "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      }
    }
    spec = {
      tls = [
        {
          hosts = [local.host]
          secretName = "argocd-tls-secret"
        }
      ]
      rules = [
        {
          host = local.host
          http = {
            paths = [
              {
                path = "/"
                pathType = "Prefix"
                backend = {
                  service = {
                    name = "argocd-server"
                    port = {
                      number = 80
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}
