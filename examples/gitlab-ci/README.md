# GitLab CI Examples

Production-oriented GitLab CI delivery patterns.

## Capabilities

The GitLab CI examples demonstrate:

- container builds
- immutable image publishing
- vulnerability validation
- Kubernetes delivery
- deployment serialization
- controlled production promotion
- rollback workflows

## Reusable Components

Reusable components are located in:

    templates/gitlab-ci/components/

The end-to-end consumer example is:

    platform-delivery.gitlab-ci.yml

Production consumers should configure protected variables, protected environments, registry credentials, and Kubernetes authentication according to their GitLab security model.
