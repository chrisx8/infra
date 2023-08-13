# Ansible Role: `cx_base_el`

This role provides the base configuration and software for a standard RHEL-like system. It should be run on all standardized RHEL-like systems, including LXC containers and VMs.

## Role variables

None

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- RHEL 9, including its derivatives.
