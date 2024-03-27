terraform {
  backend "gcs" {
    bucket  = local.backend_bucket_name
    prefix  = "terraform/state"
  }
}
