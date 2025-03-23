terraform {
  backend "remote" {
    organization = "dataplumbers"

    workspaces {
      name = "infra-private"
    }
  }
}