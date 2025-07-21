# Ansible Role: `cx_pihole`

This role installs and configures Pi-hole.

## Role variables

| Variable                         | Description                                                                                     | Required              |
| -------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------- |
| `cx_pihole_dns_1`                | Upstream DNS server #1                                                                          | No, default `1.1.1.1` |
| `cx_pihole_dns_2`                | Upstream DNS server #2                                                                          | No, default `1.0.0.1` |
| `cx_pihole_enable_query_logging` | Enable DNS query logging                                                                        | No, default `true`    |
| `cx_pihole_rdns_local_cidr`      | Local IP range[^1], rDNS queries for these addresses will be forwarded to the local rDNS server | No                    |
| `cx_pihole_rdns_local_domain`    | Search domain for local network                                                                 | No                    |
| `cx_pihole_rdns_server`          | Local rDNS server[^1]                                                                           | No                    |

[^1]: rDNS forwarding will only be enabled when both `cx_pihole_rdns_local_cidr` and `cx_pihole_rdns_server` are set.

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

CentOS Stream 8 or newer
