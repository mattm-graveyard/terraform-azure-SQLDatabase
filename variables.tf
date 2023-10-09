variable "databases" {
  description = "Number of SQL Databases"
  type = number
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type = string
}

variable "resource_group_location" {
  description = "Location of Resource Group"
  type = string
}

variable "sql_server_name" {
  description = "Name of SQL Server"
  type = string
}

variable "admin_login" {
  description = "Login Username for SQL Server"
  type = string
}

variable "login_password" {
  description = "Password for SQL Server Login"
  type = string
}

variable "sql_database_name" {
  description = "Name of SQL Databases"
  type = string
}

variable "sql_virtual_network_rule_name" {
  description = "Name of Virtual Network Rule Resource"
  type = string
}

variable "virtual_network_name" {
  description = "Name of Virtual Network"
  type = string
}

variable "subnet_name" {
  description = "Name of Subnet"
  type = string
}

variable "public_ip_name" {
  description = "Name of PublicIP"
  type = string
}

variable "network_interface_name" {
  description = "Name of Network Interface"
  type = string
}