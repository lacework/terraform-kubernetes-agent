locals {
  node_config_data = templatefile("${path.module}/config_node.tmpl", {
    lacework_agent_autoupgrade               = var.lacework_agent_autoupgrade
    lacework_agent_interface_connection_size = var.lacework_agent_interface_connection_size
    lacework_agent_tags                      = jsonencode(merge({ "Env" : "k8s" }, var.lacework_agent_tags))
    lacework_cluster_exclusive               = var.lacework_cluster_exclusive
    lacework_cluster_region                  = var.lacework_cluster_region
    lacework_cluster_type                    = var.lacework_cluster_type
    lacework_proxy_url                       = var.lacework_proxy_url
    lacework_server_url                      = var.lacework_server_url
  })
  lacework_agent_log_stdout = var.lacework_agent_log_stdout ? "yes" : ""
  node_config_name          = "${var.lacework_config_name}-${random_id.node_config_name_tail.hex}"
  merged_node_config        = jsonencode(merge(jsondecode(local.node_config_data), var.lacework_agent_configuration))
}

resource "random_id" "node_config_name_tail" {
  byte_length = 8
  keepers = {
    data = local.merged_node_config
  }
}

resource "kubernetes_secret" "lacework_access_token" {
  metadata {
    name      = "${var.lacework_agent_name}-access-token"
    namespace = var.namespace
    labels = {
      tier = "monitoring"
      app  = var.lacework_agent_name
    }
  }

  data = {
    "agent-access-token" = var.lacework_access_token
  }
}

resource "kubernetes_secret" "lacework_config" {
  metadata {
    name      = local.node_config_name
    namespace = var.namespace

    labels = {
      tier = "monitoring"
      app  = "${var.lacework_agent_name}-cluster"
    }
  }

  data = {
    "config.json" = local.merged_node_config
  }
}

resource "kubernetes_daemonset" "lacework_datacollector" {
  metadata {
    name      = var.lacework_agent_name
    namespace = var.namespace

    labels = {
      tier = "monitoring"
      app  = var.lacework_agent_name
    }
  }

  spec {
    revision_history_limit = var.revision_history_limit
    selector {
      match_labels = {
        name = "lacework"
      }
    }

    template {
      metadata {
        labels = {
          name = "lacework"
          app  = var.lacework_agent_name
        }

        annotations = {
          lacework_config_version = kubernetes_secret.lacework_config.metadata.0.resource_version
        }
      }

      spec {

        affinity {
          node_affinity {
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                match_expressions {
                  key      = "kubernetes.io/arch"
                  operator = "In"
                  values = [
                    "amd64",
                    "arm64"
                  ]
                }
                match_expressions {
                  key      = "kubernetes.io/os"
                  operator = "In"
                  values = [
                    "linux"
                  ]
                }
              }
            }
          }
        }

        dynamic "toleration" {
          for_each = var.tolerations
          content {
            key      = lookup(toleration.value, "key", "")
            operator = lookup(toleration.value, "operator", "Equal")
            value    = lookup(toleration.value, "operator", "Equal") == "Exists" ? "" : lookup(toleration.value, "value", "")
            effect   = lookup(toleration.value, "effect", "")
          }
        }

        node_selector = var.node_selector

        priority_class_name  = var.pod_priority_class_name
        service_account_name = var.pod_service_account

        container {
          name              = "lacework"
          image             = var.lacework_image
          image_pull_policy = var.lacework_image_pull_policy

          env {
            name  = "LaceworkLogStdout"
            value = local.lacework_agent_log_stdout
          }

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
              cpu    = var.pod_cpu_request
              memory = var.pod_mem_request
            }
            limits = {
              cpu    = var.pod_cpu_limit
              memory = var.pod_mem_limit
            }
          }

          security_context {
            privileged                 = true
            run_as_non_root            = false
            run_as_user                = 0
            read_only_root_filesystem  = false
            allow_privilege_escalation = true
          }

          volume_mount {
            name       = "config"
            mount_path = "/var/lib/lacework/config"
          }
          volume_mount {
            name       = "dev"
            mount_path = "/dev"
          }
          volume_mount {
            name       = "sys"
            mount_path = "/sys"
          }
          volume_mount {
            name       = "log"
            mount_path = "/var/log"
          }
          volume_mount {
            name       = "passwd"
            mount_path = "/etc/passwd"
            read_only  = true
          }
          volume_mount {
            name       = "group"
            mount_path = "/etc/group"
            read_only  = true
          }
          volume_mount {
            name       = "hostlacework"
            mount_path = "/var/lib/lacework/collector"
          }
          volume_mount {
            name       = "hostlaceworkcontroller"
            mount_path = "/var/lib/lacework/controller"
          }
          volume_mount {
            name       = "hostroot"
            mount_path = "/laceworkfim"
            read_only  = true
          }
          volume_mount {
            name       = "podinfo"
            mount_path = "/etc/podinfo"
          }
        }
        termination_grace_period_seconds = 20
        host_network                     = true
        host_pid                         = true
        dns_policy                       = "ClusterFirstWithHostNet"

        volume {
          name = "dev"
          host_path {
            path = "/dev"
          }
        }
        volume {
          name = "sys"
          host_path {
            path = "/sys"
          }
        }
        volume {
          name = "log"
          host_path {
            path = "/var/log"
          }
        }
        volume {
          name = "passwd"
          host_path {
            path = "/etc/passwd"
          }
        }
        volume {
          name = "group"
          host_path {
            path = "/etc/group"
          }
        }
        volume {
          name = "hostroot"
          host_path {
            path = "/"
          }
        }
        volume {
          name = "hostlacework"
          host_path {
            path = "/var/lib/lacework/collector"
          }
        }
        volume {
          name = "hostlaceworkcontroller"
          host_path {
            path = "/var/lib/lacework/controller"
          }
        }
        volume {
          name = "config"
          secret {
            secret_name = local.node_config_name
            items {
              key  = "config.json"
              path = "config.json"
            }
          }
        }
        volume {
          name = "podinfo"
          downward_api {
            items {
              path = "labels"
              field_ref {
                field_path = "metadata.labels"
              }
            }
            items {
              path = "annotations"
              field_ref {
                field_path = "metadata.annotations"
              }
            }
            items {
              path = "name"
              field_ref {
                field_path = "metadata.name"
              }
            }
            items {
              path = "poduid"
              field_ref {
                field_path = "metadata.uid"
              }
            }
            items {
              path = "namespace"
              field_ref {
                field_path = "metadata.namespace"
              }
            }
          }
        }
      }
    }
  }
}
