{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "curity.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "curity.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "curity.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "curity.labels" -}}
app.kubernetes.io/name: {{ include "curity.name" . }}
helm.sh/chart: {{ include "curity.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.labels }}
{{- toYaml . | nindent 0 }}
{{- end }}
{{- end -}}

{{- define "curity.metricsPort" -}}
{{ add .Values.curity.healthCheckPort  1 }}
{{- end -}}

{{/*
Creates the name of the service account used by the runtime nodes.
*/}}
{{- define "curity.runtime.serviceAccountName" -}}
  {{ default "default" .Values.curity.runtime.serviceAccount.name }}
{{- end -}}

{{- define "curity.admin.serviceAccountName" -}}
{{- if .Values.curity.admin.serviceAccount.name -}}
{{.Values.curity.admin.serviceAccount.name}}
{{- else if .Values.curity.config.backup -}}
{{ include "curity.fullname" . }}-service-account
{{- else -}}
default
{{- end -}}
{{- end }}
