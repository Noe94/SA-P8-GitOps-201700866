{{- define "catalog-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "catalog-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "catalog-service.labels" -}}
app.kubernetes.io/name: {{ include "catalog-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "catalog-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "catalog-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "catalog-service.serviceAccountName" -}}
{{- printf "%s-sa" (include "catalog-service.fullname" .) -}}
{{- end }}

{{- define "catalog-service.configMapName" -}}
{{- printf "%s-config" (include "catalog-service.fullname" .) -}}
{{- end }}
