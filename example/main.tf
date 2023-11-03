module "autonomous_databases" {
  source    = "https://github.com/datacentrics01/dcx-terraform-oci-adb.git"
  instances = {
    "adb_instance_1" = {
      compartment_id        = var.compartment_id,
      cpu_core_count        = 2,
      data_storage_size_in_tbs = 1,
      db_name                = "myadb1",
      db_version             = "19c",
      display_name           = "MyAutonomousDB1",
      license_model         = "LICENSE_INCLUDED",
      db_workload           = "OLTP",
      is_free_tier          = false,
      state                  = "STOPPED"
    },
    "adb_instance_2" = {
      compartment_id        = var.compartment_id,
      cpu_core_count        = 2,
      data_storage_size_in_tbs = 1,
      db_name                = "myadb2",
      db_version             = "19c",
      display_name           = "MyAutonomousDB2",
      license_model          = "LICENSE_INCLUDED",
      db_workload            = "OLTP",
      is_free_tier           = false,
      state                  = "STOPPED"
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
