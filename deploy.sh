#!/bin/bash
# Script de despliegue automático para CORTAZAR59.com
# Ejecutar: ./deploy.sh

SITE_ID="roaring-douhua-19e2f9"
ZIP_FILE="deploy.zip"

echo "🚀 Desplegando CORTAZAR59.com..."

# Crear zip de la web
cd "$(dirname "$0")"
zip -r "$ZIP_FILE" index.html images/ netlify.toml -x "*.DS_Store" -x "*.git*"

# Subir a Netlify
curl -H "Content-Type: application/zip" \
     --data-binary "@$ZIP_FILE" \
     "https://api.netlify.com/api/v1/sites/$SITE_ID/deploys"

# Limpiar
rm "$ZIP_FILE"

echo "✅ Desplegado correctamente en https://CORTAZAR59.com"
