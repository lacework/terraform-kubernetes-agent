resource "kubernetes_secret" "lacework_datacollector" {
  metadata {
    name      = var.lacework_config_name
    namespace = var.namespace
  }

  data = {
    "config.json" = templatefile("${path.module}/config.tmpl", {
      lacework_access_token = var.lacework_access_token,
      lacework_agent_tags   = jsonencode(merge({ "Env" : "k8s" }, var.lacework_agent_tags))
    })
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
    selector {
      match_labels = {
        name = "lacework"
      }
    }

    template {
      metadata {
        labels = {
          name = "lacework"
        }

        annotations = {
          lacework_config_secret_version = kubernetes_secret.lacework_datacollector.metadata.0.resource_version
        }
      }

      spec {
        container {
          name  = "lacework"
          image = var.lacework_image

          resources {
            requests {
              cpu    = var.pod_cpu
              memory = var.pod_mem
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

        toleration {
          key    = "node-role.kubernetes.io/master"
          effect = "NoSchedule"
        }
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
            secret_name = var.lacework_config_name
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

  depends_on = [kubernetes_secret.lacework_datacollector]
}
