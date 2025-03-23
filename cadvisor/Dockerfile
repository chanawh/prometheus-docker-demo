# Use the official cAdvisor base image
FROM gcr.io/cadvisor/cadvisor:v0.47.2

# Add any custom configuration or adjustments if needed
# Example: Install additional utilities (if required)
RUN apk add --no-cache bash curl

# Expose the cAdvisor port
EXPOSE 8080

# Start cAdvisor
CMD ["/usr/bin/cadvisor", "-logtostderr", "-port", "8080"]
