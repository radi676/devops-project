variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "cluster_name" {
  type = string
  default = "devops-gke-cluster"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "artifact_repo_id" {
  type = string
  default = "devops-repo"
}

variable "tf_state_bucket" {
  type = string
  description = "GCS bucket name for Terraform remote state"
}
