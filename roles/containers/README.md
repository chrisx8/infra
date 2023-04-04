# Ansible Role: `containers`

This role is a generic role for installing Podman and running rootless containers.

Role variables ([sample](vars/sample.yml)):

- `container_defaults` (default provided): Default values applied to all containers. To override, declare override values in individual container specs. See [defaults](defaults/main.yml).
- `container_specs` (**required**): Container specifications, see [`containers.podman.podman_container` docs](https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html#parameters).
- `container_user` (**required**): Username or UID of the user which Podman will run as. Must not be `root`.
- `container_volumes` (optional): Container volumes to be created. Provide list of volume names.

Required facts: `distribution`, `virtualization_type`

Supported OS: RHEL-like systems, version 8 or newer
