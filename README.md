# Platform CI/CD Toolkit

Production-oriented reusable CI/CD and Platform Engineering delivery workflows for GitHub Actions and GitLab CI.

## Capabilities

- Reusable GitHub Actions workflows
- Reusable GitLab CI components
- Docker Buildx
- Immutable image publishing
- Vulnerability scanning
- Secret scanning
- SBOM generation
- Cosign keyless signing
- Provenance attestations
- Kubernetes delivery
- Automatic rollback
- Canary deployment
- Blue-green traffic switching
- Helm atomic releases
- Multi-environment promotion
- GitOps delivery
- Kustomize overlays
- Argo CD patterns
- Artifact management
- Release automation
- Executable workflow contract tests
- Kubernetes schema validation
- Helm validation
- ShellCheck
- Actionlint
- Immutable GitHub Action pinning

## Architecture

See `docs/architecture.md`.

## Reusable Workflows

- reusable-docker-build.yml
- reusable-container-security.yml
- reusable-supply-chain-security.yml
- reusable-kubernetes-deploy.yml
- reusable-kubernetes-canary.yml
- reusable-kubernetes-blue-green.yml
- reusable-helm-release.yml
- reusable-environment-promotion.yml
- reusable-gitops-promotion.yml
- reusable-artifact-management.yml
- reusable-release.yml
- reusable-platform-delivery.yml

## Delivery Strategies

### Standard Kubernetes Delivery

Validated rollout with immutable images and rollback support.

### Canary

Deploys and validates the canary workload before promotion.

### Blue-Green

Deploys the inactive color, validates it, switches Kubernetes Service traffic, verifies routing, and restores previous traffic on failure.

### Helm

Provides atomic Helm upgrades, validation, history management, and rollback.

### GitOps

Updates immutable desired state through Kustomize overlays for development, staging, and production.

## Security

Security controls include:

- immutable image digests
- pinned GitHub Actions
- vulnerability gates
- secret scanning
- SBOM generation
- keyless signing
- OIDC
- provenance attestations
- hardened Kubernetes workload examples

See `SECURITY.md`.

## Validation

Repository CI validates:

- workflow syntax
- immutable Action references
- YAML
- shell scripts
- Helm
- Kubernetes schemas
- GitOps overlays
- reusable workflow runtime contracts

## Repository Structure

.github/workflows/
examples/github-actions/
examples/gitlab-ci/
templates/kubernetes/
templates/helm/
templates/gitops/
templates/gitlab-ci/
tests/
docs/

## License

MIT
