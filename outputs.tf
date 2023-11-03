output "autonomous_database_ids" {
  description = "The OCIDs of the Autonomous Databases."
  value       = { for key, db in oci_database_autonomous_database.adb : key => db.id }
}

output "autonomous_database_passwords" {
  description = "The passwords of the Autonomous Databases."
  value       = { for key, pwd in random_string.autonomous_database_admin_password : key => pwd.result }
}
