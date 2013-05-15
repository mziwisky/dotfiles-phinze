export DEPLOY_BUNDLE_19=/opt/boxen/rbenv/versions/1.9.3-p327/bin/bundle
export DEPLOY_BUNDLE_18=/opt/boxen/rbenv/versions/ree-1.8.7-2012.02/bin/bundle

export CATURDAY_SERVICE_USER="caturday"
export CATURDAY_SERVICE_PASSWORD="$(security find-generic-password -s 'caturday_service' -w)"
export CATURDAY_SERVICE_URL="$(security find-generic-password -s 'caturday_service' | grep acct | cut -d= -f2 | sed 's/"//g')"
