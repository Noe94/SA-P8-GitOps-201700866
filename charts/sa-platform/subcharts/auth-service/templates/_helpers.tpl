{{- define "auth-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "auth-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "auth-service.labels" -}}
app.kubernetes.io/name: {{ include "auth-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "auth-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "auth-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "auth-service.serviceAccountName" -}}
{{- printf "%s-sa" (include "auth-service.fullname" .) -}}
{{- end }}

{{- define "auth-service.configMapName" -}}
{{- printf "%s-config" (include "auth-service.fullname" .) -}}
{{- end }}
