# Wordpress in Docker

I've used [Wordpress](https://wordpress.org) in some form or other since about 2004. Initially it was on shared hosting on 1&1 Internet, now [Ionos](https://www.ionos.com/), back when they gave away 3 years of free shared hosting on their platform. Then after the cost of that hosting seemed to be on a never-ending upward spiral, I switched over to a single-node VPS on [AWS Lightsail](https://lightsail.aws.amazon.com).

After fooling around with Docker for quite a while, eventually I figured out how to migrate Wordpress entirely into Docker containers using `docker compose`. Currently my Wordpress instance is still hosted on AWS Lightsail on an [AlmaLinux](https://almalinux.org/) instance (upgraded to version 10 with [ELevate](https://wiki.almalinux.org/elevate/ELevate-quickstart-guide.html)) using the Docker setup presented here.

## Why Docker?

Easy setup. Easy to migrate to another host if I need it. Simple to back up.

## Setup

```
[colonywest@github.com] git clone https://github.com/colonywest/wordpress.git
Cloning into 'wordpress'...
remote: Enumerating objects: 27, done.
remote: Counting objects: 100% (27/27), done.
remote: Compressing objects: 100% (23/23), done.
remote: Total 27 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (27/27), 7.82 KiB | 7.82 MiB/s, done.
Resolving deltas: 100% (5/5), done.
[colonywest@github.com] cd wordpress
[colonywest@github.com wordpress] ./setup.sh

Creating needed MySQL folders
Generating MySQL passwords using random.org
Downloading latest Wordpress release and extracting it

Done.

Bring it online using 'docker compose up -d'.
The password you'll need to install Wordpress is at mysql/secrets/wordpress_password.txt

[colonywest@github.com wordpress]
```

## Next steps

What I've made available through this repo is enough to at least get you started. Additional steps are needed to set up HTTPS, whether via the nginx config or putting it behind a Traefik proxy. And then there's...

## Installing Wordpress

When navigating to the host in your browser, you'll be prompted for the database details to create a new skeleton Wordpress site. Here's what you'll need:

* **Database Name**: wordpress
* **Username**: wordpress
* **Password**: 
* **Database Host**: mysql

## Copyright and License

Copyright © 2026 - Kenneth Ballard.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) (the "License"); you may not use this file except in compliance with the License.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

This project is not endorsed, licensed, authorized, distributed, supported, or maintained by the Wordpress Foundation. All development and responsibility for this project lies entirely with the author. The author of this project is not in any way affiliated with Arch Linux.