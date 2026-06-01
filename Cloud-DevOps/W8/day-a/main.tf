terraform {
  required_version = ">= 1.0"
}

locals {
  project_name = "terraform-lab"
}

output "project_name" {
  value = local.project_name
}