# Docker Admin Stack

This Docker Compose configuration sets up an infrastructure environment comprising various services such as Portainer, Vault, Prometheus, and more, each running as Docker containers. 
The configuration also includes network settings for encrypted internal communication and logging.

The Docker Admin stack is a key component within a larger ecosystem of Docker stacks:

### Docker-Network
This stack focuses on networking infrastructure within Docker environments.
It includes configurations for overlay networks, external networks, and network-related services such as DNS, DHCP, or proxy servers.
Docker-Network provides the backbone for communication and connectivity between containers, services, and external networks.

### Docker-Workbench 
Focuses on providing a versatile and customizable development environment for software development teams.
It includes configurations for development tools, version control systems, continuous integration and deployment (CI/CD) pipelines, and project management tools.
Docker-Workbench streamlines the setup of development environments, enabling teams to collaborate efficiently and iterate on software projects seamlessly.

### Docker-Red-Lab
Tailored for setting up development or testing environments, particularly for cybersecurity or network security labs.
It includes configurations for deploying vulnerable machines, penetration testing tools, network monitoring tools, and other security-related services.
Docker-Red-Lab aims to provide a comprehensive environment for red teaming exercises, security research, and educational purposes.

### Docker-Media-Server
Designed for hosting and managing media content such as, games movies, music, photos, and streaming services.
It includes configurations for media server applications, media libraries, transcoding services, and media streaming platforms.
Docker-Media-Server provides a centralized platform for organizing and accessing media content across devices, offering features like remote access, transcoding, and media playback.

Whilst Docker-Admin is designed for use in this ecosystem it can easily be adopted in any docker environment, to manage, monitor, and administer them. It serves as the administrative hub for overseeing various Docker-related tasks, such as container management, logging, monitoring, and security.

## Services Overview:
Portainer: Docker container management tool for easy container administration.
Vault: HashiCorp Vault for managing secrets and protecting sensitive data.
Database (PostgreSQL): Database service for data storage.
pgAdmin: Web-based interface for PostgreSQL administration.
Metabase: Business intelligence and analytics tool.
Elasticsearch & Kibana: Elasticsearch for data search and Kibana for data visualization.
Prometheus: Metric collector for monitoring and alerting.
Logspout & Fluentd: Log collectors for gathering container logs.

## Perquisites:
This stack depends upon an externally defined docker network (traefik) to operate. The network is defined in my repo 'Docker-Network' 
If you don't want to use 'Docker-Network' simply change the network property "external:" to "false" (without quotes) in the docker-compose.yml

## How to Use:
Ensure Docker and Docker Compose are installed on your system.
Clone this repository.
Create a .env file in the projects root directory, copy in the example_env file.
Customize environment variables and settings as per your requirements.
In the directory containing the docker-compose.yml file, run docker-compose up <service_name> to bring up an individual service i.e. docker-compose up portainer 
Alternatively you can run all services with docker-compose up -d 

## Note:
Feel free to customize this Docker Compose configuration further based on your specific use case and environment requirements.

For any assistance or troubleshooting, refer to the Docker and service-specific documentation or seek support from relevant communities.