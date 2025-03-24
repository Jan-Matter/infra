locals {
    cert_email = "jan.matter@dataplumbers.ch"
}

resource "null_resource" "wait_for_kubeconfig" {
  depends_on = [module.kube-hetzner]
}

module "cert-manager" {
    source = "./modules/cert-manager"
    cert_email = local.cert_email
    k8s_host = local.k8s_host
    k8s_client_certificate = local.k8s_client_certificate
    k8s_client_key = local.k8s_client_key
    k8s_cluster_ca_certificate = local.k8s_cluster_ca_certificate

    depends_on = [null_resource.wait_for_kubeconfig]
    
}