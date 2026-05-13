# Directus on Fly.io
FROM directus/directus:latest

# Copy the custom entrypoint and make it executable in one RUN
COPY docker-entrypoint-custom.sh /docker-entrypoint-custom.sh
RUN chmod +x /docker-entrypoint-custom.sh

# Use the custom entrypoint to ensure /data dirs exist
ENTRYPOINT ["/docker-entrypoint-custom.sh"]
CMD ["node", "/directus/cli.js", "start"]