variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
}

variable "lacework_agent_name" {
  type        = string
  description = "The name for the Lacework agent service within Kubernetes"
  default     = "lacework-agent"
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

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace in which to deploy"
  default     = "default"
}

variable "pod_cpu" {
  type        = string
  default     = "100m"
  description = "The amount of CPU units to assign to the Lacework datacollector pod"
}

variable "pod_mem" {
  type        = string
  default     = "256Mi"
  description = "The amount of Memory (Mi) to assign to the Lacework datacollector pod"
}
