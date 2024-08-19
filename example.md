terraform scan results:

Passed checks: 4, Failed checks: 4, Skipped checks: 0

Check: CKV_AZURE_33: "Ensure Storage logging is enabled for Queue service for read, write and delete requests"
	FAILED for resource: azurerm_storage_account.tfstate
	File: /main.tf:18-31
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/azure-policies/azure-logging-policies/enable-requests-on-storage-logging-for-queue-service

		18 | resource "azurerm_storage_account" "tfstate" {
		19 |   name                     = "tfstate${random_string.resource_code.result}"
		20 |   resource_group_name      = azurerm_resource_group.rg.name
		21 |   location                 = azurerm_resource_group.rg.location
		22 |   account_tier             = "Standard"
		23 |   account_replication_type = "LRS"
		24 |   public_network_access_enabled = true
		25 |   min_tls_version = "TLS1_2"
		26 |   allow_nested_items_to_be_public = false
		27 | 
		28 |   tags = {
		29 |     environment = "staging"  
		30 |   }
		31 | }

Check: CKV_AZURE_59: "Ensure that Storage accounts disallow public access"
	FAILED for resource: azurerm_storage_account.tfstate
	File: /main.tf:18-31
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/azure-policies/azure-networking-policies/ensure-that-storage-accounts-disallow-public-access

		18 | resource "azurerm_storage_account" "tfstate" {
		19 |   name                     = "tfstate${random_string.resource_code.result}"
		20 |   resource_group_name      = azurerm_resource_group.rg.name
		21 |   location                 = azurerm_resource_group.rg.location
		22 |   account_tier             = "Standard"
		23 |   account_replication_type = "LRS"
		24 |   public_network_access_enabled = true
		25 |   min_tls_version = "TLS1_2"
		26 |   allow_nested_items_to_be_public = false
		27 | 
		28 |   tags = {
		29 |     environment = "staging"  
		30 |   }
		31 | }

Check: CKV_AZURE_206: "Ensure that Storage Accounts use replication"
	FAILED for resource: azurerm_storage_account.tfstate
	File: /main.tf:18-31
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/azure-policies/azure-general-policies/azr-general-206

		18 | resource "azurerm_storage_account" "tfstate" {
		19 |   name                     = "tfstate${random_string.resource_code.result}"
		20 |   resource_group_name      = azurerm_resource_group.rg.name
		21 |   location                 = azurerm_resource_group.rg.location
		22 |   account_tier             = "Standard"
		23 |   account_replication_type = "LRS"
		24 |   public_network_access_enabled = true
		25 |   min_tls_version = "TLS1_2"
		26 |   allow_nested_items_to_be_public = false
		27 | 
		28 |   tags = {
		29 |     environment = "staging"  
		30 |   }
		31 | }

Check: CKV_AZURE_34: "Ensure that 'Public access level' is set to Private for blob containers"
	FAILED for resource: azurerm_storage_container.tfstate
	File: /main.tf:33-37
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/azure-policies/azure-networking-policies/set-public-access-level-to-private-for-blob-containers

		33 | resource "azurerm_storage_container" "tfstate" {
		34 |   name                  = "tfstate"
		35 |   storage_account_name  = azurerm_storage_account.tfstate.name
		36 |   container_access_type = "blob"
		37 | }

