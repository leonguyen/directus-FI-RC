# Use the latest official Directus image (or lock to a specific version)
FROM directus/directus:latest

# Create a custom entrypoint to ensure the data directory exists
# (this avoids some permission issues on Fly volumes)
COPY docker-entrypoint-custom.sh /docker-entrypoint-custom.sh
RUN chmod +x /docker-entrypoint-custom.sh

# Use the custom entrypoint
ENTRYPOINT ["/docker-entrypoint-custom.sh"]
CMD ["node", "/directus/cli.js", "start"]