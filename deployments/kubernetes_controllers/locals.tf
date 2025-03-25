
locals {
    k8s_host = var.k8s_host
    k8s_client_certificate = base64decode(var.k8s_client_certificate)
    k8s_client_key = base64decode(var.k8s_client_key)
    k8s_cluster_ca_certificate = base64decode(var.k8s_cluster_ca_certificate)
}