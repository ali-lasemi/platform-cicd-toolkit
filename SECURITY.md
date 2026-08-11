# Security Policy

## Security Principles

This repository follows:

- least privilege
- immutable production artifacts
- pinned third-party GitHub Actions
- fail-closed security gates
- workload identity where possible
- auditable promotion
- deployment concurrency controls
- rollback capability

## Secrets

Never commit:

- kubeconfigs
- private keys
- cloud credentials
- registry passwords
- access tokens

Use CI/CD encrypted secrets.

## GitHub Actions

Third-party GitHub Actions must use full immutable commit SHAs.

Mutable references such as version tags, main, or master are rejected by repository validation.

## Container Integrity

Production delivery workflows require immutable sha256 image references.

Container tags alone are not considered sufficient production artifact identity.

## Vulnerability Reporting

Do not create a public issue for vulnerabilities involving credentials or exploitable workflow behavior.

Use GitHub private vulnerability reporting when available.
