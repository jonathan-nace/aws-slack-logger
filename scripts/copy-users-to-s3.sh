#!/bin/bash

source /opt/slack-logger/scripts/insert_configs

curl -skL "https://slack.com/api/users.list?token=$SLACK_API_KEY" | aws s3 cp - s3://$S3_BUCKET/users.json
