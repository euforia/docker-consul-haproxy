#!/bin/sh

set -e

CT_BIN="consul-template"
BIN="haproxy"

sed -e "s/REPLACE/${SERVICE_NAME}/g" haproxy.cfg.ctmpl.sed > haproxy.cfg.ctmpl

${CT_BIN} -log-level DEBUG -consul-addr=${CONSUL_ADDR} \
    -template=/haproxy.cfg.ctmpl:/etc/haproxy/haproxy.cfg \
    -exec "${BIN} -db -f /etc/haproxy/haproxy.cfg"
