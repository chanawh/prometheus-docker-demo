# Pin the version to ensure stability
FROM prom/prometheus:v2.45.0

# Create and switch to a non-root user for better security
RUN addgroup -S prometheus && adduser -S prometheus -G prometheus
USER prometheus

# Set the working directory
WORKDIR /etc/prometheus

# Copy the Prometheus configuration file into the container
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Expose the port for Prometheus (web UI) - expose internally only, not externally
EXPOSE 9090

# Use an environment variable for config flexibility
# Fallback to default Prometheus config if not provided via env variable
CMD ["--config.file=${PROMETHEUS_CONFIG:-/etc/prometheus/prometheus.yml}", "--web.listen-address=0.0.0.0:9090"]
