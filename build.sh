#!/bin/sh
set -e

IMAGE_NAME=node-servidor-no-ar
CONTAINER_NAME=app

echo "⏳ 1/3  — Construindo a imagem Docker…"
docker build -t "$IMAGE_NAME" .

echo "🗑️ 2/3  — Removendo contêiner antigo (se existir)…"
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "🚀 3/3  — Subindo o contêiner em background…"
docker run --name "$CONTAINER_NAME" -d "$IMAGE_NAME"

chmod +x test.sh
./test.sh

