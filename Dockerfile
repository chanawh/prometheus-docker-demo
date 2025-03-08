# Pin the version to ensure stability
FROM prom/prometheus:v2.45.0

# Create and switch to a non-root user for better security
RUN addgroup -S prometheus && adduser -S prometheus -G prometheus
USER prometheus

# Set working directory and copy config
WORKDIR /etc/prometheus
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Expose port internally only (if needed)
EXPOSE 9090

# Use environment variable for config flexibility and bind to localhost
CMD ["--config.file=${PROMETHEUS_CONFIG:-/etc/prometheus/prometheus.yml}", "--web.listen-address=127.0.0.1:9090"]
