# SA P8 - GitOps

Repositorio público de estado deseado para la Práctica 8 de Software Avanzado.

Este repositorio es observado por Argo CD y contiene exclusivamente artefactos declarativos de despliegue.

## Estructura

- `argocd/`: aplicaciones administradas por Argo CD.
- `charts/`: chart Helm de la plataforma.
- `policies/`: políticas de seguridad administradas por Kyverno.
- `secrets/`: secretos cifrados mediante Sealed Secrets.

## Ambientes

- `sa-p8-dev`
- `sa-p8-prod`

## Flujo GitOps

El pipeline del repositorio de código no despliega directamente al clúster.

El flujo esperado es:

1. CI construye y valida las imágenes.
2. CI actualiza la versión declarada mediante Pull Request a este repositorio.
3. El cambio es integrado a `main`.
4. Argo CD detecta el cambio.
5. Argo CD sincroniza el estado deseado con GKE.

No se almacenan secretos en texto plano.
