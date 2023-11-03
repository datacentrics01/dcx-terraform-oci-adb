variable "instances" {
  description = "Map of instances configuration for Autonomous Database"
  type = map(object({
    compartment_id          = string
    cpu_core_count          = number
    data_storage_size_in_tbs = number
    db_name                 = string
    db_version              = string
    display_name            = string
    license_model           = string
    db_workload             = string
    is_free_tier            = bool
    state                   = string
  }))
  default = {}
}
