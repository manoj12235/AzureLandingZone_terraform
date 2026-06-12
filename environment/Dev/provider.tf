terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " 4.77.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "a7e26b15-69cf-45cd-bde3-82c1bc6a26fb"
  features {}
}