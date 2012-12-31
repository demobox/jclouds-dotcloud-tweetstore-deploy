#!/bin/sh
curl -w "|%{url_effective} %{http_code} %{http_connect} %{time_total}" -H "X-Dotcloud-Cron: true" http://$DOTCLOUD_WWW_HTTP_URL/stores/do | grep -Po '\|.*'