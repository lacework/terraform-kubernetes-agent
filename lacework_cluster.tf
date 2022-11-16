locals {
  cluster_config_data = templatefile("${path.module}/config_cluster.tmpl", {
    lacework_cluster_name   = var.lacework_cluster_name
    lacework_cluster_region = var.lacework_cluster_region
    lacework_cluster_type   = var.lacework_cluster_type
    lacework_server_url     = var.lacework_server_url
  })
  cluster_config_name   = "${var.lacework_config_name}-${random_id.cluster_config_name_tail.hex}"
  merged_cluster_config = var.enable_cluster_agent ? yamlencode(merge(yamldecode(local.cluster_config_data), var.lacework_cluster_configuration)) : ""
}

resource "random_id" "cluster_config_name_tail" {
  byte_length = 8
  keepers = {
    data = local.merged_cluster_config
  }
}

resource "kubernetes_service_account" "lacework_k8s_collector" {
  count = var.enable_cluster_agent ? 1 : 0

  metadata {
    name      = "${var.lacework_agent_name}-cluster-sa"
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role" "lacework_k8s_collector" {
  count = var.enable_cluster_agent ? 1 : 0

  metadata {
    name = "${var.lacework_agent_name}-cluster-role"
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list"]
  }
}

resource "kubernetes_cluster_role_binding" "lacework_k8s_collector" {
  count = var.enable_cluster_agent ? 1 : 0

  metadata {
    name = "${var.lacework_agent_name}-cluster-role-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "${var.lacework_agent_name}-cluster-role"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "${var.lacework_agent_name}-cluster-sa"
    namespace = var.namespace
  }

  depends_on = [
    kubernetes_service_account.lacework_k8s_collector,
    kubernetes_cluster_role.lacework_k8s_collector
  ]
}

resource "kubernetes_secret" "lacework_k8s_collector" {
  count = var.enable_cluster_agent ? 1 : 0

  metadata {
    name      = local.cluster_config_name
    namespace = var.namespace

    labels = {
      tier = "monitoring"
      app  = "${var.lacework_agent_name}-cluster"
    }
  }

  data = {
    "config.yaml" = local.merged_cluster_config
  }
}

resource "kubernetes_deployment" "lacework_k8s_collector" {
  count = var.enable_cluster_agent ? 1 : 0

  metadata {
    name      = "${var.lacework_agent_name}-cluster"
    namespace = var.namespace

    labels = {
      tier = "monitoring"
      app  = "${var.lacework_agent_name}-cluster"
    }
  }

  spec {
    selector {
      match_labels = {
        name = "${var.lacework_agent_name}-cluster"
      }
    }

    template {
      metadata {
        labels = {
          name = "${var.lacework_agent_name}-cluster"
        }

        annotations = {
          lacework_config_version = kubernetes_secret.lacework_k8s_collector[0].metadata.0.resource_version
        }
      }

      spec {
        service_account_name             = "${var.lacework_agent_name}-cluster-sa"
        termination_grace_period_seconds = 20

        container {
          name              = "${var.lacework_agent_name}-cluster"
          image             = var.lacework_cluster_image
          image_pull_policy = var.lacework_cluster_image_pull_policy

          env {
            name = "LaceworkAccessToken"
            value_from {
              secret_key_ref {
                name = "${var.lacework_agent_name}-access-token"
                key  = "agent-access-token"
              }
            }
          }

          resources {
            requests = {
              cpu    = var.lacework_cluster_cpu_request
              memory = var.lacework_cluster_mem_request
            }
            limits = {
              cpu    = var.lacework_cluster_cpu_limit
              memory = var.lacework_cluster_mem_limit
            }
          }

          security_context {
            privileged                 = false
            run_as_non_root            = true
            run_as_user                = 5001
            read_only_root_filesystem  = true
            allow_privilege_escalation = false
          }

          volume_mount {
            name       = "cfgmap"
            mount_path = "/config"
          }
        }

        volume {
          name = "cfgmap"
          secret {
            secret_name = local.cluster_config_name
            items {
              key  = "config.yaml"
              path = "config.yaml"
            }
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_service_account.lacework_k8s_collector,
    kubernetes_cluster_role.lacework_k8s_collector,
    kubernetes_secret.lacework_k8s_collector,
    kubernetes_cluster_role_binding.lacework_k8s_collector,
  ]
}
