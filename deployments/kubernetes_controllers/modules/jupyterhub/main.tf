#create namespace jupyter
resource "kubernetes_namespace" "jupyter" {
  metadata {
    name = "jupyter"
  }
}

# create secret infomaniak-jupyterhub-oauth-credentials
resource "kubernetes_secret" "infomaniak-jupyterhub-oauth-credentials" {
  metadata {
    name      = "infomaniak-argocd-oauth-credentials"
    namespace = "jupyter"
  }

  data = {
    "clientID"     = var.infomaniak_jupyterhub_oauth_client_id
    "clientSecret" = var.infomaniak_jupyterhub_oauth_client_secret
  }
  depends_on = [ kubernetes_namespace.jupyter ]
}