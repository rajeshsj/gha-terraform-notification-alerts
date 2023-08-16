module "alert" {
  source                         = "../"
  project                        = "test-project-dec19"
  policies                       = yamldecode(file("alerts.yaml"))
  fallback_notification_channels = ["fallback-channel", "projects/test-project-dec19/notificationChannels/3724167854890262815"]
  notification_channel_ids = {
    "fallback-channel" : "projects/test-project-dec19/notificationChannels/3724167854890262815",
    notification_channel : "projects/test-project-dec19/notificationChannels/3724167854890262815"
  }

  default_user_labels = {
    cc = "all-alerts-will-have-this-label"
  }
}


