resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  depends_on = [kubernetes_namespace.argocd]

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version

  create_namespace = true

  values = var.values_path != "" ? [file(var.values_path)] : []

}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# create secret infomaniak-argocd-oauth-credentials
resource "kubernetes_secret" "infomaniak-argocd-oauth-credentials" {
  depends_on = [kubernetes_namespace.argocd]
  metadata {
    name      = "infomaniak-argocd-oauth-credentials"
    namespace = "argocd"
  }

  data = {
    "clientID"     = var.infomaniak_argocd_oauth_client_id
    "clientSecret" = var.infomaniak_argocd_oauth_client_secret
  }
}