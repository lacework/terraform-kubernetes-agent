# Terraform for deploying Lacework as a Kubernetes cluster

## Description

This is a repository of Terraform code which deploys the Lacework Datacollector as a DaemonSet in an Kubernetes (K8s) cluster.

## Kubernetes

The `kubernetes.tf` file will configure a Kubernetes ConfigMap and DaemonSet which will then be used to run the Lacework Datacollector pod across all worker nodes in a cluster.

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| lacework_access_token | The Lacework Access Token for the Datacollector to use | `string` | null |
| pod_cpu | The amount of CPU units to assign to the task | `string` | "100m" |
| pod_mem | The amount of Memory (Mi) to assign to the task | `string` | "256Mi" |
