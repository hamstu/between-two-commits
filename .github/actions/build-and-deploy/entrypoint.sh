#!/bin/sh -l

set -eu

echo
echo "======================================="
echo "Installing Node deps"
echo "======================================="
echo

# Install node deps
npm ci
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

echo "Storing key in temp file..."
echo "${BTC_SERVER_PRIVATE_KEY}" > ./btc_id_rsa
chmod 400 ./btc_id_rsa

# Deploy to production
echo "Deploying with rsync..."
rsync \
  -avz \
  --no-perms \
  --no-owner \
  --no-group \
  --delete \
  --omit-dir-times \
  -e "ssh -i ./btc_id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
  ./public ${BTC_SERVER_USER}@${BTC_SERVER_IP}:${BTC_SERVER_DEST_PATH}

# Clean up
rm ./btc_id_rsa
