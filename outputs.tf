output "lacework_config_name" {
  description = "Name of the Kubernetes Secret containing the Lacework config"
  value       = kubernetes_secret.lacework_config.metadata.0.name
}

output "lacework_config_version" {
  description = "Version of the Kubernetes Secret containing the Lacework config"
  value       = kubernetes_secret.lacework_config.metadata.0.resource_version
}

output "lacework_datacollector_name" {
  description = "Name of the Kubernetes DaemonSet for the Lacework datacollector"
  value       = kubernetes_daemonset.lacework_datacollector.metadata.0.name
}

output "lacework_datacollector_version" {
  description = "Version of the Kubernetes DaemonSet for the Lacework datacollector"
  value       = kubernetes_daemonset.lacework_datacollector.metadata.0.resource_version
}
