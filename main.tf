resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}



resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "random_string" "resource_code2" {
  length  = 5
  special = false
  upper   = false
}

resource "random_string" "resource_code3" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstate${random_string.resource_code.result}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"

  tags = {
    environment = "staging"
  }

}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}




resource "azurerm_log_analytics_storage_insights" "analytics_storage_insights_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.analytics_workspace_ok.id

  storage_account_id   = azurerm_storage_account.tfstate.id
  storage_account_key  = azurerm_storage_account.tfstate.primary_access_key
  blob_container_names = ["tfstate"]
}







resource "azurerm_storage_account" "new_storage_emc" {
  name                            = "newstorage{random_string.resource_code.result}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"

  tags = {
    environment = "testing"
  }
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  sas_policy {
    expiration_period = "90.00:00:00"
    expiration_action = "Log"
  }

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

}


resource "azurerm_private_endpoint" "example2" {
  name                = "example_private_endpoint2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "example_psc2"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.new_storage_emc.id
    subresource_names              = ["blob"]
  }
}