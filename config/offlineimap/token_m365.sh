#!/usr/bin/env sh

git clone https://github.com/UvA-FNWI/M365-IMAP
pushd M365-IMAP
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python get_token.py
