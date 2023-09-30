# Ansible Role: `cx_container_runtime`

This role sets up the system for running Podman containers.

## Role variables

| Variable                          | Description                                              | Required             |
| --------------------------------- | -------------------------------------------------------- | -------------------- |
| `cx_container_runtime_port_start` | Minimum port number that supports unprivileged port bind | No, default `80`     |
| `cx_container_runtime_user`       | User to run containers as                                | No, default `podman` |

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- RHEL 8 or newer, including its derivatives.
- LXC containers are not supported.
