

locals {
    kubeconfig = yamldecode(module.kube-hetzner.kubeconfig)
    k8s_host = local.kubeconfig["clusters"][0]["cluster"]["server"]
    k8s_client_certificate = base64decode(local.kubeconfig["users"][0]["user"]["client-certificate-data"])
    k8s_client_key = base64decode(local.kubeconfig["users"][0]["user"]["client-key-data"])
    k8s_cluster_ca_certificate = base64decode(local.kubeconfig["clusters"][0]["cluster"]["certificate-authority-data"])
}