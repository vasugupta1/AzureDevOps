resource "azurerm_storage_account" "azure_function_storage_account" {
    name = "${var.function_app_name}sa"
    resource_group_name = azurerm_resource_group.az-204.name
    location = azurerm_resource_group.az-204.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_service_plan" "azure_function_service_plan" {
    name = "${var.function_app_name}sp"
    resource_group_name = azurerm_resource_group.az-204.name
    location = azurerm_resource_group.az-204.location
    os_type = "Linux"
    sku_name = "B1"
}

resource "azurerm_linux_function_app" "azure_linux_function" {
    name = "${var.function_app_name}${random_string.suffix.result}"
    resource_group_name = azurerm_resource_group.az-204.name
    location = azurerm_resource_group.az-204.location
    site_config {
    }
    service_plan_id = azurerm_service_plan.azure_function_service_plan.id
    storage_account_name = azurerm_storage_account.azure_function_storage_account.name
    storage_account_access_key = azurerm_storage_account.azure_function_storage_account.primary_access_key
}
