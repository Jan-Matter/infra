variable "infomaniak_jupyterhub_oauth_client_id" {
  description = "Infomaniak jupyterhub OAuth client ID"
  type        = string
  sensitive = true
}

variable "infomaniak_jupyterhub_oauth_client_secret" {
  description = "Infomaniak jupyterhub OAuth client ID"
  type        = string
  sensitive = true
}

variable "k8s_host" {
    description = "Kubernetes"
    type        = string 
}

variable "k8s_client_certificate" {
    description = "Kubernetes client certificate"
    type        = string
}

variable "k8s_client_key" {
    description = "Kubernetes client key"
    type        = string
}

variable "k8s_cluster_ca_certificate" {
    description = "Kubernetes cluster CA certificate"
    type        = string
}