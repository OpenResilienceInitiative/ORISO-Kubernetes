{{/* Common naming */}}
{{- define "oriso-platform.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "oriso-platform.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "oriso-platform.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "oriso-platform.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "oriso-platform.serviceName" -}}
{{- printf "%s-%s" .Release.Name .service | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "oriso-platform.serviceHost" -}}
{{- printf "%s.%s" .service $.Values.global.domain -}}
{{- end -}}

{{- define "oriso-platform.namespace" -}}
{{- default .Release.Namespace .Values.global.namespace -}}
{{- end -}}

{{- define "oriso-platform.image" -}}
{{- $registry := trimSuffix "/" (default "" .root.Values.global.imageRegistry) -}}
{{- $repo := .svc.image.repository -}}
{{- if $registry -}}
{{- printf "%s/%s" $registry $repo -}}
{{- else -}}
{{- $repo -}}
{{- end -}}
{{- end -}}
