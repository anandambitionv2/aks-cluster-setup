terraform {
  backend "azurerm" {
    resource_group_name  = "test"
    storage_account_name = "stg112222"
    container_name       = "akstfstate"
    key                  = "akstfstate_1"
  }
}