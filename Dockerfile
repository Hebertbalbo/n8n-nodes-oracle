FROM n8nio/n8n:1.79.3

USER root

# Instala dependências necessárias para oracledb
RUN apt-get update && apt-get install -y libaio1 && rm -rf /var/lib/apt/lists/*

# Instala o driver Oracle e o node personalizado (se estiver publicado via npm ou local)
RUN npm install oracledb

# Copia os nós personalizados (caso esteja criando)
# COPY ./nodes /data/packages/nodes/

USER node
