# Ansible Role: `cx_base_el`

This role provides the base configuration and software for a standardized Enterprise Linux (EL) system.

## Role variables

| Variable                 | Description                              | Required            |
| ------------------------ | ---------------------------------------- | ------------------- |
| `cx_base_el_skip_reboot` | Skip system reboot after setup completes | No, default `false` |
| `cx_base_el_timezone`    | System timezone in TZ identifier[^1]     | No, default `UTC`   |

[^1]: [List of TZ database timezones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_role` | Checking system requirements |

## System requirements

EL 9
