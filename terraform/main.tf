provider "google" {
  project = "route-063-jp"
  region  = "asia-northeast1"
  version = "~>v3.32.0"
}

terraform {
  required_version = "0.12.29"
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
  source = "./module"

  count  = length(var.branches)
  branch = element(var.branches, count.index)
}
