resource "random_string" "autonomous_database_admin_password" {
  for_each    = var.instances
  
  length      = 16
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  special     = "!@#$%^&*()_+[]{}<>:-"
}

resource "oci_database_autonomous_database" "adb" {
  for_each = var.instances

  compartment_id           = each.value.compartment_id
  cpu_core_count           = each.value.cpu_core_count
  data_storage_size_in_tbs = each.value.data_storage_size_in_tbs
  db_name                  = each.value.db_name
  db_version               = each.value.db_version
  admin_password           = random_string.autonomous_database_admin_password[each.key].result
  display_name             = each.value.display_name
  license_model            = each.value.license_model
  db_workload              = each.value.db_workload
  is_free_tier             = each.value.is_free_tier
  state                    = each.value.state
}
