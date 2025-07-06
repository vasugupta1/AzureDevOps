provider "azurerm" {
    features {
        resource_group {
          prevent_deletion_if_contains_resources = false
        }
    }
    subscription_id = ""
}

# resource "azurerm_resource_group" "az-204" {
#     name = var.resouce_group_name
#     location = var.location
# }

# module "azure_vm"{
#     source = "./modules/az_vms"
#     resouce_group_name = var.resouce_group_name
#     location = var.location
#     vm_name = var.vm_name
# }

# module "azure_function_app" {
#     source = "./modules/az_function"
#     resouce_group_name = var.resouce_group_name
#     location = var.location
#     function_app_name = var.function_app_name
# }