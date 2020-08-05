resource "google_secret_manager_secret" "secret-new" {
  project   = "infra-kaas-test"
  secret_id = "some-new-secret"

  labels = {
    project     = "foo"
    environment = "stage"
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret" "secret-basic" {
  project   = "infra-kaas-test"
  secret_id = "some-terra-secret"

  labels = {
    project     = "foo"
    environment = "stage"
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret" "secret-basic3" {
  project   = "infra-kaas-test"
  secret_id = "some-terra-secret3"

  labels = {
    project     = "foo"
    environment = "stage"
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_iam_binding" "binding" {
  project   = google_secret_manager_secret.secret-basic.project
  secret_id = google_secret_manager_secret.secret-basic.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:test-gsa@infra-kaas-test.iam.gserviceaccount.com",
    "serviceAccount:test-gsa2@infra-kaas-test.iam.gserviceaccount.com",
  ]
}

resource "google_secret_manager_secret_iam_binding" "binding3" {
  project   = google_secret_manager_secret.secret-basic3.project
  secret_id = google_secret_manager_secret.secret-basic3.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:test-gsa@infra-kaas-test.iam.gserviceaccount.com",
    "serviceAccount:test-gsa2@infra-kaas-test.iam.gserviceaccount.com",
  ]
}

resource "google_secret_manager_secret_iam_binding" "binding2" {
  project   = google_secret_manager_secret.secret-basic.project
  secret_id = "my-gsm-secret-name"
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:test-gsa@infra-kaas-test.iam.gserviceaccount.com",
    # "serviceAccount:test-gsa2@infra-kaas-test.iam.gserviceaccount.com",
  ]
}

// module "my-app-workload-identity" {
//   source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
//   name       = "my-application-name"
//   namespace  = "default"
//   project_id = "infra-kaas-test"
// }

// module "my-app-workload-identity-2" {
//   source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
//   name       = "my-application-name2"
//   namespace  = "default"
//   project_id = "infra-kaas-test"
// }
