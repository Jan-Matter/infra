data "http" "terraform_ip_ranges" {
  url = "https://app.terraform.io/api/meta/ip-ranges"
}