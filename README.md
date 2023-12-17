<a href="https://www.homeserverhq.com" target="_blank">
    <img src="https://github.com/homeserverhq/hshq/assets/118991087/44fa836e-33a1-4421-8078-a4408a0ba401" alt=""/>
</a>

## <a href="https://www.homeserverhq.com" target="_blank">HomeServerHQ</a> is an all-in-one home server infrastructure. It is designed to be simple and easy for anyone to setup and use, even without any prior software/IT experience. The installation and management utility performs the full installation of both the Home Server and Relay Server, along with an integrated suite of free and open source software tools in about an hour. It takes less than 10 minutes of user input, and 50 minutes for the automated installation process to complete. Security and privacy are the primary goals - all settings are pre-configured with safe, sane, and secure defaults.

### For full instructions, see <a href="https://wiki.homeserverhq.com/getting-started" target="_blank">https://wiki.homeserverhq.com/getting-started</a>

> Linux Ubuntu 22.04 (fresh installation) is currently the only supported Linux distribution.

> To verify source code, see <a href="https://wiki.homeserverhq.com/tutorials/source-code-verification" target="_blank">https://wiki.homeserverhq.com/tutorials/source-code-verification</a> 

-  ### One-line Start Installation
```
wget -q https://homeserverhq.com/hshq.sh && bash hshq.sh
```

-  ### Manual Installation
To perform the installation directly via GitHub (in case the webserver is unavailable), run the following commands as the first non-root user (ID=1000) on a fresh Ubuntu 22.04 installation:
```
cd ~
mkdir -p hshq hshq/data hshq/data/lib
wget -q https://raw.githubusercontent.com/homeserverhq/hshq/main/hshq.sh
wget -q -O hshq/data/lib/hshqlib.sh https://raw.githubusercontent.com/homeserverhq/hshq/main/hshqlib.sh
bash hshq.sh
```
