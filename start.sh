#!/bin/bash
SECRET=$(head -c 16 /dev/urandom | xxd -ps)
echo "🚀 MTProto Proxy Running!"
echo "🔑 Secret: $SECRET"
echo "📍 Port: 443"
echo "📱 Add in Telegram with this secret"

exec mtproto-proxy -u -p 8888 -H 443 -S "$SECRET" -M 1
