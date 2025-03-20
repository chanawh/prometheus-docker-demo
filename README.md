Here's an updated version of your **`README.md`** to reflect the current setup, including Prometheus, Grafana, and Node Exporter with Docker Compose:

---

## **Prometheus + Grafana + Node Exporter with Docker Compose**

This repository contains a Dockerized setup for **Prometheus**, **Grafana**, and **Node Exporter** to monitor and visualize system metrics.

---

### **🚀 Quick Start**

#### **1. Clone the Repository**

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/prometheus-grafana-node-exporter.git
cd prometheus-grafana-node-exporter
```

#### **2. Modify Configuration Files**

- **`prometheus.yml`**: Update any specific scrape targets or configurations if needed (e.g., add new exporters).
- **Grafana**: If you have custom dashboards, you can add them to the `grafana/provisioning/dashboards/` folder.
  
#### **3. Build and Start the Containers**

Start the services using Docker Compose:

```bash
docker-compose up -d
```

This command will:
- Build the custom Prometheus, Grafana, and Node Exporter containers.
- Start Prometheus on port `9090`, Grafana on port `3000`, and Node Exporter on port `9100`.

#### **4. Access the Services**

- **Prometheus Web UI**: Open [http://localhost:9090](http://localhost:9090) in your browser.
- **Grafana Web UI**: Open [http://localhost:3000](http://localhost:3000) in your browser. Default credentials are:
  - Username: `admin`
  - Password: `admin`
- **Node Exporter Metrics**: Open [http://localhost:9100/metrics](http://localhost:9100/metrics) to view system metrics exposed by Node Exporter.

#### **5. Login to Grafana**

1. On the Grafana login page, use the default credentials:
   - Username: `admin`
   - Password: `admin`

2. Once logged in, add **Prometheus** as a data source (if not pre-configured).
   - Go to **Configuration** > **Data Sources** > **Add data source** > Choose **Prometheus**.
   - Set the URL to `http://prometheus:9090`.

3. Grafana will automatically detect the default Prometheus instance and begin displaying data.

---

### **📂 Project Structure**

```
code/
├── Dockerfile                # Custom Prometheus Dockerfile
├── README.md                 # This README file
├── docker-compose.yml        # Docker Compose setup for Prometheus, Grafana, and Node Exporter
├── prometheus.yml            # Prometheus configuration file
├── grafana/                  # Custom Grafana provisioning files (dashboards, datasources)
│   ├── provisioning/
│   │   ├── datasources/
│   │   │   └── prometheus.yaml  # Grafana datasource configuration for Prometheus
│   │   └── dashboards/
│   │       └── dashboards.yaml  # Grafana dashboard provider configuration
│   └── Dockerfile            # Custom Grafana Dockerfile
└── node-exporter/            # Node Exporter (if using custom build)
    └── Dockerfile            # Optional: Custom Node Exporter Dockerfile
```

---

### **🔧 Configuration Files**

- **`prometheus.yml`**: The main configuration file for Prometheus, where you define which services (like Node Exporter) to scrape and the scraping intervals.
- **`docker-compose.yml`**: Defines the services (`prometheus`, `grafana`, and `node-exporter`) and manages their lifecycle.
- **`grafana/provisioning/datasources/prometheus.yaml`**: Pre-configures Prometheus as the data source for Grafana.
- **`grafana/provisioning/dashboards/dashboards.yaml`**: Configures where to load dashboards from (can be customized with your own dashboards).

---

### **⚙️ Customization**

#### **Adding New Exporters**

To add new exporters (like **MySQL Exporter**, **Blackbox Exporter**, etc.), follow these steps:

1. **Add Scrape Config in `prometheus.yml`**:
   Add a new job to the `scrape_configs` section, for example:

   ```yaml
   - job_name: 'mysql'
     static_configs:
       - targets: ['mysql-exporter:9104']
   ```

2. **Update `docker-compose.yml`**:
   Add a service for the new exporter:

   ```yaml
   mysql-exporter:
     image: prom/mysql-exporter:v0.13.0
     ports:
       - "9104:9104"
     networks:
       - monitoring
   ```

3. **Rebuild and Restart Services**:

   ```bash
   docker-compose up -d --build
   ```

---

### **🛠️ Stopping the Stack**

To stop the stack and remove the containers, run:

```bash
docker-compose down
```

If you also want to remove the persistent data (e.g., Prometheus data), add the `-v` flag:

```bash
docker-compose down -v
```

---

### **⚠️ Notes**

- **Grafana Dashboards**: By default, no dashboards are loaded. You can create or import dashboards directly in Grafana, or use the `provisioning` folder to automate dashboard loading.
- **Persisting Prometheus Data**: The `prometheus-data` volume ensures that Prometheus' scraped data persists across container restarts.
- **Network Isolation**: The services (`prometheus`, `grafana`, `node-exporter`) are on a custom `monitoring` network to communicate securely.

---

### **📝 License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

With this **updated `README.md`**, users should have a better understanding of how to get started with your Prometheus, Grafana, and Node Exporter stack, as well as how to customize it for their needs.

Let me know if you'd like any other updates or additions to the `README.md`! 😎