output "artifact_repository" {
  value = google_artifact_registry_repository.repo.repository_id
}

output "artifact_repository_location" {
  value = google_artifact_registry_repository.repo.location
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.zone
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}
