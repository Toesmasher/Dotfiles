#!/usr/bin/env sh

# Main
TOESMASHER_SECRET=$(pass show email/toesmasher.se-secret)
python oauth2.py \
  --user=nicke@toesmasher.se \
  --client_id=541987573942-5us1b6pi8j3psa9i101e0s9hbcc79icp.apps.googleusercontent.com \
  --client_secret=${TOESMASHER_SECRET} \
  --generate_oauth2_token

# Spam
python oauth2.py \
  --user=spambox@toesmasher.se \
  --client_id=541987573942-5us1b6pi8j3psa9i101e0s9hbcc79icp.apps.googleusercontent.com \
  --client_secret=${TOESMASHER_SECRET} \
  --generate_oauth2_token

# Work
BITADDICT_SECRET=$(pass show bitaddict/mail/secret)
python oauth2.py \
  --user=niklas.berggren@bitaddict.se \
  --client_id=419635704791-e8ouna7jgofh7jr0v8hsds1ct0tbfalu.apps.googleusercontent.com  \
  --client_secret=${BITADDICT_SECRET}  \
  --generate_oauth2_token
