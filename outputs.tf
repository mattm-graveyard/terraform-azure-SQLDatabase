output "sql_server_id" {
  value = azurerm_mssql_server.mymssqlserver.id
  sensitive = true
}

output "sql_database_id" {
  value = azurerm_mssql_database.mysqldatabase[*].id
  sensitive = true
}

output "virtual_network_id" {
    value = azurerm_virtual_network.vnet.id
    sensitive = true
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
  sensitive = true
}

output "subnet_id" {
  value = azurerm_subnet.mysubnet.id
  sensitive = true
}

