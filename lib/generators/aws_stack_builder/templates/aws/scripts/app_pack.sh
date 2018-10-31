#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR/../..

mkdir -p dist
RAILS_ENV=$1
APP_NAME=taxrules

# get current branch
BRANCH=`git branch | grep "*" | awk '{print $2}'`

# if RAILS_ENV was not set on the call, define it based on the current branch
if [ -z "$RAILS_ENV" ]; then
  if [ $BRANCH = 'master' ]; then
    RAILS_ENV="production"
  else
    RAILS_ENV="staging"
  fi
fi

# define the filename
if [ $RAILS_ENV = 'staging' ]; then
    FILENAME=source-hml.zip
else
    FILENAME=source.zip
fi

echo Packing branch $BRANCH to $FILENAME
git archive -o dist/$FILENAME $BRANCH
git show $BRANCH:aws/scripts/app_update.sh > dist/app_update.sh

s3cmd sync dist/app_update.sh s3://taxweb-deploy/$APP_NAME/app_update.sh
s3cmd sync dist/$FILENAME s3://taxweb-deploy/$APP_NAME/$FILENAME
s3cmd setacl s3://taxweb-deploy/$APP_NAME/$FILENAME --acl-public
s3cmd setacl s3://taxweb-deploy/$APP_NAME/app_update.sh --acl-public
