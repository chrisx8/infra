# Ansible Role: `cx_base_el`

This role provides the base configuration and software for a standard RHEL-like system. It should be run on all standardized RHEL-like systems, including LXC containers and VMs.

## Role variables

| Variable              | Description                          | Required          |
| --------------------- | ------------------------------------ | ----------------- |
| `cx_base_el_timezone` | System timezone in TZ identifier[^1] | No, default `UTC` |

[^1]: [List of TZ database timezones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- RHEL 9, including its derivatives.
