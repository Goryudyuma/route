resource "google_cloudfunctions_function" "AddUserAction" {
  available_memory_mb = "256"
  entry_point         = "AddUser-${var.branch}"

  event_trigger {
    event_type = "providers/firebase.auth/eventTypes/user.create"

    failure_policy {
      retry = "false"
    }

    resource = "projects/route-063-jp"
  }

  source_repository {
    url = "https://source.developers.google.com/projects/route-063-jp/repos/github_goryudyuma_route/moveable-aliases/${var.branch}/paths/functions"
  }

  ingress_settings = "ALLOW_ALL"

  labels = {
    deployment-tool = "cli-gcloud"
  }

  max_instances         = "0"
  name                  = "AddUserAction-${var.branch}"
  project               = "route-063-jp"
  region                = "us-central1"
  runtime               = "go113"
  service_account_email = "route-063-jp@appspot.gserviceaccount.com"
  timeout               = "60"
}
