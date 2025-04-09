resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version

  create_namespace = true

  values = var.values_path != "" ? [file(var.values_path)] : []

}

# create secret infomaniak-argocd-oauth-credentials
resource "kubernetes_secret" "infomaniak-argocd-oauth-credentials" {
  metadata {
    name      = "infomaniak-argocd-oauth-credentials"
    namespace = "argocd"
  }

  data = {
    "clientID"     = var.infomaniak_argocd_oauth_client_id
    "clientSecret" = var.infomaniak_argocd_oauth_client_secret
  }
  depends_on = [ helm_release.argocd ]
}

# create secret infomaniak-argocd-oauth-credentials
resource "kubernetes_secret" "argocd-airflow-github-private-ssh-key" {
  metadata {
    name      = "argocd-airflow-github-private-ssh-key"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }
  data = {
    "project" = "default"
    "type"          = "git"
    "url"           = "git@github.com:Jan-Matter/airflow.git"
    "insecure"   = false
    "sshPrivateKey" = var.argocd_github_private_ssh_key
  }
  depends_on = [ helm_release.argocd ]
}


# create secret infomaniak-argocd-oauth-credentials
resource "kubernetes_secret" "argocd-kubernetes-deplyoments-github-private-ssh-key" {
  metadata {
    name      = "argocd-kubernetes-deployments-github-private-ssh-key"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }
  data = {
    "project" = "default"
    "type"          = "git"
    "url"           = "git@github.com:Jan-Matter/kubernetes-deployments.git"
    "insecure"   = false
    "sshPrivateKey" = var.argocd_github_private_ssh_key
  }
  depends_on = [ helm_release.argocd ]
}