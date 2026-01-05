# DevOps Project Demo

###### Modern Devops Practices @ FMI, Sofia University - Assigment Project

The purpose of this project is to make a complete automated software delivery process for a simple node.js app

There are two workflows:

- CI pipeline [![ci](https://github.com/radi676/devops-project/actions/workflows/ci.yml/badge.svg)](https://github.com/radi676/devops-project/actions/workflows/ci.yml)
- CD pipeline [![cd](https://github.com/radi676/devops-project/actions/workflows/cd.yml/badge.svg)](https://github.com/radi676/devops-project/actions/workflows/cd.yml)

### Continuous Integration Workflow

- Executed (mandatory) on Pull Requests to the `main` branch
- Executed on demand for any branch
- Checks for code style, executes various scans and verifies semantic version
- The workflow executes all checks and does not stop on error
- The workflow uses a single secret for the Snyk scan (SNYK_TOKEN) that is global for the repository's actions
- Covers:
  - ESLint: Code style
  - Truffflehog: Secrets detection
  - Snyk: SCA - for npm packages
  - Trivy: SCA - for docker image (reusable workflow)
  - Sonar: SAST, Code Quality (not part of the workflow, executes automatically)
  - Tests: jest unit tests
  - Version Check: semantic version bump

### Continuous Delivery Workflow

- Executed on push to the `main` branch (when there are changes in the /src directory or the Dockerfile, packages.json or the deployment pipeline definition)
- Executed on demand for the `main` branch
- Builds a semantically versioned image of the application and upload it to Google Artifact Registry. Then deploys the new version of the app to Google Kubernetes Engine cluster.
- Steps:
  - Check if should build image
  - \[Conditional\] Build image and push it to registry (if no image with current semantic version)
  - \[Conditional\] Trivy scan of the image (if new image is built)
  - \[Conditional\] Tag image with semantic version (if scan is successful)
  - \[Conditional\] Deploy to Kubernetes (if image with the semantic version is present)
- The workflow authenticates to GCP using Workflow Identity Federation using GitHub's OIDC identity provider. The federation provider authenticates only the selected repository and owner. The issued access token is impersonated for a service account that has permission to manage artifact registry repositories and kubernetes clusters. (following the documentation from [google-github-actions/auth](https://github.com/google-github-actions/auth?tab=readme-ov-file#preferred-direct-workload-identity-federation) )
- The workflow expects the resources in GCP (GAR and GKE) to be provisioned in the project beforehand. The settings for the GCP are stored as environment variables in the `main` environment into which the workflow is executed.
- The yml file that is used for the deployment with the kubernetes cli is stored in `infra/k8s/deployment.yml`

### Infrastructure as Code

- The Google Artifact Registry repository and the Google Kubernetes Engine cluster are craeted via terraform scripts
- The `gcloud` and `terraform` CLI tools are required to use the IaC scripts
- The GCP project is expected to be created beforehand (can be created with `gcloud` or in the Google Cloud Console).
- The user should authenticate with `gcloud` for the desired project (make sure `gcloud auth application-default login`)
- In order to provision the resources:
  - Go to `infra/terraform` and run `terrafrom init`
  - Create `terraform.tfvars` file with the desired values by using `terraform.tfvars.example` as an example - only the project id is mandatory as other variables have default values
  - Execute `terraform plan -out plan-tf` to create the plan and `terraform apply plan-tf` to provision the resource in GCP
