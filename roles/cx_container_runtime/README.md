# Ansible Role: `cx_container_runtime`

This role sets up the system for running Podman containers.

## Role variables

| Variable                          | Description                                              | Required |
| --------------------------------- | -------------------------------------------------------- | -------- |
| `cx_container_runtime_port_start` | Minimum port number that supports unprivileged port bind | No       |
| `cx_container_runtime_user`       | User to run containers as, default `podman`              | No       |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

EL 8 or newer
