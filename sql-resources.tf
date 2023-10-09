resource "azurerm_mssql_server" "mymssqlserver" {
  name = "${var.sql_server_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  version = "12.0"
  administrator_login = var.admin_login                     #Change to Vault 
  administrator_login_password = var.login_password          #Change to Vault
  minimum_tls_version = "1.2"
  #public_network_access_enabled = false
}

resource "azurerm_mssql_database" "mysqldatabase" {
  count = var.databases
  name = "${var.sql_database_name}${count.index}"
  server_id = azurerm_mssql_server.mymssqlserver.id
  license_type = "LicenseIncluded"
  max_size_gb = 2
  sku_name = "S0"
}

resource "azurerm_mssql_virtual_network_rule" "mymssqlrule" {
  name      = var.sql_virtual_network_rule_name
  server_id = azurerm_mssql_server.mymssqlserver.id
  subnet_id = azurerm_subnet.mysubnet.id
}
