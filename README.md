<a href="https://www.homeserverhq.com" target="_blank">
    <img src="https://github.com/homeserverhq/hshq/assets/118991087/44fa836e-33a1-4421-8078-a4408a0ba401" alt=""/>
</a>

## <a href="https://www.homeserverhq.com" target="_blank">HomeServerHQ</a> is an all-in-one home server infrastructure. It is designed to be simple and easy for anyone to setup and use, even without any prior software/IT experience. The installation and management utility performs the full installation of both the HomeServer and RelayServer, along with an integrated suite of free and open source software tools in about an hour. It takes less than 10 minutes of user input, and 50 minutes for the automated installation process to complete. Security and privacy are the primary goals - all settings are pre-configured with safe, sane, and secure defaults.

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

### Feature Comparisons
Feature | <a href="https://www.homeserverhq.com/" target="_blank"> HSHQ </a> | <a href="https://www.cloudron.io/" target="_blank"> Cloudron </a> | <a href="https://yunohost.org/" target="_blank"> YunoHost </a> | <a href="https://homelabos.com/" target="_blank"> HomeLabOS </a> | <a href="https://umbrel.com/" target="_blank"> Umbrel </a> | <a href="https://casaos.io/" target="_blank"> CasaOS </a>
:------ | :------: | :------: | :------: | :------: | :------: | :------: 
Fully configured email server | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: 
Fully configured VPN | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Fully configured firewalls | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Auto-configure supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Auto-integrate supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Auto-monitor supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Automatic https | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: 
Privately network with other HomeServers | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Tunnel external network traffic for specific docker containers | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
No ports open on home router | :heavy_check_mark: | :x: | :x: | :heavy_check_mark: | :x: | :x: 
Access with any type of device (desktop/laptop/cellphone/tablet) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: 
Add your own custom services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :heavy_check_mark: 
Safe and secure infrastructure | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Production ready | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :heavy_check_mark: | :x: 
Federation /<a href="https://en.wikipedia.org/wiki/ActivityPub" target="_blank"> ActivityPub</a>  ready | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Cryptographically-signed source code | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: 
Bring you own equipment | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: 
No IT experience needed | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Simple installation | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: 
Add multiple domains | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: 
Installs apps | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: 
Updates apps | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: 
Console-based management UI | :heavy_check_mark: | :x: | :x: | :heavy_check_mark: | :x: | :x: 
Web-based management UI | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :heavy_check_mark: | :heavy_check_mark: 
Source Code Repo Files (Auditing) | 6 | 13647 | 344 | 912 | 534 | 225 

In summary, HomeServerHQ can easily do <ins>**everything**</ins> that these other projects can do. But they can only do a small fraction of what HomeServerHQ can do.

