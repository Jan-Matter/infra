
variable "argocd_version" {
  description = "ArgoCD version"
  default     = "7.8.13"
}

variable "values_path" {
  description = "Path to the values file"
  default = ""
  type        = string
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