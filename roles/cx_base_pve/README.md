# Ansible Role: `cx_base_pve`

This role provides base configuration. Similar to `cx_base_el`, it should be run on all Proxmox systems.

## Role variables

None

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_role` | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

Proxmox VE
