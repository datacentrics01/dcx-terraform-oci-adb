module "autonomous_databases" {
  source    = "./modules/autonomous_database"
  instances = {
    "adb_instance_1" = {
      compartment_id        = var.compartment_id,
      cpu_core_count        = 2,
      data_storage_size_in_tbs = 1,
      db_name                = "myadb1",
      display_name           = "MyAutonomousDB1",
      license_model         = "LICENSE_INCLUDED",
      db_workload           = "OLTP",
      is_free_tier          = false,
      subnet_id             = oci_core_subnet.my_subnet.id
    },
    "adb_instance_2" = {
      compartment_id        = var.compartment_id,
      cpu_core_count        = 2,
      data_storage_size_in_tbs = 1,
      db_name                = "myadb2",
      display_name           = "MyAutonomousDB2",
      license_model         = "LICENSE_INCLUDED",
      db_workload           = "OLTP",
      is_free_tier          = false,
      subnet_id             = oci_core_subnet.my_subnet.id
    }
    # Add more instances as needed
  }
}

output "adb_ids" {
  value = module.autonomous_databases.autonomous_database_ids
}

output "adb_passwords" {
  value = module.autonomous_databases.autonomous_database_passwords
}
