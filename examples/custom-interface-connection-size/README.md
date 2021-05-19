# Kubernetes Deployment w/ Custom Interface Connection Size

This example shows how to customize the interface connection size property of the Lacework
Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token                    = "0123456789ABCDEF0123456789ABCDEF"
  lacework_agent_interface_connection_size = "60000"
}
```
