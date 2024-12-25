variable "mssql_server_variables" {

  type = map(object({
    mssql_server_name                     = string
    mssql_server_resource_group_name      = string
    mssql_server_location                 = string
    mssql_server_version                  = string
    mssql_server_transparent_data_encryption_key_vault_key_id = string
    mssql_server_connection_policy        = string
    mssql_server_minimum_tls_version      = string
    mssql_server_public_network_access_enabled        = bool
    mssql_server_outbound_network_restriction_enabled = bool

    administrator_login=string
  administrator_login_password=string

   user_principal_name=string
    azuread_administrator = object({
      mssql_server_azuread_administrator_login_username = string
      mssql_server_tenant_id                            = string

      mssql_server_azuread_authentication_only          = bool
    })
  }))
}
