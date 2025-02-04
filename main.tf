module "rg_module" {
  source = "./resource_group"
  rg_name = var.rg_name
  rg_location = var.rg_location
}

module "sql" {
  source = "./sql"
  rg_name = module.rg_module.rg_name
  rg_location = var.rg_location
  sql_server_name = var.sql_server_name
  sql_server_version = var.sql_server_version 
  login_mssql-server = var.login_mssql-server
  password_mssql-server = var.password_mssql-server
  mssql_elastic_name = var.mssql_elastic_name
  sku_elastic = var.sku_elastic
  tier_elastic = var.tier_elastic
  sql_database_name1 = var.sql_database_name1
  sql_database_name2 = var.sql_database_name2
}