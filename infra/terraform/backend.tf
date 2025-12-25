terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "yourstorageacct"
    container_name       = "tfstate"
    key                  = "devops-project.tfstate"
  }
}
