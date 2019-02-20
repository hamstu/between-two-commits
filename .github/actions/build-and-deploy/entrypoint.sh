#!/bin/sh -l

set -eu

echo
echo "======================================="
echo "Installing Node deps"
echo "======================================="
echo

# Install node deps
npm install
npm install -g gatsby-cli

echo
echo "======================================="
echo "Building Gatsby site"
echo "======================================="
echo

# Build the blog
gatsby build

echo
echo "======================================="
echo "Deploying to server"
echo "======================================="
echo

# Put the SSH key in a temp file
echo "${BTC_SERVER_PRIVATE_KEY}" > ./btc_id_rsa
chmod 400 ./btc_id_rsa

# Deploy to production
rsync -avz -e "ssh -i ./btc_id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress ./public github@104.238.153.82:/var/www/betweentwocommits.com

# Clean up
rm ./btc_id_rsa
