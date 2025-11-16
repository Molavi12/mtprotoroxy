#!/bin/bash
cd /MTProxy/objs/bin

# Generate random secret
SECRET=$(head -c 16 /dev/urandom | xxd -ps)
echo "====================================="
echo "MTProto Proxy Started Successfully!"
echo "Secret: $SECRET"
echo "Port: 443"
echo "Use this secret in Telegram settings"
echo "====================================="

# Run proxy with simplified config
./mtproto-proxy -u -p 8888 -H 443 -S "$SECRET" --aes-pwd /dev/null -M 1
