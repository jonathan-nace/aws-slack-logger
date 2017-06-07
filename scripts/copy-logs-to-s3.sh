#!/bin/bash

source /opt/slack-logger/scripts/insert_configs

if [ -z $LOG_DIR ];
	LOG_DIR="/var/log/slack/"
fi

/usr/bin/aws s3 cp --recursive $LOG_DIR s3://$S3_BUCKET/logs/
