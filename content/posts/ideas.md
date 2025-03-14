+++ 
draft = true
date = 2025-03-06T08:18:58-05:00
title = "Ideas - Internal"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# Topics to cover
- https://www.ssllabs.com/ : checking ssl cert grade
- TLS w/h Cloudflare and GithubPages
  - Explore cloudflare and the benefits it offers
    - DNS in proxy mode
      - DDOS attack
      - ..
  - Github pages feature to host custom domains
    - CNAME record
    - Redirect
  - Cloudflare Registry for domain purchase
  - Manage DNS in cloudflair free account
    - 3 Rules
      - Redirect HTTP to HTTPS
      - Forward www to root
      - What's a good 3rd free rule to setup?
  - Configuring end to end TLS for custom domain w/h cloudflare DNS
    - Snags during setup that were handled by adding and removing DNS entries
    - CNAME for www -> root
    - RULE for www -> root
	- TXT record -> github requirement to verify domain
	- Adding domain to github -> global settings
	- Adding custom domain to repo -> Took some troubleshootin
    	- Github does not like DNS entries when you have "proxy" enabled DNS A records on cloudflare
        	- TODO: Revert your config and show the site being served at HTTP
          	- Show the cloudflare SSL enforceement on the dashboard hitting insecure backend
    	- Disable the proxy settings for all A records and CNAME redirect
    	- Configure custom domain on github
    	- Wait for some time for Github to recognize the updated DNS configuration
		- HTTPS configured on backend
  - Show configure TLS "full" on cloudflare now
  - End to End TLS set up complete
  - BONUS:
    - Show how cloudflare DNS works by checking "dig" return values
	- Show the cloudflare dashboard entries for traffic being encrypted
  - So the above method did not work
    - Everytime proxied DNS is enabled, github detects DNS change and provisions new certificates
    - Try and bypass this by allowing 24 hours for HTTPS to be configured on github (get the green checkmark) and then switching DNS to proxied

- SAML auth setup
  - Metadata
  - Implementation - application level

- Makefile
  - Cover the syntax differences between "makefile" and "rules"
  - Show how you setup a submodule to be in sync w/h main repo

- Jenkins Distributed architecture
  - Requirements : Build images w/h docker
  - Restrictions: No k8s available
  - Archetecture to autoscale
  - From containerized instances per reigion to single central distributed archetecture that autoscales

- Jenkinsfile setup for chaining pipelines to deploy
  - How to use bash scripts with jenkins
  - Using the `script` escape hatch with declarative jenkinsfile syntax
- Do a project w/h uptime kuma - TODO PROJECT
  - Show the reporting capability
- Promise and async/await based api system that's asynchronous and relies on rabbitmq and async workers to process api -  TODO PROJECT
  - You can create a nodejs server w/h a db that uses queues to process data
  - Write a basic CRUD app
  - Creat load w/h users
  - Create a db schema w/h nested relationships
- Do something w/h Nodejs
  - Understand streams and buffers
  - Talk about them
- Implement a project where you build a search feature that indexes records and finds them
- AKS
  - Think about what you can write about here
  - Private api server - lose access to Azure Portal
    - Discuss front end alternatives
- Secret management w/h Key Vault
  - .. can you write about this much?
  - Just cover the basics of creating a script to push/pull - TODO PROJECT
    - Write a golang script that interfaces w/h azure api to do this
    - Run it w/h minimal configurations
    - Document the setup to secure access and push/pull
	- Containerize this and deploy it
- Write about ssh and keys
  - Discuss authentication vs authorization
  - Key based auth
  - How does ssh work
  - TLS
    - TLS w/h Postgresql
  - Work your way up to mTLS
- Follower DB : Read replicas for consumption
  - Look into creating a tunnel to provision this access privately
  - See if the above seetup can be improved
- Start a CDK series : Current
  - This can be low effort and you can just focus on what you're learning w/h CDK
- Start a CKA and CKAD series
  - Again low effort
  - Consolidate notes and write something succinct that delivers value
- Write about log access on linux servers
  - syslog
  - journalctl
- Write about ufw
  - Enabling it
  - Configuring rules
- Write about how networks work
  - How does a machine get access to the internet
  - What does a network card attach to
- Docker networking
- Docker "swarm" networking
- Kuberenetes networking
- Explore dockerfiles and the utility of containerization

## Incidents
- Jenkins failure after azure disk expansion
  - Disk expansion process for azure managed disk (data disk - ssd @4.4T)
    - Live disk expansion
		- Scan to detect updated disk size
		- Update the device size at the OS level using linux tooling - fdisk
	- OS level changes required
		- Relocate the gpt table? to the end of the device - ?add tool name?
		- Expand the filesystem - ?add tool name?
		- ext4 filesystem type
	- Tools and commands used
		- df -Th
		- lsblk
    	- parted
    	- gpt
		- f
  - Docker image transfer from 1 box to another
    - SFTP server push pull
    - SCP push pull
    - Upload to azure storage account inside a container as a blob
      - CLI commands to be able to do this
  - Jenkins plugins failure restricts access to front end
    - Front end file that configures auth is editable and can be disabled if you can run the container as root -  config.xml - located in /var/jenkins_home
    - Allow insecure access
    - This will open jenkins to the world
  - Jenkins update for containerized setup requires 
    - Update dockerfile with new jenkins image - this can be modified to just use stock jenkins image
	- Issue w/h jenkins update is the plugin update that occurs subsequently