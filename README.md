#gha-terraform-notification

## Inputs

| Name                          | Description                                                   | Type        | Default | Required |
| ----------------------------- | ------------------------------------------------------------- | ----------- | ------- | :------: |
| project                       | The project id to create the resources in                     | `string`    | n/a     | __yes__  |
| notification_channels         | List of the actual notification channel configs - (See below) | `list(map)` | n/a     | __yes__  |
| slack_token_secret_project_id | Optional: To provide token with gcp secret.                   | `string`    | n/a     |    no    |
| slack_token_secret_name       | Optional: To provide token with gcp secret.                   | `string`    | n/a     |    no    |


## Outputs

| Name                  | Description               |
| --------------------- | ------------------------- |
| notification_channels | Map of display_name => id |
| fallback_channels_ids | Ids of fallback_channels  |
