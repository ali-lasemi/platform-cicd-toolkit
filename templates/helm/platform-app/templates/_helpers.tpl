{{- define "platform-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "platform-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "platform-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
