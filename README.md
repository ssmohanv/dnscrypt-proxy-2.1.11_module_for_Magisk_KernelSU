# dnscrypt-proxy-2.1.12 for Magisk / KernelSU
- This module is created based on the latest DNSCrypt 2.1.12 
- Sources: https://github.com/dnscrypt/dnscrypt-proxy/releases?utm_source=perplexity
- This module works both with Magisk and KernelSU.

## This module is based on DNScrypt release 2.1.12

## 2.1.12-1 (29/05/2025)
 - A new Weighted Power of Two (wp2) load balancing strategy has been implemented as the default, providing improved distribution across resolvers.
 - An optional Prometheus metrics endpoint has been added for monitoring and observability.
Memory usage for the cache has been reduced.
 - The monitoring dashboard has received significant improvements including better security, performance optimizations, WebSocket rate limiting, and HTTP caching headers.
 - The monitoring UI has been refined with stable sorting to prevent flickering, query type limitations, and improved scrolling behavior.
 - Additional records in queries are now properly removed before forwarding.  

## Features:
- DNS traffic encryption and authentication. Supports DNS-over-HTTPS (DoH) using TLS 1.3 and QUIC, DNSCrypt, Anonymized DNS and - ODoH
- Client IP addresses can be hidden using Tor, SOCKS proxies or Anonymized DNS relays
- DNS query monitoring, with separate log files for regular and suspicious queries
- Filtering: block ads, malware, and other unwanted content. Compatible with all DNS services
- Time-based filtering, with a flexible weekly schedule
- Transparent redirection of specific domains to specific resolvers
- Optional hot-reloading of configuration files (disabled by default from v2.1.10)
- DNS caching, to reduce latency and improve privacy
- Local IPv6 blocking to reduce latency on IPv4-only networks
- Load balancing: pick a set of resolvers, dnscrypt-proxy will automatically measure and keep track of their speed, and balance the traffic across the fastest available ones.
- Cloaking: like a HOSTS file on steroids, that can return preconfigured addresses for specific names, or resolve and return the IP address of other names. This can be used for local development as well as to enforce safe search results on Google, Yahoo, DuckDuckGo and Bing
- Automatic background updates of resolvers lists
- Can force outgoing connections to use TCP
- Compatible with DNSSEC
- Includes a local DoH server in order to support ECH (ESNI)

## What it does and how it works
- What it is: "KernelSU/Magisk module for DNSCrypt-Proxy version 2.1.11."

- Installation instructions: "Download the attached .zip file and flash it via KernelSU Manager (or Magisk Manager)."

- Configuration: "The main configuration file is dnscrypt-proxy.toml located at /sdcard/dnscrypt-proxy/. You can edit listen_addresses and server_names there."

- Verification: "Use a DNS leak test website (e.g., dnsleaktest.com) to verify proper functioning."

- Give me credit if you take this base for further modification.
