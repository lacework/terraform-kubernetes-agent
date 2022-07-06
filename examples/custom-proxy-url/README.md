# Kubernetes Deployment w/ Custom Proxy URL

This example shows how to customize the Proxy URL configuration of the Lacework Datacollector Agent.

```hcl
provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "lacework/agent/kubernetes"
  version = "~> 2.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_proxy_url   = "https://proxy.address.here:8080"
}
```
