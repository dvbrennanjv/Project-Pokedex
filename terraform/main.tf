resource "azurerm_resource_group" "rg_pokedex" {
  name     = var.resource_group_name
  location = "westus2"
}

resource "azurerm_storage_account" "tf_backend" {
  name = var.terraform_backend_name
  resource_group_name = azurerm_resource_group.rg_pokedex.name
  location = "westus2"
  account_replication_type = "LRS"
  account_tier = "Standard"
}

resource "azurerm_storage_container" "state_container" {
  name = "tfstate"
  storage_account_id = azurerm_storage_account.tf_backend.id
  container_access_type = "private"
}

resource "azurerm_cognitive_account" "foundry_hub" {
  name = "cog-foundry-hub-${var.project_name}"
  location = azurerm_resource_group.rg_pokedex.location
  resource_group_name = azurerm_resource_group.rg_pokedex.name

  kind = "AIServices"
  sku_name = "S0"

  custom_subdomain_name = var.custom_subdomain_name

  project_management_enabled = true

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_cognitive_account_project" "pokedex_project" {
  name                 = "pokedex-ai-project"
  cognitive_account_id = azurerm_cognitive_account.foundry_hub.id
  location             = azurerm_resource_group.rg_pokedex.location

  identity {
    type = "SystemAssigned"
  }

  description = "Project for scanning and pricing Pokemon TCG cards"
}