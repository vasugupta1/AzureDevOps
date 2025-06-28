provider "azurerm" {
    features {
    }
    subscription_id = ""
}

resource "azurerm_resource_group" "az-204" {
    name = var.resouce_group_name
    location = var.location
}