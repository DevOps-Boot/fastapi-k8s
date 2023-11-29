output "cert_manager_id" {
  description = "Cert manager ID, used to create dependency."
  value       = helm_release.cert_manager.id
}
