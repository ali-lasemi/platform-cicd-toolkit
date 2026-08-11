package kubernetes.security

import rego.v1

workload_kinds := {"Deployment", "StatefulSet", "DaemonSet"}

is_workload if {
    input.kind in workload_kinds
}

containers := input.spec.template.spec.containers if {
    is_workload
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.securityContext.runAsNonRoot
    msg := sprintf("%s/%s container %s must set securityContext.runAsNonRoot=true", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.securityContext.readOnlyRootFilesystem
    msg := sprintf("%s/%s container %s must set readOnlyRootFilesystem=true", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.securityContext.allowPrivilegeEscalation == false
    msg := sprintf("%s/%s container %s must set allowPrivilegeEscalation=false", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not "ALL" in container.securityContext.capabilities.drop
    msg := sprintf("%s/%s container %s must drop ALL Linux capabilities", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.resources.requests.cpu
    msg := sprintf("%s/%s container %s must define CPU requests", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.resources.requests.memory
    msg := sprintf("%s/%s container %s must define memory requests", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.resources.limits.cpu
    msg := sprintf("%s/%s container %s must define CPU limits", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.resources.limits.memory
    msg := sprintf("%s/%s container %s must define memory limits", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.readinessProbe
    msg := sprintf("%s/%s container %s must define a readinessProbe", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}

deny contains msg if {
    is_workload
    container := containers[_]
    not container.livenessProbe
    msg := sprintf("%s/%s container %s must define a livenessProbe", [
        input.kind,
        input.metadata.name,
        container.name,
    ])
}
