{{- define "inventory-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "inventory-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "inventory-service.labels" -}}
app.kubernetes.io/name: {{ include "inventory-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "inventory-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inventory-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "inventory-service.serviceAccountName" -}}
{{- printf "%s-sa" (include "inventory-service.fullname" .) -}}
{{- end }}

{{- define "inventory-service.configMapName" -}}
{{- printf "%s-config" (include "inventory-service.fullname" .) -}}
{{- end }}
