# Kubernetes Deployment w/ Custom Agent Configuration

This example shows how to customize the agent configuration file (`config.json`) of the Lacework
Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 2.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_agent_configuration = {
    "privileges" : {
      "capsmode" : "enabled"
    }
  }
}
```
