# Changelog

### Note: Some of the users of the dnscrypt-proxy 2.1.11 module has the issue of DNS redirection goes through the ISP when switching from WiFi to mobile data. I created a small module "dnscrypt-redirect" which helps refreshing iptable, check and make sure that the DNS redirection is via dnscrypt-proxy.

After rebooting, the dnscrypt-redirect module will continuously work to keep dnscrypt-proxy running and its iptables rules enforced, which should resolve the issue of losing DNS redirection when switching networks.

## 2.1.11-2 (24/05/2025)
### Enabled DNSSEC validation and more servers added (list of servers)
    'cloudflare',                     # General Cloudflare DNS (1.1.1.1) - supports DNSSEC, DoH, DoT
    'google',                         # Google Public DNS (8.8.8.8) - supports DNSSEC, DoH, DoT
    'quad9-dnscrypt-ip4-filter-pri',  # Quad9 (9.9.9.9) - security-focused, DNSSEC, DoH, DoT, DNSCrypt
    'adguard-dns',                    # AdGuard DNS - offers blocking, supports DNSSEC, DoH, DoT
    'cloudflare-family',              # Cloudflare Family (malware/adult blocking) - DNSSEC
    'cloudflare-security',            # Cloudflare Security (malware blocking) - DNSSEC
    'dnscrypt.eu-nl',                 # A well-known DNSCrypt server, often listed with good privacy
    'dnscrypt.ca-1',                  # Canadian DNSCrypt server
    'dnscrypt.uk-ipv4',               # UK based DNSCrypt server
    'meganerd',                       # Another well-regarded DNSCrypt server
    'openinternet',                   # Often a non-logging, unfiltered option
    'scaleway-ams',                   # Scaleway (Amsterdam) - often fast and private
    'techsaviours.org-dnscrypt',      # TechSaviours, often good for privacy/security



## 2.1.11-1 (23/05/2025)
### Upstream
 - DNS traffic encryption and authentication. Supports DNS-over-HTTPS (DoH) using TLS 1.3 and QUIC, DNSCrypt, Anonymized DNS and ODoH
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


## 2.1.5
### Upstream
 - dnscrypt-proxy can be compiled with Go 1.21.0+
 - Responses to blocked queries now include extended error codes
 - Reliability of connections using HTTP/3 has been improved
 - New configuration directive: `tls_key_log_file`. When defined, this
is the path to a file where TLS secret keys will be written to, so
that DoH traffic can be locally inspected.

### Changed
- Optimized relays.

### Removed
- `altername` resolver (temporarily down).
- `dct-de1` resolver (ceased).
- `dns.watch` resolver (unresponsive).
- `starrydns` resolver (ceased).

## 2.1.4
### Upstream
 - Fixes a regression from version 2.1.3: when cloaking was enabled,
blocked responses were returned for records that were not A/AAAA/PTR
even for names that were not in the cloaked list.

