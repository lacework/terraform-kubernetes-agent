resource "kubernetes_config_map" "lacework_datacollector" {
  metadata {
    name = "lacework-config"
  }

  data = {
    "config.json" = "{\"tokens\":{\"AccessToken\":\"${var.lacework_access_token}\"}, \"tags\":{\"Env\":\"k8s\"}}"
  }
}

resource "kubernetes_daemonset" "lacework_datacollector" {
  metadata {
    name = "lacework-agent"
    labels = {
      tier = "monitoring"
      app  = "lacework-agent"
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
      }

      spec {
        container {
          name  = "lacework"
          image = "lacework/datacollector"

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
            name       = "cfgmap"
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
          name = "cfgmap"
          config_map {
            name = "lacework-config"
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
