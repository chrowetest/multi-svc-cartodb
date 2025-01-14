#!/bin/bash

VARNISH_SECRET=${VARNISH_SECRET:-abc123def}

mkdir -p /etc/varnish
echo "$VARNISH_SECRET" > /etc/varnish/secret
echo "Starting varnish daemon..."
/opt/varnish/sbin/varnishd -a :6081 -T :6082 -s malloc,256m -f /etc/varnish.vcl -S /etc/varnish/secret
echo "Tailing /dev/null to keep the Docker image from closing."
tail -f /dev/null
