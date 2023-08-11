variable "project" {
  type        = string
  description = "Project ID to create the notification channels in"
}

variable "notification_channels" {
  type        = any
  description = "List of the actual notification channel configs"
}

variable "default_user_labels" {
  type        = map(any)
  description = "User labels to be set for all alerts"
  default     = {}
}

