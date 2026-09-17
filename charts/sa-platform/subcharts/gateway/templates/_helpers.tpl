{{- define "gateway.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gateway.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gateway.labels" -}}
app.kubernetes.io/name: {{ include "gateway.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{- define "gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gateway.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "gateway.serviceAccountName" -}}
{{- printf "%s-sa" (include "gateway.fullname" .) -}}
{{- end }}

{{- define "gateway.configMapName" -}}
{{- printf "%s-config" (include "gateway.fullname" .) -}}
{{- end }}
