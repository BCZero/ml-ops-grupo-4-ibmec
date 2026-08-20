terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "rg-pcdf-demo"
}

resource "azurerm_storage_account" "st" {
  name                     = "sttipcrimeg4mlops"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    disciplina = "mlops-ci-cd"
    entrega    = "entrega-3"
    grupo      = "grupo-4"
    projeto    = "tipificacao-procedimentos"
  }
}

resource "azurerm_storage_container" "raw" {
  name                  = "ocorrencias-raw"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.st.name
}

output "container_name" {
  value = azurerm_storage_container.raw.name
}
