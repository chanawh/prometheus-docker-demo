# Use the official Prometheus Node Exporter image as a base
FROM prom/node-exporter:v1.7.0

# Set the working directory inside the container
WORKDIR /node-exporter

# Optionally, you can set environment variables for custom configurations
# ENV MY_CUSTOM_VARIABLE=value

# Expose the default port used by the Node Exporter
EXPOSE 9100

# Run the Node Exporter with the specified flags (if any)
# This will start the Node Exporter to expose metrics on port 9100
ENTRYPOINT ["/bin/node_exporter"]
