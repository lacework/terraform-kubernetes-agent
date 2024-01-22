terraform {
  required_version = ">= 0.14"

  required_providers {
    kubernetes = ">= 2.0.0"
    
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
