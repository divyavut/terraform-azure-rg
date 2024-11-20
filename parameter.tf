resource "azurerm_app_configuration" "appconf" {
  name                = var.app_config_name
  resource_group_name = local.existing_rg_name
  location            = local.rg_location
}
data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "appconf_dataowner" {
  scope                = azurerm_app_configuration.appconf.id
  role_definition_name = "App Configuration Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}


resource "azurerm_app_configuration_key" "rg_id" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = "${var.project_name}/${var.environment}/rg_id"
  value                  = azurerm_resource_group.main.id
   depends_on = [azurerm_role_assignment.appconf_dataowner]
  }
