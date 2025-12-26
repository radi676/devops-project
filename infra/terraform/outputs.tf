output "artifact_repository" {
  value = google_artifact_registry_repository.repo.repository_id
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}
