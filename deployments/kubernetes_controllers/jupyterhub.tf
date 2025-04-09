module "jupyterhub" {
    source = "./modules/jupyterhub"
    infomaniak_jupyterhub_oauth_client_id = var.infomaniak_jupyterhub_oauth_client_id
    infomaniak_jupyterhub_oauth_client_secret = var.infomaniak_jupyterhub_oauth_client_secret

    k8s_host = local.k8s_host
    k8s_client_certificate = local.k8s_client_certificate
    k8s_client_key = local.k8s_client_key
    k8s_cluster_ca_certificate = local.k8s_cluster_ca_certificate
    
}
