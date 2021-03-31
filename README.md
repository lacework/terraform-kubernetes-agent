<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-kubernetes-agent

## Description

A Terraform Module to create a Secret and DaemonSet for deploying the Lacework Datacollector Agent in a Kubernetes cluster.

## Kubernetes

The `main.tf` file will configure a Kubernetes Secret and DaemonSet which will then be used to run the Lacework Datacollector pod across all worker nodes in a cluster.

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| lacework_access_token | The Lacework Access Token for the Datacollector to use | `string` | null |
| lacework_agent_name | The name for the Lacework agent service within Kubernetes | `string` | "lacework-agent" |
| lacework_agent_interface_connection_size | Desired value for the InterfaceConnectionSize Lacework agent parameter | `string` | "50000" |
| lacework_agent_tags | A map/dictionary of Tags to be assigned to the Lacework datacollector | `map` | {} |
| lacework_config_name | The name for the Lacework agent configuration within Kubernetes | `string` | "lacework-config" |
| lacework_image | The name of the image to use for deploying the Lacework datacollector | `string` | "lacework/datacollector" |
| lacework_image_pull_policy | The pull policy to use for deploying the Lacework datacollector | `string` | "Always" |
| namespace | The Kubernetes namespace in which to deploy | `string` | "default" |
| pod_service_account | The Kubernetes ServiceAccount to use in the pod template | `string` | "" |
| pod_cpu_request | The amount of CPU units to request for the Lacework datacollector pod | `string` | "100m" |
| pod_mem_request | The amount of Memory to request for the Lacework datacollector pod | `string` | "512Mi" |
| pod_cpu_limit | The limit of CPU units for the Lacework datacollector pod | `string` | "1" |
| pod_mem_limit | The limit of Memory for the Lacework datacollector pod | `string` | "1024Mi" |
| tolerations | A list of [Kubernetes Tolerations](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemonset#toleration) to apply to the DaemonSet definition | `list(map(string))` | `[{ key = "node-role.kubernetes.io/master", effect = "NoSchedule" }]` |

## Outputs

| Name | Description |
|------|-------------|
| lacework_config_name | Name of the Kubernetes Secret containing the Lacework config |
| lacework_config_version | Version of the Kubernetes Secret containing the Lacework config |
| lacework_datacollector_name | Name of the Kubernetes DaemonSet for the Lacework datacollector |
| lacework_datacollector_version | Version of the Kubernetes DaemonSet for the Lacework datacollector |
