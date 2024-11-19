<a href="https://www.homeserverhq.com" target="_blank">
    <img src="https://github.com/homeserverhq/hshq/assets/118991087/44fa836e-33a1-4421-8078-a4408a0ba401" alt=""/>
</a>

## <a href="https://www.homeserverhq.com" target="_blank">HomeServerHQ</a> is an all-in-one home server infrastructure. It is designed to be simple and easy for anyone to setup and use, even without any prior software/IT experience. The installation and management utility performs the full installation of both the HomeServer and RelayServer, along with an integrated suite of free and open source software tools in about an hour. But it goes beyond just that. Due to a fairly novel networking approach, you'll effectively be running your own private internet. Security and privacy are the primary goals - all settings are pre-configured with safe, sane, and secure defaults. Is this Web 3.0? You decide.

### For full instructions, see <a href="https://wiki.homeserverhq.com/getting-started" target="_blank">https://wiki.homeserverhq.com/getting-started</a>

> Linux Ubuntu 22.04 (fresh installation) is currently the only supported Linux distribution.

> To verify source code, see <a href="https://wiki.homeserverhq.com/tutorials/source-code-verification" target="_blank">https://wiki.homeserverhq.com/tutorials/source-code-verification</a> 

## Table of Contents
- [One-line Start Installation](#one-line-start-installation)
- [Manual Installation](#manual-installation)
- [Setup A Demo](#setup-a-demo)
- [Comparison of Features](#comparison-of-features)
  - [Home Server](#home-server)
  - [Networking](#networking)
- [FAQ](#faq)

## One-line Start Installation
```
wget -q4N https://homeserverhq.com/hshq.sh && bash hshq.sh
```

## Manual Installation
To perform the installation directly via GitHub (in case the webserver is unavailable), run the following commands as the first non-root user (ID=1000) on a fresh Ubuntu 22.04 installation:
```
cd ~
mkdir -p hshq hshq/data hshq/data/lib
wget -q4N https://raw.githubusercontent.com/homeserverhq/hshq/main/hshq.sh
wget -q4 -O hshq/data/lib/hshqlib.sh https://raw.githubusercontent.com/homeserverhq/hshq/main/hshqlib.sh
bash hshq.sh
```

## Setup a Demo
#### See https://wiki.homeserverhq.com/en/tutorials/setup-demo for instructions on how to setup a demo environment.

## Comparison of Features

For a more in-depth analysis of the differences, see the subsequent discussions following this comparison table.

Feature | <a href="https://www.homeserverhq.com/" target="_blank">HSHQ</a> | <a href="https://github.com/cloudron-io" target="_blank">Cloudron</a> | <a href="https://github.com/YunoHost/yunohost" target="_blank">YunoHost</a> | <a href="https://gitlab.com/NickBusey/HomelabOS/" target="_blank">HomeLabOS</a> | <a href="https://github.com/getumbrel/umbrel" target="_blank">Umbrel</a> | <a href="https://github.com/IceWhaleTech/CasaOS" target="_blank">CasaOS</a>
:------ | :------: | :------: | :------: | :------: | :------: | :------: 
Fully configured email server | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x:
Fully configured VPN | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Fully configured firewalls | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Auto-configure supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Auto-integrate supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Auto-monitor supported services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Automatic https | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x:
Privately network with other HomeServers | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Tunnel/masquerade outgoing network traffic for specific docker containers | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
No ports open on home router | :heavy_check_mark: | :x: | :x: | :heavy_check_mark: | :x: | :x:
Host email server and/or websites from home  (on the public internet), even behind multiple layers of NAT/CGNAT | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Access with any type of device (desktop/laptop/cellphone/tablet) from anywhere | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :x:
Add your own custom services | :heavy_check_mark: | :x: | :x: | :x: | :x: | :heavy_check_mark:
Safe and secure infrastructure | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Production ready | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :heavy_check_mark: | :x:
Federation /<a href="https://en.wikipedia.org/wiki/ActivityPub" target="_blank"> ActivityPub</a>  ready | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Cryptographically-signed source code | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x:
Bring you own equipment | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark:
No IT experience needed | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Simple installation | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark:
Add multiple domains to the same HomeServer | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Add multiple HomeServers to the same primary RelayServer | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x:
Installs apps | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark:
Updates apps | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x:
Console-based management UI | :heavy_check_mark: | :x: | :x: | :heavy_check_mark: | :x: | :x:
Web-based management UI | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :heavy_check_mark: | :heavy_check_mark:
Shiny and Pretty Web UI | :x: | :heavy_check_mark: | :heavy_check_mark: | :x: | :heavy_check_mark: | :heavy_check_mark:
Simple and streamlined backup/restore procedures | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: | :x:
100% free and open source - no strings attached | :heavy_check_mark: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark:
\# of Files in Source Code Repository (Auditing) | 5 | 13724 | 380 | 917 | 775 | 227

To describe the differences more thoroughly, we'll break it into two categories - the first is strictly the home server itself, and the second is the networking aspect.

### Home Server

Probably the most central and useful aspect of an all-in-one approach is the idea of a one-click install. There are thousands of open-source projects that one can install, and clicking a single button to install it is very useful. You may even be enticed by the fancy web interfaces that some of these so called "all-in-one" projects employ - it seems professional and legitimate. However, in just about every case, you could have gotten that far by yourself with about the same amount of work. In general, you are being handed a much bigger workload, in that you have to configure and maintain it yourself. So these shiny and pretty web interfaces are nothing more than lipstick on a pig.

***HomeServerHQ is a <ins>truly</ins> all-in-one approach - a cohesive integrated system, rather than just a disparate box of parts.*** Let's take an example, such as <a href="https://nextcloud.com/" target="_blank">Nextcloud</a>.

If you did a one-click install using these other so-called "all-in-one" projects, you would first have to start with creating an admin username/password. Then, if you want to tie in SMTP capabilities, i.e. for the system to send out informational emails, you would have to configure that as well. For creating additional users, you could utilize the built-in registration system, or if you have an LDAP server, you could use that instead, but you have to configure it. What about securely accessing it with the mobile app? What about monitoring the up/down status? What about some of the other integrations, such as video-conferencing with <a href="https://jitsi.org/" target="_blank">Jitsi</a>, collaborative document editing with <a href="https://www.collaboraonline.com/" target="_blank">Collabora</a>, anti-virus checking with <a href="https://www.clamav.net/" target="_blank">ClamAV</a>? The list goes on, and it's up to you to figure all of this out. It's not too difficult for a seasoned IT professional to do, but the time invested adds up, and Nextcloud is just one project.

On the other hand, when you install any supported service within HomeServerHQ's architecture, any and all available integrations are automatically performed on your behalf. Email is the natural connective tissue of the internet, and its no different in this case. <a href="https://mailu.io/" target="_blank">Mailu</a> was chosen as the mail server project. Of the total 60+ supported services, almost half of them have some sort of SMTP capability, which is fully configured during installation. Not every project employs LDAP for their user profiles, but the ones that do (around 15-20), have this configured as well.

Any new service is automatically:

- Imported into <a href="https://www.portainer.io/" target="_blank">Portainer</a> as a stack ![image](https://github.com/user-attachments/assets/d46a5636-23d6-4c6b-9b32-9c046420c5ee)
- Added to <a href="https://caddyserver.com/" target="_blank">Caddy</a> in order to access via https ![image](https://github.com/user-attachments/assets/1b3b6882-c5ab-49a8-a973-21b8870dbf40)
- Put behind <a href="https://www.authelia.com/" target="_blank">Authelia</a> for added protection ![image](https://github.com/user-attachments/assets/f8664118-9d38-454e-8c93-b618e20b1a56)
- Added to <a href="https://github.com/louislam/uptime-kuma" target="_blank">UptimeKuma</a> for monitoring the up/down status ![image](https://github.com/user-attachments/assets/6eaec5ea-6b2c-4052-acc6-e84ffa923fd6)
- Added to <a href="https://github.com/linuxserver/Heimdall" target="_blank">Heimdall</a> - a beautiful home page with icons for all of the services ![image](https://github.com/user-attachments/assets/d174062c-9e96-450a-a4db-0452cc7122bb)

Almost half of the supported services use either <a href="https://www.mysql.com/" target="_blank">MySQL</a>/<a href="https://mariadb.org/" target="_blank">MariaDB</a> or <a href="https://www.postgresql.org/" target="_blank">Postgres</a> for their backend storage. So, these database containers are not only added to an internal network and viewable/queryable via <a href="https://getsqlpad.com/en/introduction/" target="_blank">SQLPad</a>, but the database contents are also exported to flat file on an hourly basis with <a href="https://github.com/mcuadros/ofelia" target="_blank">Ofelia</a>.
![image](https://github.com/user-attachments/assets/bcbf0bdd-ae14-4239-a50b-3e3283aee926)
There are also numerous other smaller integrations as well, i.e. <a href="https://www.home-assistant.io/" target="_blank">HomeAssistant</a> data is sent to <a href="https://www.influxdata.com/" target="_blank">InfluxDB</a>, Wazuh agents are installed on both HomeServer and RelayServer during <a href="https://wazuh.com/" target="_blank">Wazuh</a>'s installation, the list goes on and on.

***In short, all configuration options are investigated, and all integration options are exploited.***

### Networking

While the integrated systems approach is a significant improvement compared to other projects, the networking aspect puts HomeServerHQ into a class by itself. There is no other project on the planet that has anything like it - it's all entirely novel. To understand some of the background, we took the concept(s) of <a href="https://www.cloudflare.com/products/tunnel/" target="_blank">Cloudflare Tunnels</a>, combined with the <a href="https://www.wireguard.com/" target="_blank">WireGuard</a> capabilities expressed in <a href="https://tailscale.com/" target="_blank">Tailscale</a>/<a href="https://github.com/juanfont/headscale" target="_blank">Headscale</a>, some influences from <a href="https://gitlab.com/cyber5k/mistborn" target="_blank">Stormblest/mistborn</a>, the <a href="https://homelabos.com/docs/setup/bastion/" target="_blank">Cloud Bastion server</a> component of HomeLabOS, as well as the overall idea of <a href="https://en.wikipedia.org/wiki/Federated_architecture" target="_blank">Federation</a> popularized by <a href="https://matrix.org/" target="_blank">Matrix.org</a>. We originally set out to simply find a way around the self-hosting NAT/CGNAT issue(s) in an IPV4 world. But it turned into a much deeper and worthwhile exploration in which novel concepts emerged.

***The reason why this approach is significantly safer and more secure than any other method is quite simple - NOTHING is exposed to the public internet. It is all PRIVATE networking and the data resides safe and sound in your home.***

To get a better understanding of how it all works, the best place to start is our <a href="https://wiki.homeserverhq.com/getting-started#homeserverhq-architecture" target="_blank">Architecture video</a>. As illustrated in the video, the main thing to understand is the concept of a two-server setup: a HomeServer and a RelayServer. The HomeServer is the physical equipment in your home where the data resides, and the RelayServer is a lightweight access point so that you can connect to your HomeServer from anywhere. The RelayServer is like your router - it handles all of the incoming and outgoing traffic of your network. But it is a smart router. Rather than doing a simple passthrough like a bastion host, we instead incorporated smarter relay tools to allow for more efficient routing of traffic.

![RelayServerDiagram](https://github.com/user-attachments/assets/0b5fe940-fbeb-4788-90c8-040eeb5a8dc4)

For example, to route https traffic, the RelayServer has its own reverse proxy. As requests come in, they will be routed appropriately to the correct internal host. This allows for unlimited internal hosts(HomeServers), as well as unlimited domains on a single HomeServer. We also applied the same concept to the email relay. It is a simple <a href="https://www.postfix.org/" target="_blank">Postfix</a> relay that inspects and determines the correct internal host and routes the mail accordingly. The mail relay also has a few added features such as: 
- Basic spam detection with <a href="https://rspamd.com/" target="_blank">RSpamD</a> - to limit unwanted email from even being forwarded
- Store and Forward - holds the mail for up to 30 days if the internal server cannot be reached
- Additional virus detection using <a href="https://www.clamav.net/" target="_blank">ClamAV</a> can also be added with a few minor configuration changes

While https and email have some form of Server Name Indication, not all types of services do, so the typical bastion server-style approach can be applied to any of the remaining ports (or port ranges).

There are simple-to-use tools on the managing HomeServer to perform nearly every common task on the RelayServer in just a few seconds. This includes anything from:
- Adding/removing a new secondary domain - You can add any number of secondary domains to a single HomeServer
- Adding/removing an exposed subdomain - Allows web sites to be hosted on the public internet from an internal HomeServer via the RelayServer
- Adding/removing a port forwarding rule - passes traffic that arrives at a port (or range of ports) on the RelayServer to a port (or range of ports) on a specific internal host
- Adding/removing a LetsEncrypt certificate request passthrough - this allows LE certificates to be issued to backend services on the HomeServer (which solves the problem that some mobile apps encounter when being accessed internally)

![image](https://github.com/user-attachments/assets/3b56b48e-fced-46db-85d1-0c63eac2f56a)

The networking features described so far are somewhat known and typical regarding the concept of a generic relay server. However, when looking at our internal networking infrastructure, some really cool concepts emerged. A large amount of credit is given to the elegant and versitile design pattern of <a href="https://www.wireguard.com/" target="_blank">WireGuard</a>. The split-tunnelling capabilities coupled with the peer-to-peer nature of the protocol allows for very advanced networking techniques, yet requires only a few lines of simple and straightforward configuration.

When you first set up your RelayServer, you HomeServer creates an outgoing persistent tunnel to the RelayServer. This connection is the means in which mail is delivered as well as server-to-server communications within your private network - it is your PrimaryVPN. When you invite another HomeServer to host on your network, you are providing them with a tunnel into your network as well, and the RelayServer is the central access point for all of the connections. On the other side of the coin, when you join someone else's network, you are provided a tunnel into THEIR network, which ingresses via THEIR RelayServer.

![image](https://github.com/user-attachments/assets/f3369a75-7d65-4646-aecb-17fd058a5612)

Each time you host on a different network, a new corresponding reverse proxy instance is created to serve that network. This reverse proxy will request certificates from the hosting network, using the <a href="https://smallstep.com/certificates/" target="_blank">SmallStep</a> integration with <a href="https://caddyserver.com/" target="_blank">Caddy</a>. There is a default set of services that are exposed to other networks, but each instance can be customized differently, depending on your preferences for that network. This is where the whole concept of "overlapping private internets" comes from - you can simultaneously host on different networks, while picking and choosing which services to expose on which networks.

The reason that a new reverse proxy instance is generated for each new network is because there is currently no such thing as conditional TLS, i.e. conditional based on the IP address of the requestor - no open source projects support this idea. Thus, each reverse proxy instance must serve certificates with a chain signed by the root certificate of that network (otherwise all servers and client devices on the network would have to install a root certificate for each HomeServer - a mess!). We could have opted to use something like <a href="https://letsencrypt.org/" target="_blank">LetsEncrypt</a> or <a href="https://zerossl.com/" target="_blank">ZeroSSL</a> throughout, but there's no reason to overload their servers with this much traffic, and it's against the true spirit and essence of self-hosting with open-source software - especially when the tools exist.

![OverlappingInternets](https://github.com/user-attachments/assets/a8e28479-f5a0-43a9-93f1-63c5e3aeec29)

All of these processes take place seamlessly in the background, the user is typically never away of anything. The DNS and TLS in most use cases are handled automatically in the background. The only thing that they will see is the occasional automated email informing them of a new HomeServer joining or an existing one leaving. Even as the manager of a network, the process is as simple as a few button clicks.

## FAQ
  <ins>***Q: Why one big bash script?***</ins>

  **A:** The source code is composed of two bash scripts, hshq.sh and hshqlib.sh. hshq.sh is a simple wrapper script that invokes hshqlib.sh. hshq.sh will rarely, if ever, change. hshqlib.sh will be regularly updated. By putting (nearly) everything into a single script (hshqlib.sh), it makes it much easier to:
  
  1. Version - Each new version respects the changes made in the prior one, and the entire file is self-consistent.
  2. Audit - It is much easier to view and monitor the changes in ***ONE*** file as opposed to many files, especially across numerous deltas.
  3. Sign Code - As each new version is generated and posted, it is signed with a detached signature. Before a new version is accepted and applied, it is first checked for a valid signature. See <a href="https://wiki.homeserverhq.com/en/tutorials/source-code-verification" target="_blank">this link</a> for more details.
  4. Transfer - At around 50k lines (currently), the file is still only about 1.8 MB in size, which makes it very lightweight for downloading newly updated versions. Even though this is rather large for a bash script, it is a function-based approach - there are around 900 functions.

  <ins>***Q: Why Linux Ubuntu?***</ins>

  **A:** Like it or hate it, Linux Ubuntu is the most prevalent and widely used Linux distribution on the planet. It is well-suited for beginners while also well-accepted (generally) amongst seasoned professionals. It is (arguably) the most stable and supported distribution available, which makes it the logical choice. While there are many detractors for understandable reasons, there are no immediate plans to support other distros. Best attempts have been made to limit the reliance on specifically Ubuntu, it could be adapted to be more generically Debian, but again this is not a high priority item at the moment. If you want another distribution, PR's are welcome.

  <ins>***Q: Only Ubuntu 22.04 is supported, any plans for 24.04?***</ins>

  **A:** Yes, 24.04 is on the near-term roadmap. We will only focus on the LTS releases. Some installation issues came up when 24.04 was first released, but they were not thoroughly investigated, so the issue was sidelined for the time being. We also have about <a href="https://wiki.homeserverhq.com/foss-projects" target="_blank">80 other open-source projects</a> to keep track of for updates, so its a mixed-bag of priorities. Our main goal with respect to the codebase is production-grade stability for the average non-IT person - even the slightest little error can wreak havoc.

  <ins>***Q: Does this cost money?***</ins>

  **A:** Yes. But then again, EVERYTHING has a cost. The short answer: For a typical home setup, it will cost about $400 to buy the equipment (if you have nothing to work with) and about $15 per month ongoing costs. The long answer: For the equipment, <a href="https://wiki.homeserverhq.com/en/getting-started/prepare-homeserver" target="_blank">here is a guide</a> for an affordable setup with around 4-6 active users. For the ongoing costs, unless you have a static IP address with your internet service provider (ISP), you will likely have to rent a VPS from a provider for your RelayServer. The RelayServer serves numerous valuable functions, with the most important being an access point for your mobile devices when you are not at home. It is very lightweight on resources, so it should run about $5-$10 per month. <a href="https://wiki.homeserverhq.com/en/getting-started/setup-relayserver" target="_blank">Here is a link</a> for more details. You'll also need a domain name, which runs about $10-$15 per year, i.e. \~$1 per month. And finally, if you want to have access to <a href="https://forum.homeserverhq.com" target="_blank">help and support</a>, another $40 per year (\~$4 per month). So \~$400 fixed investment, \~$15 per month ongoing. Aside from that, all of the source code for this project and all related projects is fully free and open source, with no strings attached.
  
  <ins>***Q: I have other questions. Where do I get help?***</ins>

  **A:** As mentioned in the previous answer, help/support can be obtained via a <a href="https://accounts.homeserverhq.com/product/homeserverhq-membership-40/" target="_blank">Professional Support Subscription</a>, which currently costs $40 per year. This is the sole revenue source for this platform, there is no corporate backing with a hidden agenda. Purchasing a subscription is completely optional and has no bearing on the operational capabilities of your infrastructure. It is merely a place to go to obtain help. You could be a complete novice with a "dumb" question or a seasoned expert with a very complicated inquiry. All questions are welcome and will be treated with the highest level of professionalism. Regardless of how "dumb" you might think a question is, there's a good chance that someone else might want to know the same thing. So just by asking, you're helping out others. In other words, there's no such thing as a dumb question - *only dumb people for not asking*.

  <ins>***Q: I want to have this, but I have no idea what I'm doing. Where do I start?***</ins>

  **A:** Go to the <a href="https://wiki.homeserverhq.com/getting-started" target="_blank">Getting Started</a> section on the Wiki and walk through each of the provided topics. There are accompanying videos to assist as well. If you have read through everything and watched the videos and something still isn't clear, then you might have to sign up for a <a href="https://accounts.homeserverhq.com/product/homeserverhq-membership-40/" target="_blank">support membership</a> to ask. It's impossible to know what is unclear unless you convey it in the form of a question. This will allow us to better address these ambiguities for everyone going forward.

  <ins>***Q: Can I test this out before buying anything?***</ins>

  **A:** Yes, and in fact this is highly recommended. It is something that you can do right now for less than $5 if your servers are only up for a couple of days. Basically, you are going to simulate your HomeServer equipment with a virtual private server (VPS) from a cloud provider. <a href="https://wiki.homeserverhq.com/en/tutorials/setup-demo" target="_blank">This link</a> provides a walkthrough of setting up both HomeServer and RelayServer VPS's using a sample provider.

 <ins>***Q: My ISP does not allow port forwarding nor a static IP, can I still host from home?***</ins>
 
 **A:** Yes, without question you can host from anywhere, regardless of your circumstances, even behind NAT/CGNAT. This is probabaly our largest contribution to the community. You will have to rent a VPS as a RelayServer, which is pretty cheap - between $5-$10 per month. But it will perform the function as the front-end to your entire infrastructure. If you watch the [Architecture video](https://videos.homeserverhq.com/w/hfkskbtNyh6gpTiGVxgS7c), you'll get a better idea of what role the RelayServer fulfills.

  <ins>***Q: Can this run in a virtual machine (VM)?***</ins>

  **A:** Yes and No. It has been extensively tested on a Proxmox hypervisor with no problems - it works perfectly. With Windows as the host OS, some problems with respect to networking have been reported, so a Linux-based host is highly recommended. As long as the VM's operating system is on the supported list (currently only Ubuntu 22.04), then it should work in just about any environment, but its impossible to know without confirmed tests.

  <ins>***Q: Is this IPV4 or IPV6?***</ins>

  **A:** Currently, this is purely IPV4. Yes, this does unfortunately contribute to the <a href="https://en.wikipedia.org/wiki/IPv4_address_exhaustion" target="_blank">IPV4 address exhaustion</a> issue in the short term. Migrating to either dual-stack and/or fully IPV6 is the largest and most important item on our roadmap. Another big reason is the network collision probability. All VPN networking utilizes the 10.0.0.0/8 space, with each network peeling off a random /24 from this block. There are 65,536 possible networks in this space (256x256), thus the probability of a full collision is pretty low, i.e. you randomly select the same /24 block as someone you want to network with. However, a partial collision (at least two people you network with have the same /24 block), has a real possibility of occurring. This is a <a href="https://betterexplained.com/articles/understanding-the-birthday-paradox/" target="_blank">birthday paradox problem</a>. In short, the probability hits 1% at around 36 networks, which is not too terrible. With regards to IPV6 in general, there are so many different aspects to consider, with the biggest being production-grade stability for the average non-IT person. The migration process must be both simple to perform, while also maintaining backwards compatibility. So it might take a year or so for this to be rolled out. Once we have integrated IPV6, it is game, set, and match.
