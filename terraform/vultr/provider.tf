terraform {
	backend "remote" {
    hostname = "app.terraform.io"
    organization = "haenu"

    workspaces {
      name = "haenu-cluster-vultr"
    }
  }

  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.15.1"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key = var.vultr_api_key
  rate_limit = 100
  retry_limit = 3
}

