module "secrets_app1_production" {
  source             = "./secret-module"
  project            = "infra-kaas-test"
  secret_names       = ["secret-123", "secret-456"]
  access_members     = ["serviceAccount:test-gsa@infra-kaas-test.iam.gserviceaccount.com"]

  labels = {
    application = "app1"
    environment = "production"
  }
}

module "secrets_app1_stage" {
  source             = "./secret-module"
  project            = "infra-kaas-test"
  secret_names       = ["secret-123", "secret-456"]
  access_members     = ["serviceAccount:test-gsa2@infra-kaas-test.iam.gserviceaccount.com"]

  labels = {
    application = "app1"
    environment = "stage"
  }
}