terraform {
  backend "remote" {
    organization = "dataplumbers"

    workspaces {
      name = "private-kubernetes-infra"
    }
  }
}