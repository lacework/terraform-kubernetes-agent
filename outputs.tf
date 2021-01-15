output "lacework_config_secret_name" {
  description = "Name of the Kubernetes Secret containing the Lacework config"
  value       = kubernetes_secret.lacework_datacollector.metadata.0.name
}

output "lacework_config_secret_version" {
  description = "Version of the Kubernetes Secret containing the Lacework config"
  value       = kubernetes_secret.lacework_datacollector.metadata.0.resource_version
}
