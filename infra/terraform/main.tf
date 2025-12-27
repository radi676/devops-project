terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_artifact_registry_repository" "repo" {
  provider      = google
  location      = var.region
  repository_id = var.artifact_repo_id
  description   = "Container registry for devops-project"
  format        = "DOCKER"
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count = 1

  node_config {
    machine_type = var.machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  remove_default_node_pool = false
}

resource "google_artifact_registry_repository_iam_member" "all_users_reader" {
  provider   = google
  project    = var.project
  location   = google_artifact_registry_repository.repo.location
  repository = google_artifact_registry_repository.repo.repository_id
  role       = "roles/artifactregistry.reader"
  member     = "allUsers"
}