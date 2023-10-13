# Ansible Role: `cx_base_pve`

This role provides base configuration. Similar to `cx_base_el`, it should be run on all Proxmox systems.

## Role variables

| Variable                | Description                                            | Required |
| ----------------------- | ------------------------------------------------------ | -------- |
| `cx_base_pve_cert_name` | Common Name (CN) of SSL certificate managed by Certbot | **Yes**  |

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_role` | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- Proxmox VE 9
