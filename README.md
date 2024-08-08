<a href="https://www.homeserverhq.com" target="_blank">
    <img src="https://github.com/homeserverhq/hshq/assets/118991087/44fa836e-33a1-4421-8078-a4408a0ba401" alt=""/>
</a>

## <a href="https://www.homeserverhq.com" target="_blank">HomeServerHQ</a> is an all-in-one home server infrastructure. It is designed to be simple and easy for anyone to setup and use, even without any prior software/IT experience. The installation and management utility performs the full installation of both the HomeServer and RelayServer, along with an integrated suite of free and open source software tools in about an hour. But it goes beyond just that. Due to a fairly novel networking approach, you'll effectively be running your own private internet. Security and privacy are the primary goals - all settings are pre-configured with safe, sane, and secure defaults. Is this Web 3.0? You decide.

### For full instructions, see <a href="https://wiki.homeserverhq.com/getting-started" target="_blank">https://wiki.homeserverhq.com/getting-started</a>

> Linux Ubuntu 22.04 (fresh installation) is currently the only supported Linux distribution.

> To verify source code, see <a href="https://wiki.homeserverhq.com/tutorials/source-code-verification" target="_blank">https://wiki.homeserverhq.com/tutorials/source-code-verification</a> 

### One-line Start Installation
```
wget -q -N https://homeserverhq.com/hshq.sh && bash hshq.sh
```

### Manual Installation
To perform the installation directly via GitHub (in case the webserver is unavailable), run the following commands as the first non-root user (ID=1000) on a fresh Ubuntu 22.04 installation:
```
cd ~
mkdir -p hshq hshq/data hshq/data/lib
wget -q -N https://raw.githubusercontent.com/homeserverhq/hshq/main/hshq.sh
wget -q -O hshq/data/lib/hshqlib.sh https://raw.githubusercontent.com/homeserverhq/hshq/main/hshqlib.sh
bash hshq.sh
```

## Features

 - Fully configured email server
 - Fully configured VPN
 - Fully configured firewalls
 - Auto-configure supported services
 - Auto-integrate supported services
 - Auto-monitor supported services
 - Auto-HTTPS
 - Privately network with other HomeServers
 - Tunnel external network traffic for specific docker containers
 - No ports open on home router
 - Access with any type of device (desktop/laptop/cellphone/tablet)
 - Add your own custom services
 - Safe and secure infrastructure
 - Production ready
 - Federation /<a href="https://en.wikipedia.org/wiki/ActivityPub" target="_blank"> ActivityPub</a>  ready
 - Cryptographically-signed source code 
 - Bring you own equipment
 - No IT experience needed
 - Simple installation 
 - Add multiple domains
 - Installs apps
 - Updates apps 
 - Console-based management UI
 - Web-based management UI
