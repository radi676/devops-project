variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "europe-west3"
}

variable "zone" {
  type = string
  default = "europe-west3-a"
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
