
# gha-terraform-alerts

## Inputs

| Name                           | Description                                                                                                                                                                                                                   | Type        | Default | Required |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ------- | :------: |
| __project__                    | Project ID to create alerts in                                                                                                                                                                                                | `string`    | n/a     |   yes    |
| default_user_labels            | Labels to be set for __all__ alerts                                                                                                                                                                                           | `map(any)`  | n/a     |    no    |
| fallback_notification_channels | NCs to be set for all alerts that don't provide `notification_channels`. Provide the NCs "id" or "display name" (the latter is dependant on the notification_channel_ids variable) [Alerts](./alerts/main.tf#L5) | `list(any)` | n/a     |    no    |
| notification_channel_ids       | To be able to provide channels display name instead of id/name, provide a  be { display_name: name } or output from tf-module-gcp-notification-channels.                                                                      | `list(any)` | n/a     |   yes    |
| __policies__                   | The list of alert policies configurations (More info below..)                                                                                                                                                                 | `list(any)` | n/a     |   yes    |


## Outputs

| Name      | Description          |
| --------- | -------------------- |
| alert_ids | The id of the alerts |
