package main

import data.kubernetes.security
import data.kubernetes.production

deny contains msg if {
    msg := security.deny[_]
}

deny contains msg if {
    msg := production.deny[_]
}