### Added
- `dct-ru1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Moscow, Russia).

## 2.1.3
### Upstream
 - DNS-over-HTTP/3 (QUIC) should be more reliable. In particular,
version 2.1.2 required another (non-QUIC) resolver to be present for
bootstrapping, or the resolver's IP address to be present in the
stamp. This is not the case any more.
 - dnscrypt-proxy is now compatible with Go 1.20+
 - Commands (-check, -show-certs, -list, -list-all) now ignore log
files and directly output the result to the standard output.
 - The `cert_ignore_timestamp` configuration switch is now documented.
It allows ignoring timestamps for DNSCrypt certificate verification,
until a first server is available. This should only be used on devices
that don't have any ways to set the clock before DNS service is up.
However, a safer alternative remains to use an NTP server with a fixed
IP address (such as time.google.com), configured in the captive portals
file.
 - Cloaking: when a name is cloaked, unsupported record types now
return a blocked response rather than the actual records.
 - systemd: report Ready earlier as dnscrypt-proxy can itself manage
retries for updates/refreshes.

### Added
- Script in `customize.sh` file for automatically disable Private DNS feature.
- `dct-nl1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Naaldwijk, Netherlands).
- `openinternet` resolver (DNSCrypt resolver colocated at Sonic.net in Santa Rosa, CA in the United States. No log, no filter, DNSSEC. Provided by https://openinternet.io).

### Changed
- Optimized relays.

### Removed
- `acsacsar-ams-ipv4` resolver (unresponsive).
- `dct-ru1` resolver (unresponsive).
- `dnscrypt.eu-nl` resolver (ceased).
- `dotya.ml` resolver (unresponsive).
- `resolver4.dns.openinternet.io` resolver (changed).
- `sgp-dn53` resolver (unresponsive).

### Fixed
- Show the correct changelog version in Magisk app.

## 2.1.2.4
### Added
- Automatic redirections in `post-fs-data.sh` file.

### Changed
- Use a more modern [DNS.SB](https://dns.sb/) as `bootstrap_resolvers`.

## 2.1.2.3
### Changed
- Use [DNS.SB](https://dns.sb/) as `bootstrap_resolvers`.
- Use [DNS.SB](https://dns.sb/) as `netprobe_address`.

### Removed
- Automatic redirections in `post-fs-data.sh` file.

## 2.1.2.2
### Fixed
- Forgotten scripts in `post-fs-data` file (it prevent using bootstrap resolvers correctly).

## 2.1.2.1
### Added
- `dct-at1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Vienna, Austria).
- `dct-de1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Düsseldorf, Germany).
- `dct-ru1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Moscow, Russia).
- `dnswarden-uncensor-dc-swiss` resolver (Hosted in Switzerland. For more information look [here](https://github.com/bhanupratapys/dnswarden) or [here](https://dnswarden.com)).
- `dotya.ml` resolver (Free, uncensored, DNSSEC-validated, non-logging DNSCrypt server hosted in Nuremberg, Germany on Contabo servers. Operated by dotya.ml, configs live [here](https://git.dotya.ml/dotya.ml/dnscrypt-server)).
- `sby-limotelu` resolver (non-censoring, non-logging, DNSSEC-capable Hosted in Surabaya, Indonesia (Dnscrypt) https://limotelu.org maintained by [poentodewo](https://github.com/poentodewo)).
- `sgp-dn53` resolver (non-censoring, non-logging, DNSSEC-capable Hosted in Singapore (Dnscrypt) https://limotelu.org maintained by [poentodewo](https://github.com/poentodewo)).
- `starrydns` resolver (DNSCrypt server in Singapore, no filter, no logs, DNSSEC support).

### Changed
- Optimized relays.
- Use [dns.watch](https://dns.watch/) `resolver1` and `resolver2` as `bootstrap_resolvers`.
- Use [dns.watch](https://dns.watch/) `resolver1` as `netprobe_address`.

### Removed
- `breddns` resolver (unresponsive).
- `dnswarden-uncensor-fr1-dc` resolver (changed).
- `dnswarden-uncensor-ind1-dc` resolver (changed).
- `dnswarden-uncensor-sg1-dc` resolver (changed).
- `dnswarden-uncensor-us1-dc` resolver (changed).
- `moulticast-fr-ipv4` resolver (unresponsive).
- `moulticast-sg-ipv4` resolver (unresponsive).
- `moulticast-uk-ipv4` resolver (unresponsive).
- `pwoss.org-dnscrypt` resolver (unresponsive).

## 2.1.2
### Upstream
- Support for DoH over HTTP/3 (DoH3, HTTP over QUIC) has been added.
Compatible servers will automatically use it. Note that QUIC uses UDP
(usually over port 443, like DNSCrypt) instead of TCP.
- In previous versions, memory usage kept growing due to channels not
being properly closed, causing goroutines to pile up. This was fixed,
resulting in an important reduction of memory usage. Thanks to
@lifenjoiner for investigating and fixing this!
- DNS64: `CNAME` records are now translated like other responses.
Thanks to @ignoramous for this!
- A relay whose name has been configured, but doesn't exist in the
list of available relays is now a hard error. Thanks to @lifenjoiner!
- Mutexes/locking: bug fixes and improvements, by @ignoramous
- Official packages now include linux/riscv64 builds.
- `dnscrypt-proxy -resolve` now reports if ECS (EDNS-clientsubnet) is
supported by the server.
- `dnscrypt-proxy -list` now includes ODoH (Oblivious DoH) servers.
- Local DoH: queries made using the `GET` method are now handled.
- The service can now be installed on OpenRC-based systems.
- `PTR` queries are now supported for cloaked domains. Contributed by
Ian Bashford, thanks!

### Added
- Scripts in `post-fs-data.sh` file for force disable IPv6 connections at OS level, preventing possible leaks.
- `breddns` resolver (Non-logging DNSCrypt server located in Luxembourg, operated by @tmclo).
- `dnswarden-uncensor-fr1-dc` resolver (Hosted in France. For more information look [here](https://github.com/bhanupratapys/dnswarden) or [here](https://dnswarden.com)).
- `dnswarden-uncensor-ind1-dc` resolver (Hosted in India. For more information look [here](https://github.com/bhanupratapys/dnswarden) or [here](https://dnswarden.com)).
- `dnswarden-uncensor-sg1-dc` resolver (Hosted in Singapore. For more information look [here](https://github.com/bhanupratapys/dnswarden) or [here](https://dnswarden.com)).
- `dnswarden-uncensor-us1-dc` resolver (Hosted in USA (Dallas). For more information look [here](https://github.com/bhanupratapys/dnswarden) or [here](https://dnswarden.com)).

### Changed
- Adjusted `versionCode` in `module.prop` file (more easy share beta and manage minor dnscrypt-proxy versions with two digits).
- Optimized relays.

### Removed
- `dnswarden-asia-uncensor-dcv4` resolver (changed).
- `dnswarden-eu-uncensor-dcv4` resolver (changed).
- `dnswarden-us-uncensor-dcv4` resolver (changed).

## 2.1.1-3
### Added
- `plan9dns-fl` resolver (Miami Florida, US No-logs, no-filters, DNSSEC -info https://jlongua.github.io/plan9-dns).
- `plan9dns-mx` resolver (Mexico City, Mexico No-logs, no-filters, DNSSEC -info https://jlongua.github.io/plan9-dns).
- `plan9dns-nj` resolver (Piscataway New Jersey, US No-logs, no-filters, DNSSEC -info https://jlongua.github.io/plan9-dnsPiscataway).
- `techsaviours.org-dnscrypt` resolver (No filter | No logs | DNSSEC | Nuremberg, Germany (netcup) | Maintained by https://techsaviours.org/).

### Changed
- Optimized relays.

### Fixed
- Changelog display issues in Magisk app.

### Removed
- `bcn-dnscrypt` resolver (ceased).
- `dns.digitalsize.net` resolver (DoH).
- `dct-at1` resolver (temporarily down).
- `dct-de1` resolver (temporarily down).
- `dct-ru1` resolver (temporarily down).
- `gombadi-syd` resolver (ceased).
- `moulticast-ca-ipv4` resolver (unresponsive).
- `moulticast-de-ipv4` resolver (unresponsive).
- `plan9-ns1` resolver (changed).
- `plan9-ns2` resolver (changed).

## 2.1.1-2
### Fixed
- Random connection issues under mobile data. (see [DNSCrypt/dnscrypt-proxy/discussions/2020](https://github.com/DNSCrypt/dnscrypt-proxy/discussions/2020))

### Removed
- `dct-ru2` resolver (ceased).
- `pf-dnscrypt` resolver (unresponsive).
- `zackptg5-us-il-ipv4` resolver (ceased).

## 2.1.1-1
### Added
- `uninstall.sh` file for `dnscrypt-proxy` folder removal after module uninstallation (Android 7 and below at the moment).
- `update.json` file for enable the new auto-update feature from `Magisk v24+`.
- `dct-at1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Vienna, Austria).
- `dct-de1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Düsseldorf, Germany).
- `dns.digitalsize.net` resolver (A public, non-tracking, non-filtering DNS resolver with DNSSEC enabled and hosted in Germany (https://dns.digitalsize.net)).
- `dnswarden-asia-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Singapore. by Bhanu Pratap).
- `dnswarden-eu-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Germany. by Bhanu Pratap).
- `dnswarden-us-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in USA (Dallas). by Bhanu Pratap).

