resource "helm_release" "cloudnativepg" {
  name       = "cloudnativepg"
  namespace  = "cnpg-system"

  repository = "https://cloudnative-pg.github.io/charts"
  chart      = "cloudnative-pg"
  version    = var.cloudnativepg_controller_version

  create_namespace = true

  values = var.values_path != "" ? [file(var.values_path)] : []

}