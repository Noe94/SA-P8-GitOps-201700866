{{- define "shipping-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "shipping-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "shipping-service.labels" -}}
app.kubernetes.io/name: {{ include "shipping-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "shipping-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "shipping-service.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "shipping-service.serviceAccountName" -}}
{{- printf "%s-sa" (include "shipping-service.fullname" .) -}}
{{- end }}

{{- define "shipping-service.configMapName" -}}
{{- printf "%s-config" (include "shipping-service.fullname" .) -}}
{{- end }}
