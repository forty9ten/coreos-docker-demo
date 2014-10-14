#!/bin/bash

set -e

export HOST_IP=${HOST_IP:-127.0.0.1}
export ETCD=$HOST_IP:4001

until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/demo-haproxy.toml > /var/log/confd.log 2>&1; do
  echo "loading haproxy.cfg from $ETCD"
  sleep 10
done

echo "Running confd in the background"

# Run confd in the background to watch the upstream servers
confd -interval 60 -quiet -node $ETCD -config-file /etc/confd/conf.d/demo-haproxy.toml > /var/log/confd.log 2>&1
