module "alert" {
  source                         = "../"
  project                        = "test-project-dec19"
  policies                       = yamldecode(file("alerts.yaml"))
  fallback_notification_channels = ["fallback-channel", "projects/gcp-abs-svav-dev-prj-01/notificationChannels/17965452668816064174"]
  notification_channel_ids = {
    "fallback-channel" : "projects/gcp-abs-svav-dev-prj-01/notificationChannels/17965452668816064174",
    notification_channel : "projects/gcp-abs-svav-dev-prj-01/notificationChannels/17965452668816064174"
  }

  default_user_labels = {
    cc = "all-alerts-will-have-this-label"
  }
}


