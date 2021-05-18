# Default Kubernetes Deployment

This example will generate a Kubernetes DaemonSet and Secret configuration for deploying the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_server_url   = "https://api.lacework.net"
}
```
