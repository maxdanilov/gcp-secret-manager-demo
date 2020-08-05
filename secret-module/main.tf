resource "google_secret_manager_secret" "secret" {
  for_each  = var.secret_names
  project   = var.project
  secret_id = format("%s-%s-%s", var.labels["application"], var.labels["environment"], each.value)

  labels = var.labels

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_iam_binding" "binding" {
  for_each  = var.secret_names
  project   = var.project
  secret_id = google_secret_manager_secret.secret[each.key].secret_id
  role      = "roles/secretmanager.secretAccessor"
  members   = var.access_members
}