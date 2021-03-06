provider "google" {
  project = "route-063-jp"
  region  = "asia-northeast1"
  version = "~> 3.34.0"
}

terraform {
  required_version = "0.13.0"
  backend "remote" {
    organization = "route-063-jp"

    workspaces {
      name = "route"
    }
  }
}

resource "null_resource" "terraform-github-actions" {
  triggers = {
    value = "This resource was created using GitHub Actions!"
  }
}

module "functions" {
  for_each = var.BRANCHES

  source = "./module"

  branch = each.key
}
