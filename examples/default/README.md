# Default Kubernetes Deployment

This example shows how to use the Terraform Provider for Lacework to create
a new Lacework Agent Token and use it to generate a Kubernetes DaemonSet and
Secret configuration for deploying the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

provider "lacework" {}

resource "lacework_agent_access_token" "k8s" {
  name        = "prod"
  description = "k8s deployment for production env"
}

module "lacework_k8s_datacollector" {
  source  = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token = lacework_agent_access_token.k8s.token
}
```
