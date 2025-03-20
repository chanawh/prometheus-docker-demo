# Use the official Grafana image as a base
FROM grafana/grafana:9.5.0

# Set the working directory
WORKDIR /etc/grafana

# Copy the provisioning configuration into the container
COPY provisioning/ /etc/grafana/provisioning/

# Set permissions for Grafana to access the provisioning files
RUN chown -R grafana:grafana /etc/grafana/provisioning

# Expose the default Grafana port
EXPOSE 3000

# Start Grafana with the default entrypoint
ENTRYPOINT ["/bin/bash", "-c", "/bin/grafana-server"]
