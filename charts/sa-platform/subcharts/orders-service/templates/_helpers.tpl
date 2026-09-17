{{- define "orders-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "orders-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "orders-service.labels" -}}
app.kubernetes.io/name: {{ include "orders-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "orders-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orders-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "orders-service.serviceAccountName" -}}
{{- printf "%s-sa" (include "orders-service.fullname" .) -}}
{{- end }}

{{- define "orders-service.configMapName" -}}
{{- printf "%s-config" (include "orders-service.fullname" .) -}}
{{- end }}
