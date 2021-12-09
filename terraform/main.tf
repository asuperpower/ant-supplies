terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.85.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "random" {}

resource "random_string" "longid" {
  length  = 10
  upper   = false
  lower   = true
  number  = true
  special = false
}

locals {
  pname = "${var.project_name}blob${random_string.longid.result}"
  tags = {
    Environment = var.environment
  }
}

# Some of this is from:
# https://adrianhall.github.io/javascript/react/azure/2020/04/04/deploy-to-azure/

resource "azurerm_resource_group" "rg" {
  name     = var.project_name
  location = var.region
  tags     = local.tags
}

resource "azurerm_storage_account" "storage" {
  name                = substr(local.pname, 0, min(length(local.pname), 15))
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = local.tags

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  custom_domain {
    name = "ant.supplies"
  }

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_cdn_profile" "profile" {
  name                = "${var.project_name}profile"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                = "${var.project_name}endpoint"
  profile_name        = azurerm_cdn_profile.profile.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  origin {
    name      = "host"
    host_name = azurerm_storage_account.storage.primary_web_host
  }
}

resource "azurerm_cdn_endpoint_custom_domain" "domain" {
  name            = "ant-supplies-custom-domain"
  cdn_endpoint_id = azurerm_cdn_endpoint.endpoint.id
  host_name       = "ant.supplies"
}
