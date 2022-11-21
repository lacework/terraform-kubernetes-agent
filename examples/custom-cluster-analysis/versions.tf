terraform {
  required_version = ">= 0.12.31"

  required_providers {
    kubernetes = "~> 2.2"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.0"
    }
  }
}
