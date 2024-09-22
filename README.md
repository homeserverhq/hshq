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
 - Tunnel/masquerade outgoing network traffic for specific docker containers
 - No open ports on home router
 - Host email server and/or websites (on the public internet) from home, even behind multiple layers of NAT/CGNAT
 - By default, all services (besides email) are only available on your private network
 - Access with any type of device (desktop/laptop/cellphone/tablet) from anywhere
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
 - Simple and streamlined backup/restore procedures
 - 100% open source - no strings attached

## FAQ
  ***Q: Why one big bash script?***

  **A:** The source code is composed of two bash scripts, hshq.sh and hshqlib.sh. hshq.sh is a simple wrapper script that invokes hshqlib.sh. hshq.sh will rarely, if ever, change. hshqlib.sh will be regularly updated. By putting (nearly) everything into a single script (hshqlib.sh), it makes it much easier to maintain consistency with versioning as well as <a href="https://wiki.homeserverhq.com/en/tutorials/source-code-verification" target="_blank">code-signing</a>. At around 50k lines (currently), the file is still only about 1.8 MB in size, which makes it very lightweight for downloading newly updated versions. Even though this is rather large for a bash script, it is a function-based approach - there are over 800+ functions.

  ***Q: Why Linux Ubuntu?***

  **A:** Like it or hate it, Linux Ubuntu is the most prevalent and widely used Linux distribution on the planet. It is well-suited for beginners while also well-accepted (generally) amongst seasoned professionals. It is (arguably) the most stable and supported distribution available, which makes it the logical choice. While there are many detractors for understandable reasons, there are no immediate plans to support other distros. Best attempts have been made to limit the reliance on specifically Ubuntu, it could be adapted to be more generically Debian, but again this is not a high priority item at the moment. If you want another distribution, PR's are welcome.

  ***Q: Only Ubuntu 22.04 is supported, any plans for 24.04?***

  **A:** Yes, 24.04 is on the near-term roadmap. We will only focus on the LTS releases. Some installation issues came up when 24.04 was first released, but they were not thoroughly investigated, so the issue was sidelined for the time being. We also have about <a href="https://wiki.homeserverhq.com/foss-projects" target="_blank">80 other open-source projects</a> to keep track of for updates, so its a mixed-bag of priorities. Our main goal is production-grade stability for the average non-IT person - even the slightest little error can wreak havoc.

  ***Q: Does this cost money?***

  **A:** Yes. But then again, EVERYTHING has a cost. The short answer: For a typical home setup, it will cost about $400 to buy the equipment (if you have nothing to work with) and about $15 per month ongoing costs. The long answer: For the equipment, <a href="https://wiki.homeserverhq.com/en/getting-started/prepare-homeserver" target="_blank">here</a> is a guide for an affordable setup with around 4-8 active users. For the ongoing costs, unless you have a static IP address with your internet service provider (ISP), you will likely have to rent a VPS from a provider for your RelayServer. The RelayServer serves numerous valuable functions, with the most important being an access point for your mobile devices when you are not at home. It is very lightweight on resources, so it should run about $10 per month. <a href="https://wiki.homeserverhq.com/en/getting-started/setup-relayserver" target="_blank">Here</a> is a link for more details. You'll also need a domain name, which runs about $10-$15 per year, i.e. ~$1 per month. And finally, if you want to have access to <a href="https://forum.homeserverhq.com" target="_blank">help and support</a>, another $40 per year (~$4 per month). So ~$400 fixed investment, ~$15 per month ongoing. Aside from that, all of the source code for this project and all related projects is fully free and open source, with no strings attached.
  
  ***Q: I have other questions. Where do I get help?***

  **A:** As mentioned in the previous answer, help/support can be obtained via a <a href="https://accounts.homeserverhq.com/product/homeserverhq-membership-40/" target="_blank">Professional Support Subscription</a>, which currently costs $40 per year. You could be a complete novice with a "dumb" question or a seasoned expert with a very complicated inquiry. All questions are welcome and will be treated with the highest level of professionalism. Regardless of how "dumb" you might think a question is, there's a good chance that someone else might want to know the same thing. So just by asking, you're helping out others. In other words, there's no such thing as a dumb question - *only dumb people for not asking*.
