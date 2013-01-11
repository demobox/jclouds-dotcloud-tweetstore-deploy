#!/bin/sh
JOB_LOG_FILE=~/current/jobs/enqueue-store-tweet-tasks.log
if [ -e $JOB_LOG_FILE ] && [ `grep -c . $JOB_LOG_FILE` -gt 100 ]; then
  rm $JOB_LOG_FILE
fi
curl -w "|%{url_effective} %{http_code} %{http_connect} %{time_total}" -H "X-Dotcloud-Cron: true" http://$DOTCLOUD_WWW_HTTP_HOST:$WWW_HTTP_PORT/stores/do | grep -Po '\|.*' >> $JOB_LOG_FILE