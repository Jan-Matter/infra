locals {
    argocd_version = "7.8.13"
}

module "argocd" {
  
    source = "./modules/argocd"
    values_path = file("./helm_values/argocd.yaml")
    
    argocd_version = local.argocd_version
    k8s_host = var.k8s_host
    k8s_client_certificate = var.k8s_client_certificate
    k8s_client_key = var.k8s_client_key
    k8s_cluster_ca_certificate = var.k8s_cluster_ca_certificate
    
}