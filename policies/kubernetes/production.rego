package kubernetes.production

import rego.v1

workload_kinds := {"Deployment", "StatefulSet"}

is_workload if {
    input.kind in workload_kinds
}

deny contains msg if {
    is_workload
    replicas := object.get(input.spec, "replicas", 1)
    replicas < 2
    msg := sprintf("%s/%s must run at least 2 replicas", [
        input.kind,
        input.metadata.name,
    ])
}

deny contains msg if {
    is_workload
    container := input.spec.template.spec.containers[_]
    endswith(container.image, ":latest")
    msg := sprintf("%s/%s container %s must not use the latest tag", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}
