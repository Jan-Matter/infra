variable "hcloud_token" {
    sensitive = true
    default   = ""
}

variable "ssh_public_key_hetzner" {
    description = "SSH public key for authentication"
    sensitive  = true
}

variable "ssh_private_key_hetzner" {
    description = "SSH private key for authentication"
    sensitive  = true
}
