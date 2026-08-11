# Architecture

## Overview

Platform CI/CD Toolkit is a production-oriented collection of reusable CI/CD and platform delivery workflows.

The repository focuses on four layers:

1. Build and artifact production
2. Security and software supply chain
3. Deployment and progressive delivery
4. GitOps and environment promotion

## Delivery Flow

Source
-> Docker Build
-> Immutable Image
-> Security Validation
-> Supply Chain Validation
-> Deployment Strategy
-> Environment Promotion

## Build

The reusable Docker workflow provides:

- Docker Buildx
- multi-platform builds
- build cache
- immutable SHA tagging
- image digest outputs
- provenance support

## Security

Container security includes:

- Trivy vulnerability scanning
- Gitleaks secret scanning
- SPDX SBOM generation
- configurable severity gates

Supply-chain controls include:

- immutable image digests
- Cosign keyless signing
- GitHub OIDC
- signature verification
- provenance attestations
- immutable GitHub Action references

## Kubernetes Delivery

Supported Kubernetes delivery patterns include:

- standard rollout
- automatic rollback
- canary deployment
- blue-green deployment
- atomic Service traffic switching
- rollout health validation

## Helm

The Helm workflow provides:

- dependency updates
- chart linting
- manifest rendering
- server-side validation
- atomic upgrades
- revision history
- rollback support

## GitOps

GitOps delivery uses:

- Kustomize
- development overlays
- staging overlays
- production overlays
- immutable image digests
- auditable Git commits
- Argo CD reconciliation examples

## Environment Promotion

Promotion is sequential:

development -> staging -> production

Production promotion requires immutable image digests and deployment verification.

## Validation

Repository validation includes:

- repository integrity checks
- Actionlint
- immutable GitHub Action enforcement
- YAML validation
- ShellCheck
- Helm validation
- Kubernetes schema validation
- Kustomize rendering
- executable reusable workflow contract tests

## Failure Model

Delivery workflows fail closed.

Deployment is blocked when:

- an image is not immutable
- vulnerability gates fail
- rollout verification fails
- required replicas are unavailable
- deployed image verification fails
- health checks fail
- Service endpoints are missing
- Kubernetes manifests are invalid

Rollback is attempted when previous runtime state is available.
