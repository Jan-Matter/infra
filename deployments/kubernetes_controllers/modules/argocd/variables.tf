
variable "argocd_version" {
  description = "ArgoCD version"
  default     = "7.8.13"
}

variable "values_path" {
  description = "Path to the values file"
  default = ""
  type        = string
}

variable "infomaniak_argocd_oauth_client_id" {
  description = "Infomaniak ArgoCD OAuth client ID"
  type        = string
  sensitive = true
}

variable "infomaniak_argocd_oauth_client_secret" {
  description = "Infomaniak ArgoCD OAuth client ID"
  type        = string
  sensitive = true
}

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

variable "argocd_github_private_ssh_key" {
  description = "ArgoCD GitHub private SSH key"
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