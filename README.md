# Platform CI/CD Toolkit

[![Validate Repository](https://github.com/ali-lasemi/platform-cicd-toolkit/actions/workflows/validate.yml/badge.svg)](https://github.com/ali-lasemi/platform-cicd-toolkit/actions/workflows/validate.yml)
[![Workflow Contract Tests](https://github.com/ali-lasemi/platform-cicd-toolkit/actions/workflows/contract-tests.yml/badge.svg)](https://github.com/ali-lasemi/platform-cicd-toolkit/actions/workflows/contract-tests.yml)
[![Release](https://img.shields.io/github/v/release/ali-lasemi/platform-cicd-toolkit)](https://github.com/ali-lasemi/platform-cicd-toolkit/releases)
[![License](https://img.shields.io/github/license/ali-lasemi/platform-cicd-toolkit)](LICENSE)

Production-grade reusable CI/CD, GitOps, progressive delivery, and software supply-chain workflows for Platform Engineering teams.

This toolkit provides reusable delivery primitives for GitHub Actions and GitLab CI so engineering teams can standardize secure software delivery without duplicating pipeline logic across repositories.

## Core Capabilities

### CI/CD

- Reusable GitHub Actions workflows
- Reusable GitLab CI components
- Docker Buildx
- BuildKit caching
- Immutable SHA and digest-based delivery
- Deterministic artifact management
- Release automation

### Kubernetes Delivery

- Verified Kubernetes deployments
- Automatic rollback
- Canary delivery
- Blue-Green traffic switching
- Argo Rollouts progressive delivery
- Helm atomic releases
- Rollout health validation
- Kubernetes schema validation

### GitOps

- Kustomize environment overlays
- Development, staging, and production promotion
- Argo CD reconciliation patterns
- Immutable GitOps image updates
- Auditable desired-state changes

### Security and Software Supply Chain

- Trivy vulnerability scanning
- Gitleaks secret detection
- SBOM generation
- Cosign keyless signing
- GitHub OIDC
- Provenance attestations
- Immutable GitHub Action pinning
- Least-privilege workflow permissions
- Conftest and Rego policy-as-code

### Cloud Delivery

- AWS EKS delivery
- GitHub Actions OIDC authentication
- AWS IAM role assumption without static credentials
- Kubernetes authorization validation
- Immutable image enforcement

## Delivery Architecture

    Source
      |
      v
    Reusable CI Build
    Docker / Buildx
      |
      v
    Immutable Artifact
    SHA / Image Digest
      |
      v
    Security & Supply Chain
    Trivy / Gitleaks / SBOM
    Cosign / OIDC / Provenance
      |
      v
    Policy Validation
    Conftest / Rego
      |
      +-------------------+-------------------+
      |                   |                   |
      v                   v                   v
    Kubernetes           Helm              Argo Rollouts
    Deployment           Release           Progressive Delivery
      |                   |                   |
      +-------------------+-------------------+
                          |
                          v
                    Environment Gates
                    Dev -> Stage -> Prod
                          |
                          v
                    GitOps Desired State
                    Kustomize / Argo CD

Detailed architecture: [docs/architecture.md](docs/architecture.md)

## Reusable GitHub Actions Workflows

| Workflow | Purpose |
|---|---|
| `reusable-docker-build.yml` | Build and publish immutable container images |
| `reusable-container-security.yml` | Vulnerability, secret, and SBOM validation |
| `reusable-supply-chain-security.yml` | Keyless signing and provenance attestations |
| `reusable-policy-validation.yml` | Kubernetes policy-as-code validation |
| `reusable-kubernetes-deploy.yml` | Verified Kubernetes rollout and rollback |
| `reusable-kubernetes-canary.yml` | Canary delivery |
| `reusable-kubernetes-blue-green.yml` | Blue-Green deployment and traffic switching |
| `reusable-argo-rollouts.yml` | Argo Rollouts progressive delivery |
| `reusable-helm-release.yml` | Atomic Helm releases |
| `reusable-environment-promotion.yml` | Ordered environment promotion |
| `reusable-gitops-promotion.yml` | GitOps desired-state promotion |
| `reusable-artifact-management.yml` | Deterministic artifact management |
| `reusable-release.yml` | GitHub release automation |
| `reusable-platform-delivery.yml` | End-to-end platform delivery |
| `reusable-aws-eks-delivery.yml` | AWS EKS delivery through GitHub OIDC |

## Progressive Delivery

### Canary

Deploys a candidate workload and validates rollout health before promotion.

### Blue-Green

Deploys the inactive environment first, validates it, switches Kubernetes Service traffic to the new color, and verifies the resulting route.

Traffic can be restored to the previous environment when verification fails.

### Argo Rollouts

Provides Kubernetes-native progressive delivery using Argo Rollouts with staged traffic progression, pause gates, rollout verification, promotion, and abort handling.

## Policy-as-Code

Kubernetes workloads are validated using Conftest and Rego.

Policies enforce production controls including:

- non-root containers
- read-only root filesystems
- privilege escalation disabled
- dropped Linux capabilities
- CPU and memory requests
- CPU and memory limits
- readiness probes
- liveness probes
- minimum replica requirements
- rejection of `latest` container tags

The repository includes compliant and intentionally non-compliant fixtures to validate policy behavior.

## Software Supply Chain

    Build
      -> Vulnerability Scan
      -> Secret Scan
      -> SBOM
      -> Immutable Digest
      -> Keyless Signing
      -> OIDC Identity Verification
      -> Provenance Attestation
      -> Deployment

Third-party GitHub Actions used by repository workflows are pinned to immutable commit SHAs.

## AWS EKS OIDC Delivery

The AWS EKS workflow uses GitHub OIDC instead of long-lived AWS access keys.

The workflow:

1. Requests a GitHub OIDC identity token
2. Assumes an AWS IAM role
3. Verifies AWS caller identity
4. Configures EKS access
5. Validates Kubernetes authorization
6. Deploys an immutable container image
7. Verifies rollout health
8. Rolls back on failure

## GitOps

Environment overlays are provided for:

- development
- staging
- production

Kustomize manages desired-state composition while Argo CD provides reconciliation patterns.

## GitLab CI

Reusable GitLab CI components cover:

- container builds
- immutable image publishing
- vulnerability validation
- Kubernetes delivery
- deployment serialization
- rollback

See [examples/gitlab-ci](examples/gitlab-ci).

## Validation

Repository CI validates:

- repository integrity
- GitHub Actions syntax
- immutable GitHub Action references
- YAML syntax
- shell scripts
- Helm charts
- Kubernetes schemas
- Kustomize overlays
- GitOps manifests
- Kubernetes policies
- reusable workflow runtime contracts

## Repository Structure

    .github/
      workflows/
      ISSUE_TEMPLATE/

    docs/
      architecture.md

    examples/
      github-actions/
      gitlab-ci/

    policies/
      kubernetes/

    templates/
      kubernetes/
      helm/
      gitops/
      gitlab-ci/
      argo-rollouts/

    tests/
      fixtures/
      policy/


## Production Readiness

This repository enforces production-oriented delivery controls including:

- immutable container references
- reusable workflow contracts
- least-privilege GitHub Actions permissions
- pinned third-party Actions
- vulnerability and secret scanning
- SBOM and provenance generation
- policy-as-code validation
- rollout health verification
- rollback paths
- progressive delivery
- GitOps environment promotion
- cloud OIDC authentication

The current production baseline is released as `v1.0.0`.
## Repository Governance

The repository includes:

- CODEOWNERS
- Dependabot
- pull request templates
- structured issue forms
- security reporting guidance
- contribution requirements
- immutable third-party Action enforcement
- executable workflow contract tests

## Release

Current production baseline: **v1.0.0**

See [Releases](https://github.com/ali-lasemi/platform-cicd-toolkit/releases).

## Security

See [SECURITY.md](SECURITY.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Roadmap

See [ROADMAP.md](ROADMAP.md).

## License

MIT

