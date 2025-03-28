locals {
    argocd_version = "7.8.13"
}

module "argocd" {
  
    source = "./modules/argocd"
    values_path = "./helm_values/argocd.yaml"
    infomaniak_argocd_oauth_client_id = var.infomaniak_argocd_oauth_client_id
    infomaniak_argocd_oauth_client_secret = var.infomaniak_argocd_oauth_client_secret
    argocd_github_private_ssh_key = var.argocd_github_private_ssh_key
    
    argocd_version = local.argocd_version
    k8s_host = local.k8s_host
    k8s_client_certificate = local.k8s_client_certificate
    k8s_client_key = local.k8s_client_key
    k8s_cluster_ca_certificate = local.k8s_cluster_ca_certificate
    
}
