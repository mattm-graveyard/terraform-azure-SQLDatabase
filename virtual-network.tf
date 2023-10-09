resource "azurerm_virtual_network" "vnet" {
  name = var.virtual_network_name
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [ "10.0.2.0/24" ]
  service_endpoints = [ "Microsoft.Sql" ]
  private_endpoint_network_policies_enabled = true
}

resource "azurerm_public_ip" "mypublicip" {
  name = var.public_ip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  allocation_method = "Static"
  domain_name_label = "app-1-${random_string.myrandom.id}"
}

resource "azurerm_network_interface" "myvmnic" {
  name = var.network_interface_name
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}