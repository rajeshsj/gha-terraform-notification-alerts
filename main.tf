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

resource "google_monitoring_notification_channel" "sms" {
  for_each     = { for nc in try(var.notification_channels.sms, {}) : nc.number => nc }
  type         = "sms"
  project      = var.project
  display_name = try(each.value.display_name, each.value.number)
  enabled      = try(each.value.enabled, true)
  description  = try(each.value.description, null)
  force_delete = try(each.value.force_delete, false)
  user_labels  = merge(
    var.default_user_labels,
    try(each.value.user_labels, {}),
    try(each.value.fallback_channel, false) ? { "fallback_channel": true } : {}
  )

  labels = {
    number = each.value.number
  }
}


resource "google_monitoring_notification_channel" "webhook_tokenauth" {
  for_each = {
    for nc in try(var.notification_channels.webhook, {}) : nc.url => nc
    if lookup(nc, "password", null) == null
  }
  type         = "webhook_tokenauth"
  project      = var.project
  display_name = each.value.display_name
  enabled      = try(each.value.enabled, true)
  description  = try(each.value.description, null)
  force_delete = try(each.value.force_delete, false)
  user_labels  = merge(
    var.default_user_labels,
    try(each.value.user_labels, {}),
    try(each.value.fallback_channel, false) ? { "fallback_channel": true } : {}
  )

  labels = {
    url = each.value.url
  }
}

resource "google_monitoring_notification_channel" "webhook_basicauth" {
  for_each = {
    for nc in try(var.notification_channels.webhook, {}) : nc.url => nc
    if lookup(nc, "password", null) != null
  }
  type         = "webhook_basicauth"
  project      = var.project
  display_name = each.value.display_name
  enabled      = try(each.value.enabled, true)
  description  = try(each.value.description, null)
  force_delete = try(each.value.force_delete, false)
  user_labels  = merge(
    var.default_user_labels,
    try(each.value.user_labels, {}),
    try(each.value.fallback_channel, false) ? { "fallback_channel": true } : {}
  )

  labels = {
    url      = each.value.url
    username = each.value.username
  }

  sensitive_labels {
    password = each.value.password
  }
}
