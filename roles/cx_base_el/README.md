# Ansible Role: `cx_base_el`

This role provides the base configuration and software for a standardized Enterprise Linux (EL) system.

## Role variables

| Variable                        | Description                                                                                                       | Required            |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------- |
| `cx_base_el_network_interfaces` | NetworkManager connections keyed by interface name, see [NetworkManager connections](#networkmanager-connections) | No                  |
| `cx_base_el_nvidia_version`     | Version of NVIDIA CUDA driver to install, e.g. "580.126.20"                                                       | No                  |
| `cx_base_el_skip_reboot`        | Skip system reboot after setup completes                                                                          | No, default `false` |
| `cx_base_el_timezone`           | System timezone in TZ identifier[^1]                                                                              | No, default `UTC`   |

[^1]: [List of TZ database timezones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

### NetworkManager connections

`cx_base_el_network_interfaces` manages NetworkManager connections, with these requirements:

- Each mapping key is used as both the connection name and interface name.
- Every entry must define `type`, all other fields are passed directly to [`community.general.nmcli`][https://docs.ansible.com/ansible/latest/collections/community/general/nmcli_module.html].
- Every entry must **not** define `conn_name`, `conn_reload`, `ifname`, or `state`.
- The role writes and reloads connections without activating them.

Example:

```yaml
cx_base_el_network_interfaces:
  ens3:
    type: ethernet
    ip4:
      - 192.168.1.10/24
    gw4: 192.168.1.1
    dns4:
      - 192.168.1.53
    ip6:
      - fdee:db8::10/64
    gw6: fdee:db8::1
    dns6:
      - fdee:db8::53
```

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_role` | Checking system requirements |

## System requirements

EL 9 or 10
