resource "azurerm_resource_group" "rg-sql" {
  name     = var.rg_name
  location = var.rg_location
}
