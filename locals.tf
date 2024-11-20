locals {
    existing_rg_name = data.azurerm_resource_group.main.name
    rg_location = data.azurerm_resource_group.main.location
}