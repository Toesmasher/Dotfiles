#!/usr/bin/env sh

git clone https://github.com/google/gmail-oauth2-tools
echo "Check https://console.cloud.google.com/, add web client type app with proper redirect uri and gmail access"
echo ""
echo "python gmail-oauth2-tools/python/oauth2.py --generate_oauth2_token --client_id XXX --client_secret YYY"
