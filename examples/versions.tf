terraform {
  required_version = ">= 0.12.0"

  required_providers {
    kubernetes = "~> 1.13.3"
    random     = ">= 2.1"
  }
}
