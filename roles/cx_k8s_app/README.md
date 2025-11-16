# Ansible Role: `cx_k8s_app`

This role is a generic role for deploying workflows to Kubernetes clusters.

## Role variables

| Variable                   | Description                                                            | Required |
| -------------------------- | ---------------------------------------------------------------------- | -------- |
| `cx_k8s_app_k8s_context`   | Name of target Context in local kubeconfig                             | **Yes**  |
| `cx_k8s_app_k8s_namespace` | Kubernetes namespace to deploy to, will be created if it doesn't exist | **Yes**  |
| `cx_k8s_app_helm_releases` | List of Helm release definitions, noop if not deployed                 | No       |
| `cx_k8s_app_manifests`     | List of URLs of Kubernetes manifests, noop if not defined              | No       |
| `cx_k8s_app_resources`     | List of Kubernetes resource definitions, noop if not defined           | No       |
| `cx_k8s_app_state`         | State of k8s resources, `present` or `absent`. Default `present`.      | No       |

This role performs no action if none of `cx_k8s_app_helm_releases`, `cx_k8s_app_manifests`, or `cx_k8s_app_resources` is defined.

Sample: [vars/sample.yml](vars/sample.yml)

## Required facts

None

## System requirements

This role executes on the Ansible controller and deploys resources using the Kubernetes REST API. The Ansible controller host must have a valid kubeconfig, [`kubernetes` Python package](https://pypi.org/project/kubernetes/), and [Helm](https://helm.sh).
