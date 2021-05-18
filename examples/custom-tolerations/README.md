# Kubernetes Deployment w/ Custom Tolerations

This example will genereate a Kubernetes DaemonSet and Secret configuration for deploying the Lacework Datacollector Agent with custom Kubernetes Tolerations.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  tolerations = [
    {
      key      = "test-key",
      operator = "Equal",
      value    = "test-value",
      effect   = "NoSchedule"
    },
    {
      key      = "spotInstance",
      operator = "Exists",
      effect   = "NoSchedule"
    }
  ]
}
```
