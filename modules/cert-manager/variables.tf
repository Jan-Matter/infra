
variable "cert_email" {
    description = "Email address for the certificate"
    type        = string
    default     = "jan.matter@dataplumbers.ch"
}

variable "cert_issuers" {
    description = "Certificate issuer"
    type        = list(string)
    default = [ "letsencrypt-test", "letsencrypt-prod" ]
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