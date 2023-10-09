terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.75.0"
    }
  }
}

provider "azurerm" {
    features { }
}

resource "random_string" "myrandom" {
  length = 6
  upper = false
  numeric = false
  special = false
}