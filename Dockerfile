# Etapa 1: Use uma imagem base com apt-get
FROM node:18-bullseye-slim AS builder

# Instala dependência do Oracle
RUN apt-get update && apt-get install -y libaio1 build-essential python3 && rm -rf /var/lib/apt/lists/*

# Cria uma pasta de trabalho
WORKDIR /app

# Instala o pacote Oracle
RUN npm install oracledb

# Etapa 2: Imagem final baseada no N8N
FROM n8nio/n8n:1.79.3

# Copia o módulo oracledb da imagem builder
COPY --from=builder /app/node_modules /usr/local/lib/node_modules

# Faz com que o oracledb fique acessível para o n8n
ENV NODE_PATH=/usr/local/lib/node_modules
