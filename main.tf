provider "azurerm" {
    features {
    }
    subscription_id = ""
}

resource "azurerm_resource_group" "az-204" {
    name = var.resouce_group_name
    location = var.location
}

module "azure_function_app" {
    source = "./modules/az_function"
    resouce_group_name = var.resouce_group_name
    location = var.location
    function_app_name = var.function_app_name
}