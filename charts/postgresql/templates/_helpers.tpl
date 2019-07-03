{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "postgresql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "postgresql.fullname" -}}
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
{{- define "postgresql.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return PostgreSQL username
*/}}
{{- define "postgresql.username" -}}
{{- if .Values.global.postgresql.username }}
    {{- .Values.global.postgresql.username -}}
{{- else -}}
    {{- .Values.postgresql.username -}}
{{- end -}}
{{- end -}}


{{/*
Return PostgreSQL password
*/}}
{{- define "postgresql.password" -}}
{{- if .Values.global.postgresql.password }}
    {{- .Values.global.postgresql.password -}}
{{- else if .Values.postgresql.password -}}
    {{- .Values.postgresql.password -}}
{{- else -}}
    {{- randAlphaNum 10 -}}
{{- end -}}
{{- end -}}

{{/*
Return PostgreSQL port
*/}}
{{- define "postgresql.port" -}}
{{- if .Values.global.postgresql.servicePort }}
    {{- .Values.global.postgresql.servicePort -}}
{{- else -}}
    {{- .Values.port -}}
{{- end -}}
{{- end -}}

{{/*
Return PostgreSQL created database
*/}}
{{- define "postgresql.database" -}}
{{- if .Values.global.postgresql.database }}
    {{- .Values.global.postgresql.database -}}
{{- else if .Values.postgresql.database -}}
    {{- .Values.postgresql.database -}}
{{- end -}}
{{- end -}}

{{/*
Return image
*/}}
{{- define "postgresql.image" -}}
{{- if .Values.global.image }}
    {{- .Values.global.image -}}
{{- else if .Values.image -}}
    {{- .Values.image -}}
{{- end -}}
{{- end -}}