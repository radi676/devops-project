terraform {
  backend "gcs" {
    # Replace the bucket below with your GCS bucket for Terraform state.
    # You can create one manually, e.g.:
    # gsutil mb -l YOUR_REGION gs://my-terraform-state-bucket
    bucket = "your-terraform-state-bucket"
    prefix = "devops-project/terraform/state"
  }
}
