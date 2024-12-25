mssql_server_variables = {
  server1 = {
    mssql_server_name                                  = "sarab-mssql-server1"
    mssql_server_resource_group_name                   = "sarab-rg"
    mssql_server_location                              = "Central India"
    mssql_server_version                               = "12.0"
    mssql_server_transparent_data_encryption_key_vault_key_id = null
    mssql_server_connection_policy                     = "Default"
    mssql_server_minimum_tls_version                   = "1.2"
    mssql_server_public_network_access_enabled         = true
    mssql_server_outbound_network_restriction_enabled  = false
   administrator_login_password="P@ssw0rd!Example123"
    administrator_login="sarabadmin"
    user_principal_name="sarabbhatia2000_outlook.com#EXT#@sarabbhatia2000outlook694.onmicrosoft.com"
    azuread_administrator = { 
      mssql_server_azuread_administrator_login_username = "sarabuser"
    mssql_server_tenant_id = null
    mssql_server_azuread_authentication_only = false 
    }
  
  }
}
