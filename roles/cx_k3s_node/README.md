# Ansible Role: `cx_k3s_node`

This role sets up a [k3s](https://k3s.io/) node. Supports both `server` (Kubernetes controller) and `agent` (Kubernetes worker) nodes.

## Role variables

See [`defaults/main.yml`](defaults/main.yml) for default vales.

| Variable                           | Description                                                                     | Required        |
| ---------------------------------- | ------------------------------------------------------------------------------- | --------------- |
| `cx_k3s_node_role`                 | Role of the k3s node, `server` or `agent`                                       | **Yes**         |
| `cx_k3s_node_cert_manager_version` | [cert-manager](https://cert-manager.io/) version                                | No, has default |
| `cx_k3s_node_csi_nfs_version`      | [NFS CSI Driver](https://github.com/kubernetes-csi/csi-driver-nfs) version      | No, has default |
| `cx_k3s_node_k3s_channel`          | k3s release channel, see https://github.com/k3s-io/k3s/blob/master/channel.yaml | No, has default |
| `cx_k3s_node_agent_args`           | Flags for launching k3s agent, `agent` will be prefixed                         | No              |
| `cx_k3s_node_server_args`          | Flags for launching k3s agent, `server` will be prefixed                        | No              |

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

EL 8 or newer
