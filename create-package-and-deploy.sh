#!/bin/bash

APPNAME="SlackLoggerApp";
DEPLOYMENT_GROUP="SlackLoggerDeploymentGroup";
DATE=$(date '+%Y-%m-%d');
TIME=$(date '+%s');
PACKAGE=$(echo "${APPNAME}-${DATE}-${TIME}.tar.gz");

source ./scripts/insert_configs

mkdir -p ../builds/
tar -czvf ../builds/$PACKAGE . --exclude '.git/*'
aws s3 cp ../builds/$PACKAGE s3://$S3_BUCKET/builds/

aws deploy create-deployment \
	--application-name=$APPNAME \
	--deployment-group-name=$DEPLOYMENT_GROUP \
	--ignore-application-stop-failures \
	--s3-location bundleType=tgz,bucket=$S3_BUCKET,key=builds/$PACKAGE \
	--description "$PACKAGE"
