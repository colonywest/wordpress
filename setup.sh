#!/bin/bash

set -e
echo

# This will get you up and running with a site accessible on port 80. Getting
# HTTPS working or setting this up to work behind a Traefik proxy is on you.

echo Creating needed MySQL folders

mkdir -p mysql/secrets
mkdir -p mysql/data
mkdir -p logs/nginx

# Use random.org to generate secure random passwords

echo Generating MySQL passwords using random.org

curl -sfL -o mysql/secrets/wordpress_password.txt "https://www.random.org/strings/?num=1&len=32&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
curl -sfL -o mysql/secrets/root_password.txt "https://www.random.org/strings/?num=1&len=32&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"

# Get and automatically uncompress the latest Wordpress release. This'll
# auto-create the wordpress folder needed for both the PHP and NGINX containers.

echo Downloading latest Wordpress release and extracting it

curl -sfL https://wordpress.org/latest.tar.gz | tar xz
sudo chown -R 33:33 wordpress
sudo chown -R 33:33 logs/nginx

echo
echo Done.
echo
echo Bring it online using 'docker compose up -d'.
echo
