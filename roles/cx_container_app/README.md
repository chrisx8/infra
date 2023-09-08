# Ansible Role: `cx_container_app`

This role is a generic role for setting up rootless container apps.

## Role variables

| Variable                                 | Description                                                           | Required             |
| ---------------------------------------- | --------------------------------------------------------------------- | -------------------- |
| `cx_container_app_spec`                  | Container specification[^1][^2][^3]. `name` and `image` are required. | **Yes**              |
| `cx_container_app_backup_ping_url`       | Healthchecks.io ping URL for nightly volume backup job                | No                   |
| `cx_container_app_network`               | Container network to be created, must not be `host` or `podman`       | No                   |
| `cx_container_app_postgres_db`           | Name of the PostgreSQL database/user to be created[^4]                | No                   |
| `cx_container_app_pretask_from`          | Optional pre-tasks, see [`defaults/main.yml`](defaults/main.yml)      | No                   |
| `cx_container_app_socket_listen_streams` | Listen addresses for systemd socket activation[^5]                    | No                   |
| `cx_container_app_user`                  | Username or UID of the user which Podman will run as                  | No, default `podman` |
| `cx_container_app_volumes`               | List of container volumes to be created                               | No                   |

Sample: [vars/sample.yml](vars/sample.yml)

[^1]: See <https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html#parameters>
[^2]: Some defaults are declared for all containers, see [`defaults/main.yml`](defaults/main.yml).
[^3]: You may use `{{ _container_user }}`, which is the return from `ansible.builtin.user`, in `cx_container_app_spec`.
[^4]: A PostgreSQL server must exist on the host.
[^5]: <https://www.freedesktop.org/software/systemd/man/latest/systemd.socket.html#ListenStream=>

## Required facts

| Fact                  | Purpose                      |
| --------------------- | ---------------------------- |
| `distribution`        | Checking system requirements |
| `virtualization_type` | Checking system requirements |

## System requirements

- RHEL 8 or newer, including its derivatives.
- LXC containers are not supported.
