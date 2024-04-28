#!/usr/bin/env sh

# Note: mutt_oauth2.py modified so that it always produces a refreh token from google

# Main
TOESMASHER_SECRET=$(pass show email/toesmasher.se-secret)
python mutt_oauth2.py \
  --authorize \
  --authflow authcode \
  --provider google \
  --email nicke@toesmasher.se \
  --client-id 541987573942-5us1b6pi8j3psa9i101e0s9hbcc79icp.apps.googleusercontent.com \
  --client-secret ${TOESMASHER_SECRET} \
  nicke

# Spam
python mutt_oauth2.py \
  --authorize \
  --authflow authcode \
  --provider google \
  --email spambox@toesmasher.se \
  --client-id 541987573942-5us1b6pi8j3psa9i101e0s9hbcc79icp.apps.googleusercontent.com \
  --client-secret ${TOESMASHER_SECRET} \
  spambox

# Work
python mutt_oauth2.py \
  --authorize \
  --authflow localhostauthcode \
  --provider microsoft \
  --email niklas.berggren@consat.se \
  --client-id d111b787-42af-4e80-91da-e6d3efcb62d9 \
  consat
