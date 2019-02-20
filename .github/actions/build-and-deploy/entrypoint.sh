#!/bin/sh -l

# Install node deps
npm install

# Build the blog
gatsby build

# Put the SSH key in a temp file
echo "${BTC_SERVER_PRIVATE_KEY}" > ./btc_id_rsa

# Deploy to production
rsync -avz -e "ssh -i ./btc_id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress ./public github@104.238.153.82:/var/www/betweentwocommits.com

# Clean up
rm ./btc_id_rsa
