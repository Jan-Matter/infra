resource "kubernetes_manifest" "airflow-prod" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = "airflow"
      "namespace" = "argocd"
    }
    "spec" = {
      "project" = "default"
      "sources" = [
        {
          "chart": "airflow",
          "repoURL": "https://airflow.apache.org",
          "targetRevision": "8.9.0",
          "helm": {
            "releaseName": "airflow-prod",
            "valueFiles" = [
              "$values/helm-values/airflow-prod/values.yaml"
            ]
          }
        },
        {
          "repoURL" = "git@github.com:Jan-Matter/airflow.git",
          "targetRevision" = "main",
          "ref" = "values"
        }
      ]
      "destination" = {
        "server": "https://kubernetes.default.svc",
        "namespace": "airflow"
      }
      "syncPolicy" = {
        "automated" = {
          "prune"    = true
          "selfHeal" = true
        }
      }
    }
  }
}