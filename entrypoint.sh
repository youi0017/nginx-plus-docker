#!/bin/sh

if [ "${1}" = "start" ]; then
  /usr/sbin/nginx -g 'daemon off;'
else
  # sh -c "${*}"
  /usr/sbin/nginx "${*}"
fi;
