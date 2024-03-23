resource "google_artifact_registry_repository" "iba-gar" {
  location      = var.region
  repository_id = "iba-gar"
  description   = "Repository to store todo app docker image"
  format        = "DOCKER"
}