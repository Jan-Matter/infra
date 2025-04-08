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
          "targetRevision": "1.15.0",
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
        },
        "syncOptions" = [
          "CreateNamespace=true"
        ]
      }
    }
  }
}


resource "kubernetes_manifest" "spark-prod" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = "spark"
      "namespace" = "argocd"
    }
    "spec" = {
      "project" = "default"
      "sources" = [
        {
          "chart": "spark-operator",
          "repoURL": "https://kubeflow.github.io/spark-operator",
          "targetRevision": "2.1.1",
          "helm": {
            "releaseName": "spark-prod",
            "valueFiles" = [
              "$values/spark/values.yaml"
            ]
          }
        },
        {
          "repoURL" = "git@github.com:Jan-Matter/kubernetes-deployments.git",
          "targetRevision" = "main",
          "ref" = "values"
        }
      ]
      "destination" = {
        "server": "https://kubernetes.default.svc",
        "namespace": "spark"
      }
      "syncPolicy" = {
        "automated" = {
          "prune"    = true
          "selfHeal" = true
        },
        "syncOptions" = [
          "CreateNamespace=true"
        ]
      }
    }
  }
}