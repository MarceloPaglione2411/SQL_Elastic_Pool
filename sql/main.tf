
resource "azurerm_mssql_server" "mssql-server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = var.sql_server_version
  administrator_login          = var.login_mssql-server
  administrator_login_password = var.password_mssql-server

  # Configurações de rede (acesso à rede habilitado/desabilitado)
  public_network_access_enabled = true
}

#Criar elastic Pool
resource "azurerm_mssql_elasticpool" "mssql-elastic" {
  name                = var.mssql_elastic_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  server_name         = azurerm_mssql_server.mssql-server.name
  license_type        = "LicenseIncluded"
  max_size_gb         = 50

  sku {
    name     = var.sku_elastic
    tier     = var.tier_elastic
    capacity = 50
  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 50
  }
}

# Cria um SQL Database
resource "azurerm_mssql_database" "mssql_db" {
  name                = var.sql_database_name1
  server_id    = azurerm_mssql_server.mssql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 10
  #sku_name     = "Basic"
  enclave_type = "VBS"
  

  # Configurações de backup (redundância local)
  storage_account_type = "Local"

  # Não faz parte de um Elastic Pool
  #elastic_pool_id = azurerm_mssql_elasticpool.mssql-elastic.id
}

# Cria um SQL Database2
resource "azurerm_mssql_database" "mssql_db2" {
  name                = var.sql_database_name2
  server_id    = azurerm_mssql_server.mssql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 10
  #sku_name     = "Basic"
  enclave_type = "VBS"
  

  # Configurações de backup (redundância local)
  storage_account_type = "Local"

  # Faz parte de um Elastic Pool
  #elastic_pool_id = azurerm_mssql_elasticpool.mssql-elastic.id
}