### Changed
- Project migrated to GitHub.
- Optimized relays.

### Removed
- `zackptg5-us-pit-ipv4` resolver (unresponsive).

## 2.1.1
### Upstream
This is a bugfix only release, addressing regressions introduced in
version 2.1.0:
- When using DoH, cached responses were not served any more when
experiencing connectivity issues. This has been fixed.
- Time attributes in allow/block lists were ignored. This has been
fixed.
- The TTL as served to clients is now rounded and starts decreasing
before the first query is received.
- Time-based rules are properly handled again in
generate-domains-blocklist.
- DoH/ODoH: entries with an IP address and using a non-standard port
used to require help from a bootstrap resolver. This is not the case
any more.

### Changed
- Optimized relays.

### Removed
- `dama.no-osl-s04` resolver (unresponsive).
- `dama.no-sa-a80` resolver (unresponsive).
- `kenshiro` resolver (unresponsive, no more lucenera resolvers).
- `suami` resolver (unresponsive, no more lucenera resolvers).

## 2.1.0
### Upstream
- `dnscrypt-proxy` now includes support for Oblivious DoH.
- If the proxy is overloaded, cached and synthetic queries now keep being
served, while non-cached queries are delayed.
- A deprecation warning was for `fallback_resolvers`.
- Source URLs are now randomized.
- On some platforms, redirecting the application log to a file was not
compatible with user switching; this has been fixed.
- `fallback_resolvers` was renamed to `bootstrap_resolvers` for
clarity. Please update your configuration file accordingly.

