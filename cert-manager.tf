locals {
    cert_email = "jan.matter@dataplumbers.ch"
}

module "cert-manager" {
    source = "./modules/cert-manager"
    cert_email = local.cert_email
    k8s_host = yamldecode(module.kube-hetzner.kubeconfig)["clusters"][0]["cluster"]["server"]
    k8s_client_certificate = base64decode(yamldecode(module.kube-hetzner.kubeconfig)["users"][0]["user"]["client-certificate-data"])
    k8s_client_key = base64decode(yamldecode(module.kube-hetzner.kubeconfig)["users"][0]["user"]["client-key-data"])
    k8s_cluster_ca_certificate = base64decode(yamldecode(module.kube-hetzner.kubeconfig)["clusters"][0]["cluster"]["certificate-authority-data"])
    
}