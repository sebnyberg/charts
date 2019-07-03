{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "api.fullname" -}}
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
{{- define "api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "api.image" -}}
{{- if .Values.global.image }}
    {{- .Values.global.image -}}
{{- else if .Values.image -}}
    {{- .Values.image -}}
{{- end -}}
{{- end -}}

{{- define "api.port" -}}
{{- if .Values.global.port }}
    {{- .Values.global.port -}}
{{- else if .Values.port -}}
    {{- .Values.port -}}
{{- end -}}
{{- end -}}

{{- define "api.replicaCount" -}}
{{- if .Values.global.replicaCount }}
    {{- .Values.global.replicaCount -}}
{{- else if .Values.replicaCount -}}
    {{- .Values.replicaCount -}}
{{- end -}}
{{- end -}}

{{- define "api.minCPU" -}}
{{- if .Values.global.minCPU }}
    {{- .Values.global.minCPU -}}
{{- else if .Values.minCPU -}}
    {{- .Values.minCPU -}}
{{- end -}}
{{- end -}}
{{- define "api.maxCPU" -}}
{{- if .Values.global.maxCPU }}
    {{- .Values.global.maxCPU -}}
{{- else if .Values.maxCPU -}}
    {{- .Values.maxCPU -}}
{{- end -}}
{{- end -}}
{{- define "api.minMemory" -}}
{{- if .Values.global.minMemory }}
    {{- .Values.global.minMemory -}}
{{- else if .Values.minMemory -}}
    {{- .Values.minMemory -}}
{{- end -}}
{{- end -}}
{{- define "api.maxMemory" -}}
{{- if .Values.global.maxMemory }}
    {{- .Values.global.maxMemory -}}
{{- else if .Values.maxMemory -}}
    {{- .Values.maxMemory -}}
{{- end -}}
{{- end -}}