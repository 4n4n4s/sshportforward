#!/bin/sh

echo "Starting ssh connection"
expect ssh.exp
echo "Container is kept alive for $KEEPALIVE"
sleep $KEEPALIVE
echo "Container shutdown. (Increase/decrease KEEPALIVE if needed)"
