# Ansible Role: `cx_fortigate`

This role manages various config objects on Fortinet FortiGate firewalls via the FortiOS REST API, executing over the `httpapi` connection plugin.

Covered config objects:

- DHCP address reservations
- SD-WAN health checks

## Role variables

| Variable                           | Description                                                                                                               | Required           |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `ansible_httpapi_session_key`      | REST API admin token, under `ansible_httpapi_session_key.access_token`                                                    | **Yes**            |
| `ansible_httpapi_port`             | Port number for the FortiOS API                                                                                           | No, default `443`  |
| `ansible_httpapi_use_ssl`          | Use HTTPS to connect to FortiOS REST API                                                                                  | No, default `true` |
| `cx_fortigate_dhcp_reservations`   | DHCP reservations keyed by interface name, each entry has fields `description`, `mac`, `ip`. Unlisted entries are removed | No                 |
| `cx_fortigate_quiet_assert`        | Suppress passing assert output. Defaults to quiet unless verbosity is 2 or higher                                         | No                 |
| `cx_fortigate_sdwan_health_checks` | SD-WAN health check entries using `fortios_system_sdwan` `health_check` fields[^1]. Unlisted entries are removed          | No                 |
| `cx_fortigate_vdom`                | FortiOS virtual domain to manage                                                                                          | No, default `root` |

Sample: [vars/sample.yml](vars/sample.yml)

Important note:

- The DHCP server itself (interface binding, lease ranges, gateway, DNS) is managed outside Ansible and must already exist for each interface.
- SD-WAN itself (status, zones, member interfaces) is likewise managed outside Ansible and must already be configured.
- An interface key set to an empty list **removes all reservations on that interface**. Omit the key entirely to leave an interface unmanaged.
- The health check list is fully replaced on every run, and changed reporting relies on FortiOS revision detection.

[^1]: [`fortinet.fortios.fortios_system_sdwan` `health_check` fields](https://docs.ansible.com/projects/ansible/latest/collections/fortinet/fortios/fortios_system_sdwan_module.html#parameter-system_sdwan/health_check)

## Required facts

None

## System requirements

- FortiOS 6.4 or newer
- Reachable over HTTPS, using a REST API admin token
