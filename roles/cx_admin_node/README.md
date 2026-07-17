# Ansible Role: `cx_admin_node`

This role deploys packages on Ansible infrastructure admin hosts.

## Role variables

| Variable                    | Description                                 | Required            |
| --------------------------- | ------------------------------------------- | ------------------- |
| `cx_admin_node_k8s_version` | Kubernetes version for kubectl installation | No, default `v1.36` |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

EL 9 or newer
