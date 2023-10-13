# Ansible Role: `cx_cockpit_kvm`

This role installs [Cockpit](https://cockpit-project.org/) Web UI for managing virtual machines with QEMU + KVM.

## Role variables

| Variable                   | Description                                            | Required |
| -------------------------- | ------------------------------------------------------ | -------- |
| `cx_cockpit_kvm_cert_name` | Common Name (CN) of SSL certificate managed by Certbot | **Yes**  |

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- Bare-metal hosts.
- RHEL 8 or newer, including its derivatives.
