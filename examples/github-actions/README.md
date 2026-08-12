# GitHub Actions Examples

Production-oriented consumer examples for the reusable workflows provided by Platform CI/CD Toolkit.

## Available Examples

| Example | Capability |
|---|---|
| `docker-build.yml` | Container build and publishing |
| `container-security.yml` | Container security validation |
| `supply-chain-security.yml` | Signing and attestations |
| `policy-validation.yml` | Kubernetes policy-as-code |
| `kubernetes-delivery.yml` | Standard Kubernetes delivery |
| `kubernetes-canary.yml` | Canary deployment |
| `kubernetes-blue-green.yml` | Blue-Green deployment |
| `argo-rollouts.yml` | Argo Rollouts progressive delivery |
| `helm-release.yml` | Helm release automation |
| `environment-promotion.yml` | Environment promotion |
| `gitops-promotion.yml` | GitOps promotion |
| `artifact-management.yml` | Artifact management |
| `release.yml` | Release automation |
| `platform-delivery.yml` | End-to-end platform delivery |
| `aws-eks-delivery.yml` | AWS EKS delivery through GitHub OIDC |

## Production Usage

Production consumers should pin reusable workflows to a versioned release or immutable commit.

Example:

    jobs:
      delivery:
        uses: ali-lasemi/platform-cicd-toolkit/.github/workflows/reusable-platform-delivery.yml@v1.0.0

Consumers are responsible for configuring environment protection rules, secrets, workload identities, cloud permissions, and Kubernetes access.
