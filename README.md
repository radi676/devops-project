# Devops Project Demo

- Create resources in GCP:
  - Make sure that you have created a project in Google Cloud Console or create now:
    - `gcloud projects create <-PROJECT->`
    - `gcloud services enable artifactregistry.googleapis.com container.googleapis.com --project <-PROJECT->`
  - Make sure that you installed `gcloud` and `terraform`
  - Authenticate with `gcloud`
  - Go to `infra/terraform` and run `terrafrom init`
  - Create `terraform.tfvars` file with the desired values by using `terraform.tfvars.example` as an example
