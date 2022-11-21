variable "enable_cluster_agent" {
  type        = bool
  default     = false
  description = "A boolean representing whether the Lacework cluster agent should be deployed"
}

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
  default     = ""
}

variable "lacework_agent_tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to the Lacework datacollector"
  default     = {}
}

variable "lacework_agent_autoupgrade" {
  type        = bool
  description = "Boolean value to control whether or not the agent should automatically upgrade to newer versions when available"
  default     = true
}

variable "lacework_agent_configuration" {
  type        = map(any)
  description = "A map/dictionary of configuration parameters for the Lacework datacollector"
  default     = {}
}

variable "lacework_cluster_configuration" {
  type        = map(any)
  description = "A map/dictionary of configuration parameters for the Lacework K8s collector"
  default     = {}
}

variable "lacework_cluster_cpu_limit" {
  type        = string
  default     = "500m"
  description = "The limit of CPU units for the Lacework K8s collector pod"
}

variable "lacework_cluster_cpu_request" {
  type        = string
  default     = "200m"
  description = "The amount of CPU units to request for the Lacework K8s collector pod"
}

variable "lacework_cluster_exclusive" {
  type        = bool
  description = "A boolean representing whether the Lacework K8s collector will operate in exclusive mode"
  default     = false
}

variable "lacework_cluster_name" {
  type        = string
  description = "The name of the K8s cluster that the Lacework K8s collector will monitor"
  default     = ""
}

variable "lacework_cluster_region" {
  type        = string
  description = "The region of the K8s cluster that the Lacework K8s collector will monitor"
  default     = ""
}

variable "lacework_cluster_type" {
  type        = string
  description = "The type of the K8s cluster that the Lacework K8s collector will monitor"
  default     = ""
}

variable "lacework_cluster_image" {
  type        = string
  description = "The name of the image to use for deploying the Lacework K8s collector"
  default     = "lacework/k8scollector"
}

variable "lacework_cluster_image_pull_policy" {
  type        = string
  description = "The pull policy to use for deploying the Lacework K8s collector"
  default     = "Always"
}

variable "lacework_cluster_mem_limit" {
  type        = string
  default     = "1450Mi"
  description = "The limit of Memory for the Lacework K8s collector pod"
}

variable "lacework_cluster_mem_request" {
  type        = string
  default     = "512Mi"
  description = "The amount of Memory to request for the Lacework K8s collector pod"
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

variable "lacework_proxy_url" {
  type        = string
  default     = ""
  description = "The proxy URL for the Lacework agent"
}

variable "lacework_server_url" {
  type        = string
  default     = ""
  description = "The server URL for the Lacework agent"
}

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace in which to deploy"
  default     = "default"
}

variable "revision_history_limit" {
  type        = number
  description = "The number of revision hitory to keep."
  default     = 10
}

variable "pod_priority_class_name" {
  type        = string
  description = "Indicates the pod's priority. Requires an existing priority class name resource if not 'system-node-critical' and 'system-cluster-critical'"
  default     = ""
}

variable "pod_service_account" {
  type        = string
  description = "The Kubernetes ServiceAccount to use in the pod template"
  default     = ""
}

variable "pod_cpu_request" {
  type        = string
  default     = "200m"
  description = "The amount of CPU units to request for the Lacework datacollector pod"
}

variable "pod_mem_request" {
  type        = string
  default     = "512Mi"
  description = "The amount of Memory to request for the Lacework datacollector pod"
}

variable "pod_cpu_limit" {
  type        = string
  default     = "500m"
  description = "The limit of CPU units for the Lacework datacollector pod"
}

variable "pod_mem_limit" {
  type        = string
  default     = "1450Mi"
  description = "The limit of Memory for the Lacework datacollector pod"
}

variable "tolerations" {
  type = list(map(string))
  default = [
    {
      key    = "node-role.kubernetes.io/infra",
      effect = "NoSchedule"
    },
    {
      key    = "node-role.kubernetes.io/master",
      effect = "NoSchedule"
    }
  ]
  description = "A list of Kubernetes Tolerations to apply to the DaemonSet definition"
}

variable "node_selector" {
  type        = map(any)
  default     = null
  description = "A map of key:value pairs of node labels to specify which nodes to deploy the DaemonsSet to"
}
