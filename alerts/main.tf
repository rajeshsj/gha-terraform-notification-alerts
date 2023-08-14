module "alert" {
  source                         = "../"
  project                        = "test-project-dec19"
  policies                       = yamldecode(file("alerts.yaml"))
  fallback_notification_channels = ["fallback-channel", "projects/test-project-dec19/notificationChannels/12982702452353556899]"]
  notification_channel_ids = {
    "fallback-channel" : "projects/test-project-dec19/notificationChannels/12982702452353556899",
    notification_channel : "projects/test-project-dec19/notificationChannels/12982702452353556899"
  }

  default_user_labels = {
    cc = "all-alerts-will-have-this-label"
  }
}


