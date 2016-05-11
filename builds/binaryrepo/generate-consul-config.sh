#!/bin/bash
mkdir -p /var/lib/consul
mkdir -p /etc/consul.d
cat > /etc/consul.d/consul.json << JSON
{
  "rejoin_after_leave": true,
  "start_join": [
    "${CONSUL_URL}"
  ],
  "encrypt": "${CONSUL_ENCRYPT}",
  "server": false,
  "datacenter": "${CONSUL_DATACENTER}",
  "ports":{"dns":53},
  "data_dir": "/var/lib/consul",
  "node_name": "binary-repo-${HOSTNAME}"
}
JSON
