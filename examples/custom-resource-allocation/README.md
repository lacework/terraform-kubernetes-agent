# Kubernetes Deployment w/ Custom Resource Allocation

This example shows how to customize the resource allocation of the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 2.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  pod_cpu_request = "200m"
  pod_mem_request = "512Mi"
  pod_cpu_limit   = "1"
  pod_mem_limit   = "1024Mi"
}
```
