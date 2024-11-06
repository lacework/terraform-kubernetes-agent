terraform {
  required_version = ">= 0.15"

  required_providers {
    kubernetes = "~> 2.2"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 2.0"
    }
  }
}
