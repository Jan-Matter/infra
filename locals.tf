

locals {
    k8s_host = module.kube-hetzner.kubeconfig["clusters"][0]["cluster"]["server"]
    k8s_client_certificate = base64decode(module.kube-hetzner.kubeconfig["users"][0]["user"]["client-certificate-data"])
    k8s_client_key = base64decode(module.kube-hetzner.kubeconfig["users"][0]["user"]["client-key-data"])
    k8s_cluster_ca_certificate = base64decode(module.kube-hetzner.kubeconfig["clusters"][0]["cluster"]["certificate-authority-data"])
}