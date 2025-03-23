# Use Alpine as the base image
FROM alpine:latest

# Install monitoring tools (e.g., htop, curl, bash)
RUN apk add --no-cache htop curl bash

# Optional: Add a simple health check script (ensure the script is copied correctly)
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/healthcheck.sh

# Set the working directory
WORKDIR /app

# Expose port (if you plan to run a service inside)
EXPOSE 8080

# Command to keep the container running (useful for running background services)
CMD ["sh", "-c", "while true; do sleep 30; done"]

# Healthcheck for Docker to monitor container status
HEALTHCHECK CMD ["/usr/local/bin/healthcheck.sh"]
