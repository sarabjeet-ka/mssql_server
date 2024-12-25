
data "azurerm_client_config" "example" {}

data "azuread_user" "example" { 
  for_each = var.mssql_server_variables
  user_principal_name = each.value.user_principal_name
  }

resource "azurerm_mssql_server" "mssql_server" {
  for_each = var.mssql_server_variables

  name                = each.value.mssql_server_name
  resource_group_name = each.value.mssql_server_resource_group_name
  location            = each.value.mssql_server_location
  version             = each.value.mssql_server_version

  administrator_login = each.value.azuread_administrator.mssql_server_azuread_authentication_only == true? null: each.value.administrator_login
  
  administrator_login_password = each.value.azuread_administrator.mssql_server_azuread_authentication_only == true? null: each.value.administrator_login_password
 

  transparent_data_encryption_key_vault_key_id = each.value.mssql_server_transparent_data_encryption_key_vault_key_id
  connection_policy                            = each.value.mssql_server_connection_policy
  minimum_tls_version                          = each.value.mssql_server_minimum_tls_version
  public_network_access_enabled                = each.value.mssql_server_public_network_access_enabled
  outbound_network_restriction_enabled         = each.value.mssql_server_outbound_network_restriction_enabled

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator != null ? [1] : []
    content {
     login_username              = each.value.azuread_administrator.mssql_server_azuread_administrator_login_username
      tenant_id                   = each.value.azuread_administrator.mssql_server_tenant_id
      object_id                   = data.azuread_user.example[each.key].object_id
      azuread_authentication_only = each.value.azuread_administrator.mssql_server_azuread_authentication_only
    }
  }
}
