# Ansible Role: `cx_k8s_app`

This role is a generic role for deploying workflows to Kubernetes clusters.

## Role variables

| Variable                   | Description                                                            | Required |
| -------------------------- | ---------------------------------------------------------------------- | -------- |
| `cx_k8s_app_k8s_context`   | Name of target Context in local kubeconfig                             | **Yes**  |
| `cx_k8s_app_k8s_namespace` | Kubernetes namespace to deploy to, will be created if it doesn't exist | **Yes**  |
| `cx_k8s_app_helm_release`  | Helm release definition, noop if not defined                           | No       |
| `cx_k8s_app_manifests`     | List of URLs of Kubernetes manifests, noop if not defined              | No       |
| `cx_k8s_app_resources`     | List of Kubernetes resource definitions, noop if not defined           | No       |
| `cx_k8s_app_state`         | State of k8s resources, `present` or `absent`. Default `present`.      | No       |

`cx_k8s_app_helm_release` keys:

| Key              | Description                                                   | Required                               |
| ---------------- | ------------------------------------------------------------- | -------------------------------------- |
| `chart_ref`      | Chart reference: repo chart name, OCI URL, local path, or URL | **Yes**                                |
| `chart_version`  | Pinned chart version                                          | **Yes**                                |
| `chart_repo_url` | Chart repository URL. Omit for OCI references and local paths | No                                     |
| `name`           | Helm release name                                             | No, default `inventory_hostname_short` |
| `skip_crds`      | Skip installing the CRDs bundled in the chart                 | No, default `false`                    |
| `values`         | Chart values, passed to the release as-is                     | No                                     |

Other than creating the namespace, this role performs no action if none of `cx_k8s_app_helm_release`, `cx_k8s_app_manifests`, or `cx_k8s_app_resources` is defined.

Important notes:

- Set `cx_k8s_app_helm_release.name` when the release name has to differ from the host's short name. This is only needed to keep instances distinguishable.
- Set `skip_crds: true` when another release manages the chart's CRDs.

Sample: [vars/sample.yml](vars/sample.yml)

## Required facts

None

## System requirements

This role executes on the Ansible controller and deploys resources using the Kubernetes REST API. The Ansible controller host must have a valid kubeconfig, [`kubernetes` Python package](https://pypi.org/project/kubernetes/), and [Helm](https://helm.sh).
