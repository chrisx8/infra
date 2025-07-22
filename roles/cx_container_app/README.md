# Ansible Role: `cx_container_app`

This role is a generic role for setting up rootless container apps.

## Role variables

| Variable                           | Description                                                                   | Required |
| ---------------------------------- | ----------------------------------------------------------------------------- | -------- |
| `cx_container_app_image`           | Container image name                                                          | **Yes**  |
| `cx_container_app_user`            | Username or UID of the user which Podman will run as                          | **Yes**  |
| `cx_container_app_name`            | Name of the container, default `{{ inventory_hostname_short }}`               | No       |
| `cx_container_app_network`         | Name of container network, default `podman`                                   | No       |
| `cx_container_app_options`         | Extra options for the container, will be injected into container Quadlet file | No       |
| `cx_container_app_volumes`         | List of container volumes to be created                                       | No       |
| `cx_container_app_state`           | State of application, `present` or `absent`. Default `present`.               | No       |

[defaults/main.yml](defaults/main.yml) for more information on usage.

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

EL 8 or newer
