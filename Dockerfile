FROM directus/directus:latest

# 1. Switch to root to perform administrative actions
USER root

# 2. Copy the custom entrypoint and make it executable
COPY docker-entrypoint-custom.sh /docker-entrypoint-custom.sh
RUN chmod +x /docker-entrypoint-custom.sh

# 3. Ensure the directus user owns the script if they need to read/execute it
# (The default non-root user in the Directus image is usually 'node')
RUN chown node:node /docker-entrypoint-custom.sh

# 4. Switch back to the non-root user for security
USER node

ENTRYPOINT ["/docker-entrypoint-custom.sh"]
