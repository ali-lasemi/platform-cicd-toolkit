# Contributing

## Workflow Requirements

Reusable workflows should:

1. expose explicit inputs
2. expose useful outputs
3. minimize permissions
4. use immutable production artifacts
5. use deployment concurrency controls
6. verify state after mutation
7. provide rollback where possible
8. avoid hidden environment assumptions

## Validation

Repository CI validates:

- GitHub Actions
- immutable Action references
- YAML
- shell scripts
- Helm charts
- Kubernetes manifests
- GitOps overlays
- reusable workflow contracts

## Security

Do not commit credentials, kubeconfigs, tokens, private keys, or registry passwords.
