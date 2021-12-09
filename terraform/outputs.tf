output "AZURE_STORAGE_CONNECTION_STRING" {
  value = azurerm_storage_account.storage.primary_connection_string
}

output "WEBSITE" {
  value = azurerm_storage_account.storage.primary_web_endpoint
}
