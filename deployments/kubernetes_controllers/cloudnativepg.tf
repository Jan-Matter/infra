locals {
    cloudnativepg_controller_version = "0.23.2"
}

module "cloudnativepg" {
  
    source = "./modules/cloudnativepg"
    values_path = "./helm_values/cloudnativepg.yaml"
    
    cloudnativepg_controller_version = local.cloudnativepg_controller_version
    k8s_host = local.k8s_host
    k8s_client_certificate = local.k8s_client_certificate
    k8s_client_key = local.k8s_client_key
    k8s_cluster_ca_certificate = local.k8s_cluster_ca_certificate
    
}