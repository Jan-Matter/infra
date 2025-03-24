variable "hcloud_token" {
    sensitive = true
    type        = string 
    default   = ""
}

variable "ssh_public_key_hetzner" {
    description = "SSH public key for authentication"
    type        = string 
    sensitive  = true
}

variable "ssh_private_key_hetzner" {
    description = "SSH private key for authentication"
    type        = string 
    sensitive  = true
}

variable "k8s_host" {
    description = "Kubernetes"
    type        = string 
    sensitive = true
}

variable "k8s_client_certificate" {
    description = "Kubernetes client certificate"
    type        = string
    sensitive = true
}

variable "k8s_client_key" {
    description = "Kubernetes client key"
    type        = string
    sensitive = true
}

variable "k8s_cluster_ca_certificate" {
    description = "Kubernetes cluster CA certificate"
    type        = string
    sensitive = true
}