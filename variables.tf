variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
}

variable "lacework_agent_name" {
  type        = string
  description = "The name for the Lacework agent service within Kubernetes"
  default     = "lacework-agent"
}

variable "lacework_agent_interface_connection_size" {
  type        = string
  description = "Desired value for the InterfaceConnectionSize Lacework agent parameter"
  default     = "10000"
}

variable "lacework_agent_tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to the Lacework datacollector"
  default     = {}
}

variable "lacework_config_name" {
  type        = string
  description = "The name for the Lacework agent configuration within Kubernetes"
  default     = "lacework-config"
}

variable "lacework_image" {
  type        = string
  description = "The name of the image to use for deploying the Lacework datacollector"
  default     = "lacework/datacollector"
}

variable "lacework_image_pull_policy" {
  type        = string
  description = "The pull policy to use for deploying the Lacework datacollector"
  default     = "Always"
}

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace in which to deploy"
  default     = "default"
}

variable "pod_cpu_request" {
  type        = string
  default     = "100m"
  description = "The amount of CPU units to request for the Lacework datacollector pod"
}

variable "pod_mem_request" {
  type        = string
  default     = "512Mi"
  description = "The amount of Memory to request for the Lacework datacollector pod"
}

variable "pod_cpu_limit" {
  type        = string
  default     = "1"
  description = "The limit of CPU units for the Lacework datacollector pod"
}

variable "pod_mem_limit" {
  type        = string
  default     = "1024Mi"
  description = "The limit of Memory for the Lacework datacollector pod"
}

variable "tolerations" {
  type        = list(map(string))
  default     = [{ key = "node-role.kubernetes.io/master", effect = "NoSchedule" }]
  description = "A list of Kubernetes Tolerations to apply to the DaemonSet definition"
}
