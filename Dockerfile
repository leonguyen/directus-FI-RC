FROM directus/directus:latest

USER root

# Install dos2unix to clear out hidden Windows carriage returns
RUN apt-get update && apt-get install -y dos2unix && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint-custom.sh /docker-entrypoint-custom.sh

# Convert line endings and make executable
RUN dos2unix /docker-entrypoint-custom.sh && chmod +x /docker-entrypoint-custom.sh

USER node

ENTRYPOINT ["/docker-entrypoint-custom.sh"]

