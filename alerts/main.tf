module "alert" {
  source                         = "../"
  project                        = "test-project-dec19"
  policies                       = yamldecode(file("alerts.yaml"))
notification_channels = ["notification-channels", "projects/test-project-dec19/notificationChannels/2897121121673085037]"]
 #fallback_notification_channels = ["fallback-channel", "projects/test-project-dec19/notificationChannels/2897121121673085037]"]
  #notification_channel_ids = {
    #"fallback-channel" : "projects/test-project-dec19/notificationChannels/2897121121673085037"
    #notification_channel : "projects/test-project-dec19/notificationChannels/2897121121673085037"
  #}

  default_user_labels = {
    cc = "all-alerts-will-have-this-label"
  }
}


