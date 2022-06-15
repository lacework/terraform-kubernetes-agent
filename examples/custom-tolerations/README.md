# Kubernetes Deployment w/ Custom Tolerations

This example shows how to customize tolerations of the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 2.0"

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
