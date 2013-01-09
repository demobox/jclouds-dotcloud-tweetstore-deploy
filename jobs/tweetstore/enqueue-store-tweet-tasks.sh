#!/bin/sh
curl -w "|%{url_effective} %{http_code} %{http_connect} %{time_total}" -H "X-Dotcloud-Cron: true" http://$HOSTNAME:$PORT_HTTP/stores/do | grep -Po '\|.*'