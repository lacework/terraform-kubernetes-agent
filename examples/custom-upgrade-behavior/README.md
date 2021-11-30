# Kubernetes Deployment w/ Autoupgrade Disabled

This example shows how to disable the autoupgrade functionality of the Lacework Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token      = "0123456789ABCDEF0123456789ABCDEF"
  lacework_agent_autoupgrade = false
}
```
