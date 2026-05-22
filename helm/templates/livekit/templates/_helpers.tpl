{{/*
Expand the name of the chart.
*/}}
{{- define "livekit.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "livekit.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "livekit.labels" -}}
helm.sh/chart: {{ include "livekit.name" . }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
LiveKit main service labels
*/}}
{{- define "livekit.main.labels" -}}
{{- include "livekit.labels" . }}
app: livekit
{{- end }}

{{/*
LiveKit token service labels
*/}}
{{- define "livekit.token.labels" -}}
{{- include "livekit.labels" . }}
app: livekit-token-service
{{- end }}



