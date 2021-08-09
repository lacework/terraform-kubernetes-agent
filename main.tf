locals {
  config_data = templatefile("${path.module}/config.tmpl", {
    lacework_access_token                    = var.lacework_access_token,
    lacework_agent_interface_connection_size = var.lacework_agent_interface_connection_size
    lacework_agent_tags                      = jsonencode(merge({ "Env" : "k8s" }, var.lacework_agent_tags))
    lacework_proxy_url                       = var.lacework_proxy_url
    lacework_server_url                      = var.lacework_server_url
  })
  config_name = "${var.lacework_config_name}-${random_id.config_name_tail.hex}"
}

resource "random_id" "config_name_tail" {
  byte_length = 8
  keepers = {
    data = local.config_data
  }
}

resource "kubernetes_secret" "lacework_config" {
  metadata {
    name      = local.config_name
    namespace = var.namespace
  }

  data = {
    "config.json" = local.config_data
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

        dynamic "toleration" {
          for_each = var.tolerations
          content {
            key      = toleration.value["key"]
            operator = lookup(toleration.value, "operator", "Equal")
            value    = lookup(toleration.value, "operator", "Equal") == "Exists" ? "" : lookup(toleration.value, "value", "")
            effect   = toleration.value["effect"]
          }
        }

        service_account_name = var.pod_service_account

        container {
          name              = "lacework"
          image             = var.lacework_image
          image_pull_policy = var.lacework_image_pull_policy

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
            privileged = true
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
            name       = "run-sock"
            mount_path = "/var/run/docker.sock"
          }
          volume_mount {
            name       = "run-pid"
            mount_path = "/var/run/docker.pid"
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
            name       = "hostroot"
            mount_path = "/laceworkfim"
            read_only  = true
          }
          volume_mount {
            name       = "podinfo"
            mount_path = "/etc/podinfo"
          }
        }
        host_network = true
        host_pid     = true

        volume {
          name = "dev"
          host_path {
            path = "/dev"
          }
        }
        volume {
          name = "run-sock"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
        volume {
          name = "run-pid"
          host_path {
            path = "/var/run/docker.pid"
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
          name = "config"
          secret {
            secret_name = local.config_name
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
          }
        }
      }
    }
  }
}
