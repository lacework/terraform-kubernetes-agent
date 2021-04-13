# Kubernetes Deployment w/ Custom Resource Allocation

This example will genereate a Kubernetes DaemonSet and Secret configuration for deploying the Lacework Datacollector Agent with custom resource allocation.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 0.1"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  pod_cpu_request = "200m"
  pod_mem_request = "512Mi"
  pod_cpu_limit   = "1"
  pod_mem_limit   = "1024Mi"
}
```
