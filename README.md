# About

## How to use

For testing purpose, it's quite simple to run this image as below.

<blockquote>
$ TAIGA_HOSTNAME=taiga.example.com ./start.sh --with-events<br/>
</blockquote>

## Production environment

For production, persistence and reverse proxy setup might be required.

### Enabling persistence

Edit 'start.sh' and look for keyword 'persistence'.

### SSL-terminated reverse proxy setup

Example configuration files have been included in the 'apache-conf' directory.

<blockquote>
$ cp ./apache-conf/taiga.example.com.conf /etc/apache2/sites-available<br/>
$ cp ./apache-conf/taiga.example.com_ssl.conf /etc/apache2/sites-available<br/>
$ a2ensite taiga.example.com<br/>
$ a2ensite taiga.example.com_ssl<br/>
$ service apache2 restart<br/>
</blockquote>

Also, edit 'start.sh' to add 'TAIGA_SSL' option.

<blockquote>
$ vi start.sh<br/>
  # look up 'mytaiga'.<br/>
  docker run -itd --restart=always \<br/>
    --name taiga \<br/>
    --link taiga-postgres:postgres \<br/>
    --link taiga-redis:redis \<br/>
    --link taiga-rabbit:rabbit \<br/>
    --link taiga-events:events \<br/>
    -e TAIGA_HOSTNAME=$TAIGA_HOSTNAME \<br/>
    -e TAIGA_EVENTS=True \<br/>
    -e TAIGA_SSL=True \<br/>
    -p 80:80 \<br/>
    mytaiga<br/>
</blockquote>

# Original README.md from [benhutchins/docker-taiga-example](https://github.com/benhutchins/docker-taiga-example)

This project serves as an example demonstrating how to use [benhutchins/docker-taiga](https://github.com/benhutchins/docker-taiga). Please see that project for more details.

## How to use

First clone this repository and edit the configuration files (see [taiga-conf](https://github.com/benhutchins/docker-taiga-example/tree/master/taiga-conf)). Then if you have Docker Compose, edit `docker-compose.yml` and change the `TAIGA_HOSTNAME` environment variable and then run `up`:

		docker-compose up

Otherwise, if you don't have Docker Compose, run:

		TAIGA_HOSTNAME=taiga.mycompany.com ./start.sh --with-events

## Extensions

This example installs a few extensions to show how you might do that using [benhutchins/docker-taiga](https://github.com/benhutchins/docker-taiga).

### Slack

> [taiga-contrib-slack](https://github.com/taigaio/taiga-contrib-slack).

You'll need to download the appropriate compiled `slack.js` file from this repo if rebuilding. To get the latest run:

	wget https://github.com/taigaio/taiga-contrib-slack/raw/master/front/dist/slack.js

### LDAP

> [taiga-contrib-ldap-auth](https://github.com/ensky/taiga-contrib-ldap-auth)

You'll need to configure your `local.py` file with the correct LDAP server details. Please see the project link above for details.
