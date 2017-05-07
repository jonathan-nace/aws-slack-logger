#!/bin/bash

APPNAME="SlackLoggerApp";
DEPLOYMENT_GROUP="SlackLoggerDeploymentGroup";
DATE=$(date '+%Y-%m-%d');
TIME=$(date '+%s');
PACKAGE=$(echo "${APPNAME}-${DATE}-${TIME}.tar.gz");

mkdir -p ../builds/
tar -czvf ../builds/$PACKAGE .
aws s3 cp ../builds/$PACKAGE s3://slack-logger/builds/

aws deploy create-deployment \
	--application-name=$APPNAME \
	--deployment-group-name=$DEPLOYMENT_GROUP \
	--ignore-application-stop-failures \
	--s3-location bundleType=tgz,bucket=slack-logger,key=builds/$PACKAGE \
	--description "$PACKAGE"
