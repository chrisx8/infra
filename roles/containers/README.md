# Ansible Role: `containers`

This role is a generic role for installing Podman and containerized apps.

Required facts: `distribution`, `virtualization_type`

Role variables:

- `container_defaults` (default provided): Default values applied to all containers. To override, declare override values in individual container specs. See [defaults](defaults/main.yml).
- `container_network` (optional): Name of the network to be created.
- `container_specs` (**required**): Container specifications, see [`containers.podman.podman_container` docs](https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html#parameters).
- `container_volumes` (optional): Container volumes to be created. Provide list of dicts with `name`, `owner`, and `group`.
- See [sample](vars/sample.yml).

Supported OS: RHEL-like systems, version 8 or newer
