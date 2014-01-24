export CATURDAY_SERVICE_USER="caturday"
export CATURDAY_SERVICE_PASSWORD="$(security find-generic-password -s 'caturday_service' -w)"
export CATURDAY_SERVICE_URL="$(security find-generic-password -s 'caturday_service' | grep acct | cut -d= -f2 | sed 's/"//g')"
