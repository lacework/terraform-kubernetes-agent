# Kubernetes Deployment w/ Custom Server URL

This example shows how to customize Server URL of the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 2.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_server_url   = "https://api.fra.lacework.net"
}
```
