# Delivery Templates

Production-oriented deployment and delivery templates used throughout Platform CI/CD Toolkit.

## Kubernetes

`kubernetes/`

Contains hardened Kubernetes patterns for:

- standard deployments
- Canary delivery
- Blue-Green delivery

## Helm

`helm/`

Contains the application Helm chart used by reusable Helm release workflows and validation pipelines.

## GitOps

`gitops/`

Contains:

- Kustomize base manifests
- development overlay
- staging overlay
- production overlay
- Argo CD Application example

## Argo Rollouts

`argo-rollouts/`

Contains progressive delivery manifests using Argo Rollouts.

## GitLab CI

`gitlab-ci/`

Contains reusable GitLab CI components for:

- container builds
- container security
- Kubernetes delivery
- rollback
