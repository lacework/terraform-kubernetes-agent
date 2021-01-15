<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="200"></a>

# Terraform module for deploying Lacework in a Kubernetes cluster

## Description

This is a repository of Terraform code which deploys the Lacework Datacollector as a DaemonSet in a Kubernetes (K8s) cluster.

## Kubernetes

The `kubernetes.tf` file will configure a Kubernetes ConfigMap and DaemonSet which will then be used to run the Lacework Datacollector pod across all worker nodes in a cluster.

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| lacework_access_token | The Lacework Access Token for the Datacollector to use | `string` | null |
| lacework_agent_name | The name for the Lacework agent service within Kubernetes | `string` | "lacework-agent" |
| lacework_agent_tags | A map/dictionary of Tags to be assigned to the Lacework datacollector | `map` | {} |
| lacework_config_name | The name for the Lacework agent configuration within Kubernetes | `string` | "lacework-config" |
| lacework_image | The name of the image to use for deploying the Lacework datacollector | `string` | "lacework/datacollector" |
| namespace | The Kubernetes namespace in which to deploy | `string` | "default" |
| pod_cpu | The amount of CPU units to assign to the pod | `string` | "100m" |
| pod_mem | The amount of Memory (Mi) to assign to the pod | `string` | "256Mi" |