### Added
- DNS Rebind Protection with `blocked-ips.txt` file enabled by default.
- UncensoredDNS (Unicast) in addition to UncensoredDNS (Anycast) as `bootstrap_resolvers`.
- `ams-dnscrypt-nl` resolver (Resolver in Amsterdam. Dnscrypt protocol. Non-logging, non-filtering, DNSSEC).
- `altername` resolver (Protocol: DNSCrypt IPv4 | Features: Non-logging, Non-filtering, DNSSEC, EmerDNS | Location: Moscow, Russia).
- `dama.no-osl-s04` resolver (DNSCrypt server located in Oslo/Norway. Link-speed 100 Mbit/s. Non-censoring, non-logging, DNSSEC-capable).
- `dama.no-sa-a80` resolver (DNSCrypt Server located in Sandefjord/Norway. non-censoring, non-logging, DNSSEC-capable).
- `dct-ru1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Saint Petersburg, Russia).
- `dct-ru2` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Moscow, Russia).
- `dns.watch` resolver (Free, uncensored, non-logging server in Germany. https://dns.watch).
- `gombadi-syd` resolver (Protocol: DNSCrypt IPv4 | Features: Non-logging, Non-filtering, DNSSEC, Unbound | Location: Sydney, AU).
- `kenshiro` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Amsterdam. by lucenera).
- `pf-dnscrypt` resolver (by post-factum | Zürich, Switzerland | Non-logging | Non-filtering | DNSSEC | https://dns.post-factum.tk).
- `plan9-ns2` resolver (DNSCrypt server in Florida, USA. Non-logging, non-filtering, DNSSEC, anonymized. info - https://jlongua.github.io/plan9-dns/).
- `pryv8boi` resolver (By pryv8, non Logging, uncensored, DNSSEC - hosted on contabo servers).
- `resolver4.dns.openinternet.io` resolver (DNSCrypt resolver on dedicated hardware, colocated at Sonic.net in Santa Rosa, CA in the United States. No log, no filter, DNSSEC. Uses Sonic's recusrive DNS servers as upstream resolvers (but is not affiliated with Sonic in any way). Provided by https://openinternet.io).
- `suami` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Frankfurt. by lucenera).
- `zackptg5-us-il-ipv4` resolver (DNSSEC/unfiltered/non-logged. Hosted on Vultr in Chicago, IL. Running the official Docker image by @zackptg5).
- `zackptg5-us-pit-ipv4` resolver (DNSSEC/unfiltered/non-logged. Hosted on TeraSwitch in Pittsburgh, PA. Running the official Docker image by @zackptg5).

### Changed
- The path of the config. files from `/data/media/0/dnscrypt-proxy` to `/storage/emulated/0/dnscrypt-proxy` (fix for log issues on `A11+` and an issue on `A6-` where the config. files could not be modified).
- Set `dnscrypt-proxy.log` level from `2` to `0` (but keep it disabled by default).
- Optimized relays.

### Removed
- `dama.no-osl-s04` resolver (unresponsive).
- `dama.no-sa-a80` resolver (unresponsive).
- `kenshiro` resolver (unresponsive, no more lucenera resolvers).
- `suami` resolver (unresponsive, no more lucenera resolvers).

## 2.0.45
### Upstream
- Configuration changes (to be required in versions 2.1.x):
  * `[blacklist]` has been renamed to `[blocked_names]`
  * `[ip_blacklist]` has been renamed to `[blocked_ips]`
  * `[whitelist]` has been renamed to `[allowed_names]`
  * `generate-domains-blacklist.py` has been renamed to
    `generate-domains-blocklist.py`, and the configuration files have been
    renamed as well.
- `dnscrypt-proxy -resolve` has been completely revamped, and now requires
the configuration file to be accessible. It will send a query to an IP address
of the `dnscrypt-proxy` server by default. Sending queries to arbitrary
servers is also supported with the new `-resolve name,address` syntax.
- Relay lists can be set to `*` for automatic relay selection. When a wildcard
is used, either for the list of servers or relays, the proxy ensures that
relays and servers are on distinct networks.
- Lying resolvers are detected and reported.
- New return code: `NOT_READY` for queries received before the proxy has
been initialized.
- Server lists can't be older than a week any more, even if directory
permissions are incorrect and cache files cannot be written.
- macOS/arm64 is now officially supported.
- New feature: `allowed_ips`, to configure a set of IP addresses to
never block no matter what DNS name resolves to them.
- Hard-coded IP addresses can be immediately returned for test queries
sent by operating systems in order to check for connectivity and captive
portals. Such responses can be sent even before an interface is considered
as enabled by the operating system. This can be configured in a new section
called `[captive_portals]`.
- On Linux, OpenBSD and FreeBSD, `listen_addresses` can now include IP
addresses that haven't been assigned to an interface yet.
- The logo has been tweaked to look fine on a dark background.
- `generate-domains-blocklist.py`: regular expressions are now ignored in
time-based entries.
- Minor bug fixes and logging improvements.
- Cloaking plugin: if an entry has multiple IP addresses for a type,
all the IP addresses are now returned instead of a random one.
- Static entries can now include DNSCrypt relays.
- Name blocking: aliases relying on `SVCB` and `HTTPS` records can now
be blocked in addition to aliases via regular `CNAME` records.
- EDNS-Client-Subnet information can be added to outgoing queries.
Instead of sending the actual client IP, ECS information is user
configurable, and IP addresses will be randomly chosen for every query.
- Initial DoH queries are now checked using random names in order to
properly measure CDNs such as Tencent that ignore the padding.
- DoH: the `max-stale` cache control directive is now present in queries.
- Logs can now be sent to `/dev/stdout` instead of actual files.
- User switching is now supported on macOS.
- New download mirror (https://download.dnscrypt.net) for resolvers,
relays and parental-control.

### Added
- `allowed-ips.txt` and `blocked-ips.txt` files (as placeholder).
- Cleanup unneeded binary files after the installation.
- `acsacsar-ams-ipv4` resolver (Public non-censoring, non-logging, DNSSEC-capable, DNSCrypt-enabled DNS resolver hosted on Scaleway by [acsacsar](https://nitter.net/acsacsar)).
- `arvind-io` resolver (Public resolver by EnKrypt (https://arvind.io). Hosted in Bangalore, India. Non-logging, non-filtering, supports DNSSEC).
- `bcn-dnscrypt` resolver (Resolver in Barcelona, Spain. DNSCrypt protocol. Non-logging, non-filtering, DNSSEC).
- `d0wn-tz-ns1` resolver (Server provided by Martin 'd0wn' Albus) Hosted by Aptus Solutions Ltd. in Tanzania.
- `dnscrypt.be` resolver (Resolver in Leuven, Belgium (UCLL Campus Proximus). Non-logging/DNSSEC/Uncensored. https://dnscrypt.be
Maintained by Sigfried (https://sigfried.be) hosted by ISW Leuven (https://iswleuven.be)).
- `dnscrypt.ca-1` resolver (Free, Canadian, uncensored, no-logs, encrypted, and DNSSEC validated. DNS service for your pleasure).
- `dnscrypt.ca-2` resolver (Free, Canadian, uncensored, no-logs, encrypted, and DNSSEC validated. DNS service for your pleasure).
- `dnscrypt.one` resolver (Non-logging, non-censoring, DNSSEC-capable DNSCrypt resolver hosted in Germany (Nuremberg), https://dnscrypt.one).
- `dnscrypt.pl` resolver (Free | No filtering | Zero logs | DNSSEC | Poland | https://dnscrypt.pl/).
- `ev-canada` resolver (Non-logging, uncensored DNS resolver provided by evilvibes.com Location: Vancouver, Canada).
- `freetsa.org-ipv4` resolver (Non-logged/Uncensored provided by www.freetsa.org. Support for DNS and DNS-over-TLS (DoT)).
- `jp.tiar.app` resolver (Non-Logging, Non-Filtering DNSCrypt server in Japan. No ECS, Support DNSSEC).
- `moulticast-ca-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Canada | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-de-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Germany | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-fr-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in France | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-sg-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Singapore | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-uk-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in UK | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `plan9-ns1` resolver (Resolver in New Jersey, USA. DNSCrypt protocol. Non-logging, non-filtering, DNSSEC, anonymized. Running the official Docker image on Vultr by @jlongua1).
- `pwoss.org-dnscrypt` resolver (No filter | No logs | DNSSEC | Nuremberg, Germany (netcup) | Maintained by https://pwoss.org/ (Dan)).
- `sarpel-dns-istanbul` resolver (No-filter | No-logs | Uncensored | Hosted in Istanbul(Turkey) on Cloudeos).
- `serbica` resolver (Public DNSCrypt server in the Netherlands by https://litepay.ch).
- `ventricle.us` resolver (Public DNSCrypt resolver provided by Jacob Henner. Hosted by Digital Ocean, New York).

### Changed
- `Magisk 20.4+` required.
- Disabled `direct_cert_fallback` option to prevent direct connections through the resolvers for failed certificate retrieved via relay.
- Reduced the max. query waiting time from `1500` to `1000` ms.
- Renamed `blacklist.txt` into `blocked-names.txt`.
- Renamed `whitelist.txt` into `allowed-names.txt`.
- Optimized relays.

### Removed
- [Applied Privacy DNS](https://applied-privacy.net/privacy-policy/) and [NixNet DNS](https://nixnet.xyz/dns/) as fallback resolvers.
- `DROP` IPv6 queries script in `post-fs-data.sh` file.

## 2.0.44
### Upstream
- More updates to the set of block lists, thanks again to IceCodeNew.
- Netprobes and listening sockets are now ignored when the `-list`, `-list-all`, `-show-certs` or `-check` command-line switches are used.
- `tls_client_auth` was renamed to `doh_client_x509_auth`. A section with the previous name is temporarily ignored if empty, but will error out if not.
- Unit tests are now working on 32-bit systems. Thanks to Will Elwood and @lifenjoiner.

## 2.0.43
### Upstream
- Built-in support for DNS64 translation has been implemented. (Contributed by Sergey Smirnov, thanks!)
- Connections to DoH servers can be authenticated using TLS client certificates (Contributed by Kevin O'Sullivan, thanks!)
- Multiple stamps are now allowed for a single server in resolvers and relays lists.
- Android: the time zone for log files is now set to the system time zone.
- Quite a lot of updates and additions have been made to the example domain block lists. Thanks to `IceCodeNew`!
- Cached configuration files can now be temporarily used if they are out of date, but bootstraping is impossible. Contributed by
`lifenjoiner`, thanks!
- Precompiled macOS binaries are now notarized.
- `generate-domains-blacklists` now tries to deduplicate entries clobbered by wildcard rules. Thanks to `Huhni`!
- `generate-domains-blacklists` can now directly write lists to a file with the `-o` command-line option.
- cache files are now downloaded as the user the daemon will be running as. This fixes permission issues at startup time.
- Forwarded queries are now subject to global timeouts, and can be
forced to use TCP.
- The `ct` parameter has been removed from DoH queries, as Google doesn't require it any more.
- Service installation is now supported on FreeBSD.
- When stored into a file, service logs now only contain data from the most recent launch. This can be changed with the new `log_file_latest` option.

### Added
- [Applied Privacy DNS](https://applied-privacy.net/privacy-policy/) and [NixNet DNS](https://nixnet.xyz/dns/) as fallback resolvers.

### Changed
- `Magisk 20+` required.

## 2.0.42-3
### Added
- `DROP` properly IPv6 queries in `post-fs-data.sh` file (no more DNS leaks this time).

## 2.0.42-2
### Added
- 2nd attempt to `DROP` IPv6 queries in `post-fs-data.sh` file.

## 2.0.42-1
### Added
- 1st attempt to `DROP` IPv6 queries in `post-fs-data.sh` file.
- `whitelist.txt` file (as placeholder, once the blacklist goes public).
- `meganerd` resolver (Non-logging, non-filtering, supports DNSSEC by MegaNerd.nl).

### Changed
- Moved all the example documents into `dnscrypt-proxy/example-docs` folder (the remaining example documents must be deleted manually).
- Optimized relays.

### Removed
- `dnscrypt.nl-ns0` resolver.
- `dnscrypt.one` resolver.
- `ffmuc.net` resolver.
- `publicarray-au2` resolver.

## 2.0.42
### Upstream
- The current versions of the `dnsdist` load balancer (presumably used
by quad9, cleanbrowsing, qualityology, freetsa.org, ffmuc.net,
opennic-bongobow, sth-dnscrypt-se, ams-dnscrypt-nl and more)
is preventing queries over 1500 bytes from being received over UDP.
Temporary workarounds have been introduced to improve reliability
with these resolvers for regular DNSCrypt. Unfortunately, anonymized
DNS cannot be reliable until the issue is fixed server-side. `dnsdist`
authors are aware of it and are working on a fix.
- New option in the `[anonymized_dns]` section: `skip_incompatible`,
to ignore resolvers incompatible with Anonymized DNS instead of
using them without a relay.
- The server latency benchmark is faster while being able to perform
more retries if necessary.
- Continuous integration has been moved to GitHub Actions.

### Added
- Set `skip_incompatible` option from `false` to `true` to ignore servers incompatible with anonymization.

## 2.0.41
### Upstream
- Precompiled binaries for armv5, armv6 and armv7 are available.
The default arm builds were not compatible with older CPUs when
compiled with Go 1.14. mips64 binaries are explicitly compiled with
softfloat to improve compatibility.
- Quad9 seems to be only blocking fragmented queries over UDP for
some networks. They have been removed from the default list of broken
resolvers; runtime detection of support for fragments should now do
the job.
- Runtime detection of support for fragments was actually enabled.

## 2.0.40
### Upstream
- Servers blocking fragmented queries are now automatically detected.
- The server name is now only present in query logs when an actual upstream servers was required to resolve a query.
- TLS client authentication has been added for DoH.
- The Firefox plugin is now skipped for connections coming from the local DoH server.
- DoH RTT computation is now more accurate, especially when CDNs are in the middle.
- The forwarding plugin is now more reliable, and handles retries over TCP.

## 2.0.39-2
### Removed
- `blacklist.txt` file (too many false positives, will be added back in the future, when it reaches a more stable level).

## 2.0.39-1
### Added
- Automatic redirection in `post-fs-data.sh` file. (no more 3rd-party apps are required to start the service).
- Substrings and wildcards into `blacklist.txt` file and updated to `2020.03.19`.

### Removed
- `ibksturm` resolver.
- `dnswarden-dc1`, `dnswarden-dc2`, `dnswarden-dc3`, resolvers.

## 2.0.39
### Upstream
- The Firefox Local DoH service didn't properly work in version 2.0.38; 
this has been fixed. Thanks to Simon Brand for the report!

## 2.0.38
### Upstream
- Entries from lists (forwarding, blacklists, whitelists) now support
inline comments.
- Reliability improvement: queries over UDP are retried after a timeout
instead of solely relying on the client.
- Reliability improvement: during temporary network outages, cached records
are now served even if they are stale.
- Bug fix: SOCKS proxies and DNS relays can be combined.
- New feature: multiple fallback resolvers are now supported (see the
new `fallback_resolvers` option. Note that `fallback_resolver` is
still supported for backward compatibility).
- Windows: the service can be installed with a configuration file
stored separately from the application.
- Security (affecting DoH): precompiled binaries of `dnscrypt-proxy 2.0.37` are
built using `Go 1.13.7` that fixes a TLS certificate parsing issue present in
previous versions of the compiler.

### Added
- `dnswarden-dc3` (DnsCrypt protocol . Non-logging, supports DNSSEC. By https://dnswarden.com).

### Changed
- `Magisk 19+` required.
- Updated `blacklist.txt` to `2020.01.30`.

### Fixed
- `dnscrypt-proxy` service doesn't detect the config file.

## 2.0.36
### Upstream
- New option: `block_undelegated`. When enabled, `dnscrypt-proxy` will
directly respond to queries for locally-served zones (https://sk.tl/2QqB971U)
and nonexistent zones that should have been kept local, but are frequently
leaked. This reduces latency and improves privacy.
- Conformance: the `DO` bit is now set in synthetic responses if it was
set in a question, and the `AD` bit is cleared.
- The `miegkg/dns` module was updated to version 1.1.26, that fixes a
security issue affecting non-encrypted/non-authenticated DNS traffic. In
`dnscrypt-proxy`, this only affects the forwarding feature.

### Added
- `dnscrypt.one` resolver (DNSSEC / no logs / uncensored, Germany (Nuremberg), https://dnscrypt.one/).

### Changed
- Updated `blacklist.txt` to `2019.12.22`.
- Optimized relays.

## 2.0.35
### Upstream
- New option: `block_unqualified` to block `A`/`AAAA` queries with
unqualified host names. These will very rarely get an answer from upstream
resolvers, but can leak private information to these, as well as to root
servers.
- When a `CNAME` pointer is blocked, the original query name is now logged
along with the pointer. This makes it easier to know what the original
query name, so it can be whitelisted, or what the pointer was, so it
can be removed from the blacklist.

### Added
- `scaleway-ams` resolver (DNSSEC/Non-logged/Uncensored in Amsterdam- ARM server donated by Scaleway.com) Maintained by Frank Denis- https://fr.dnscrypt.info).
- `ffmuc.net` resolver (An open DNSCrypt resolver operated by Freifunk Munich with nodes in DE. https://ffmuc.net/).

### Changed
- Updated `blacklist.txt` to `2019.12.09`.
- Optimized relays.

### Fixed
- Backup an existing `.toml` file before proceed with the installation.

## 2.0.34
### Upstream
- Blacklisted names are now also blocked if they appear in `CNAME`
pointers.
- `dnscrypt-proxy` can now act as a local DoH *server*. Firefox can
be configured to use it, so that ESNI can be enabled without bypassing
your DNS proxy.

### Added
- `ibksturm`- dnscrypt-server (nginx- encrypted-dns- unbound backend), DNSSEC / Non-Logged / Uncensored, OpenNIC and Root DNS-Zone- Hosted in Switzerland by ibksturm, aka Andreas Ziegler).
- `blacklist.txt` file to prevent `CNAME Cloaking` tracking feature.

### Changed
- Optimized relays.

### Removed
- `charis` and `suami` resolvers.

## 2.0.33
### Upstream
- Fixes an issue that caused some valid queries to return `PARSE_ERROR`.
- On certificate errors, the server name is now logged instead of the
provider name, which is generally more useful.
- IP addresses for DoH servers that require DNS lookups are now cached
for at least 12 hours.
- `ignore_system_dns` is now set to `true` by default.
- A workaround for a bug in Cisco servers has been implemented.
- A corrupted or incomplete resolvers list is now ignored, keeping the
last good known cached list until the next update. In addition, logging was
improved and unit tests were also added. Awesome contribution from William
Elwood, thanks!
- On Windows, the network probe immediately returned instead of blocking
if `netprobe_timeout` was set to `-1`. This has been fixed.
- Expired cached IP addresses now have a grace period, to avoid breaking the
service if they temporarily can't be refreshed.
- On Windows, the service now returns immediately, solving a long-standing
issue when initialization took more than 30 seconds ("The service did not
respond to the start or control request in a timely fashion"). Fantastic
work by Alison Winters, thanks!
- The `SERVER_ERROR` error code has been split into two new error codes:
`NETWORK_ERROR` (self-explanatory) and `SERVFAIL` (a response was returned,
but it includes a `SERVFAIL` error code).
- Responses are now always compressed.

### Added
- `v.dnscrypt.uk-ipv4` (DNSCrypt v2, no logs, uncensored, DNSSEC. Hosted in London UK on Vultr- https://www.dnscrypt.uk).
- Optimized relays (set to use other providers different from the main one).

## 2.0.31
### Upstream
- This version fixes a startup issue introduced in version 2.0.29, on systems for which the service cannot be automatically installed (such as OpenBSD and FreeBSD). Reported by @5ch17 and Vinícius Zavam, and fixed by Will Elwood, thanks!
- This version fixes two regressions introduced in version 2.0.29: DoH server couldn't be reached over IPv6 any more, and the proxy couldn't be interrupted while servers were being benchmarked.

### Changed
- Another way to backup an existing `.toml` file (the old configuration is now backed up with `year-month-day-hour-minute.bak` suffix, thanks to @lindroidux).

## 2.0.29
### Upstream
- Support for Anonymized DNS has been added!
- Wait before stopping, fixing an issue with Unbound (thanks to Vladimir Bauer)
- DNS stamps are now included in the `-list-all-json` ouptut
- The `netprobe_timeout` setting from the configuration file or command-line was ignored. This has been fixed.
- The TTL or cloaked entries can now be adjusted (thanks to Markus Linnala)
- Cached IP address from DoH servers now expire (thanks to Markus Linnala)
- DNSCrypt certificates can be fetched over Tor and SOCKS proxies
- Retries over TCP are faster
- Improved logging (thanks to Alison Winters)
- Ignore non-TXT records in certificate responses (thanks to Vladimir Bauer)
- A lot of internal cleanups, thanks to Markus Linnala

### Added
- `publicarray-au` resolver Australia (DNSSEC/OpenNIC/Non-logging/Uncensored- hosted on vultr.com maintained by publicarray- https://dns.seby.io).
- `publicarray-au2` resolver Australia (DNSSEC/OpenNIC/Non-logging/Uncensored- hosted on ovh.com.au maintained by publicarray- https://dns.seby.io).

### Changed
- Optimized relays.

## 2.0.29-beta.3
### Upstream
- Support for Anonymized DNSCrypt has been added.
- Latency with large responses has actually been reduced.
- DNSCrypt certificates can now be retrieved over Tor, proxies, and DNS relays.
- Improved server error reporting (thanks to Alison Winters)
- Quite a lot of internal improvements and bug fixes have been made, thanks to Markus Linnala.
- Improved logging
- Added a workaround for DNS servers using a non-standard provider name.

### Added
- `anonymized_dns` feature (each resolver has 2 relays assigned).
- `scaleway-fr` resolver (DNSSEC/Non-logging/Uncensored- Maintained by Frank Denis- https://fr.dnscrypt.info).

## 2.0.28
### Upstream
- Invalid server entries are now skipped instead of preventing a source from being used. Thanks to Alison Winters for the contribution!
- Truncated responses are immediately retried over TCP instead of waiting for the client to retry. This reduces the latency for large responses.
- Responses sent to the local network are assumed to support at least 1252 bytes packets, and use optional information from EDNS up to 4096 bytes. This also reduces latency.
- Logging improvements: servers are not logged for cached, synthetic and cloaked responses. And the forwarder is logged instead of the regular server for forwarded responses.

## 2.0.27
### Upstream
- The X25519 implementation was changed from using the Go standard implementation to using Cloudflare's CIRCL library. Unfortunately, CIRCL appears to be broken on big-endian systems. That change has been reverted.
- All the dependencies have been updated.

### Changed
- New project mantainer, [@quindecim](https://github.com/quindecim) :)
___

#### v2.8.7 ([@bluemeda](https://github.com/bluemeda))
- Changed path of configuration file [dnscrypt.toml] from /system/etc/ to /data/media/0/ [or /sdcard]
- Updated binary & configuration files to 2.0.25
- Removed automatic redirection of dns-request and let dnscrypt-proxy do its job only.

#### v2.8.5 ([@bluemeda](https://github.com/bluemeda))
- Fix #40

#### v2.8.4 ([@bluemeda](https://github.com/bluemeda))
- Fix failed to copy or backup config file

#### v2.8.3 ([@bluemeda](https://github.com/bluemeda))
- Fix permission issue
- Add option to replace or backup-restore config file

#### v2.8.2 ([@bluemeda](https://github.com/bluemeda))
- Fix "binary file is missing"

#### v2.8.7 ([@bluemeda](https://github.com/bluemeda))
- Update Magisk 18100 requirements

#### v2.8.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files 2.0.22

#### v2.7.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files 2.0.21

#### v2.6.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files to 2.0.19

#### v2.5.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files to 2.0.16
- add exception for cloudflare fallback resolver.

#### v2.4.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files to 2.0.14

#### v2.3.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files to 2.0.10
- Add option to choose auto redirect DNS or manually set with 3rd-party app.

#### v2.2.0 ([@bluemeda](https://github.com/bluemeda))
- Update binary files to 2.0.8

#### v2.1.3 ([@bluemeda](https://github.com/bluemeda))
- If you have previous version, please uninstall it first then reinstall it again or you can change listen port manually in dnscrypt-proxy.toml file.
- Fix Tethering Client cannot Resolve DNSCrypt
- Fix Chromecast devices not showing jedisct1/dnscrypt-proxy#226
- Add binary files for x86 and x86_64 (test)

#### v2.1.2 ([@bluemeda](https://github.com/bluemeda))
- Bug Fixes

#### v2.1.1 ([@bluemeda](https://github.com/bluemeda))
- Bug fixes

#### v2.1 ([@bluemeda](https://github.com/bluemeda))
- Bug fixes

#### v2.0 ([@bluemeda](https://github.com/bluemeda))
- Resolve download.dnscrypt.info first before executing iptable
- Don't override dnscrypt-proxy.toml if exist
- Update binary files to v2.0.6

#### v1.1 ([@bluemeda](https://github.com/bluemeda))
- Change listen port to 5353 (avoid conflict while tethering)

#### v1.0 ([@bluemeda](https://github.com/bluemeda))
- Initial release
- dnscrypt-proxy v2.0.5
