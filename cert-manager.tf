locals {
    cert_issuers = [ "letsencrypt-test", "letsencrypt-prod" ]
    cert_email = "jan.matter@dataplumbers.ch"
}

module "cert-manager" {
    source = "./modules/cert-manager"
    
    cert_email = local.cert_email
    cert_issuers = local.cert_issuers
    k8s_host = var.k8s_host
    k8s_client_certificate = var.k8s_client_certificate
    k8s_client_key = var.k8s_client_key
    k8s_cluster_ca_certificate = var.k8s_cluster_ca_certificate
    
}