terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "existing-rg"  
    storage_account_name = "straccount100"                      
    container_name       = "rg-statefile"                     
    key                  = "dev.terraform.tfstate"
  }

}

provider "azurerm" {
  # Configuration options
   subscription_id = ""
    features {}
}