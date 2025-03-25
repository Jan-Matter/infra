locals {
    argocd_version = "7.8.13"
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