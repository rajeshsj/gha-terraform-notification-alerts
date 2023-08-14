resource "google_monitoring_notification_channel" "email" {
  for_each     = { for nc in try(var.notification_channels.email, {}) : nc.email_address => nc }
  type         = "email"
  project      = var.project
  display_name = try(each.value.display_name, each.value.email_address)
  enabled      = try(each.value.enabled, true)
  description  = try(each.value.description, null)
  force_delete = try(each.value.force_delete, false)
  user_labels  = merge(
    var.default_user_labels,
    try(each.value.user_labels, {}),
    try(each.value.fallback_channel, false) ? { "fallback_channel": true } : {}
  )

  labels = {
    email_address = each.value.email_address
  }
}

