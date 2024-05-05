# Docker Admin Stack

This Docker Compose configuration sets up an infrastructure environment comprising various services such as Portainer, Vault, Prometheus, and more, each running as Docker containers. The configuration also includes network settings for encrypted internal communication and logging.  

<b>The Docker Admin stack is a key component within a larger ecosystem of Docker stacks, they are:</b>

### - Docker-Network
This stack focuses on networking infrastructure within Docker environments.
It includes configurations for overlay networks, external networks, and network-related services such as DNS, DHCP, or proxy servers.
Docker-Network provides the backbone for communication and connectivity between containers, services, and external networks.

### - Docker-Workbench 
Focuses on providing a versatile and customizable development environment for software development teams.
It includes configurations for development tools, version control systems, continuous integration and deployment (CI/CD) pipelines, and project management tools.
Docker-Workbench streamlines the setup of development environments, enabling teams to collaborate efficiently and iterate on software projects seamlessly.

### - Docker-Red-Lab
Tailored for setting up development or testing environments, particularly for cybersecurity or network security labs.
It includes configurations for deploying vulnerable machines, penetration testing tools, network monitoring tools, and other security-related services.
Docker-Red-Lab aims to provide a comprehensive environment for red teaming exercises, security research, and educational purposes.

### - Docker-Media-Server
Designed for hosting and managing media content such as, games movies, music, photos, and streaming services.
It includes configurations for media server applications, media libraries, transcoding services, and media streaming platforms.
Docker-Media-Server provides a centralized platform for organizing and accessing media content across devices, offering features like remote access, transcoding, and media playback.

### Note:
Whilst Docker-Admin is designed for use in this ecosystem it can easily be adopted in any docker environment, to manage, monitor, and administer them. It serves as the administrative hub for overseeing various Docker-related tasks, such as container management, logging, monitoring, and security.

## Services Overview:
<b>Portainer:</b> Docker container management tool for easy container administration.

<b>Vault:</b> HashiCorp Vault for managing secrets and protecting sensitive data.

<b>Database (PostgreSQL):</b> Database service for data storage.

<b>pgAdmin:</b> Web-based interface for PostgreSQL administration.

<b>Metabase:</b> Business intelligence and analytics tool.

<b>Elasticsearch & Kibana:</b> Elasticsearch for data search and Kibana for data visualization.

<b>Prometheus:</b> Metric collector for monitoring and alerting.

<b>Logspout & Fluentd:</b> Log collectors for gathering container logs.

## Scripts
update_prod.sh - Copies Dev file environment to Prod environment

## Perquisites:
This stack depends upon an externally defined docker network (traefik) to operate. The network is defined in my repo 'Docker-Network' 
If you don't want to use 'Docker-Network' simply change the network property "external:" to "false" (without quotes) in the docker-compose.yml

## How to Use:
Ensure Docker and Docker Compose are installed on your system.
Clone this repository.
Create a .env file in the projects root directory, copy in the example_env file.
Customize environment variables and settings as per your requirements.
In the directory containing the docker-compose.yml file, run docker-compose up <service_name> to bring up an individual service i.e. docker-compose up portainer 
Alternatively you can run all services with docker-compose up

# Docker Stack with Portainer, Vault, PostgreSQL, pgAdmin, and Metabase

This Docker stack provides essential services for container management, secret management, relational database management, and analytics.

## Containers Included:

### 1. Portainer
- Portainer is an open-source container management tool that simplifies container deployment, management, and monitoring.

### 2. Vault
- Vault is a tool for securely accessing secrets. It provides a unified interface to secret storage and dynamic secrets management.

### 3. PostgreSQL
- PostgreSQL is a powerful, open-source relational database management system.

### 4. pgAdmin
- pgAdmin is a web-based administration tool for PostgreSQL databases.

### 5. Metabase
- Metabase is a simple and powerful analytics tool that allows you to query and visualize data from your database.

## Usage:

1. Install Docker and Docker Compose if you haven't already.

2. Clone this repository:
    ```bash
    git clone https://github.com/your/repo.git
    ```

3. Navigate to the cloned directory:
    ```bash
    cd docker-stack
    ```

4. Adjust the configurations in the `docker-compose.yml` file according to your requirements. Ensure that you provide necessary environment variables, volume mounts, and network configurations.

5. Start the Docker stack using Docker Compose:
    ```bash
    docker-compose up -d
    ```

6. Access the services via their respective endpoints. Portainer, pgAdmin, and Metabase typically have web interfaces accessible via web browser.

## Additional Script:

- The `pull_env_into_vault.sh` script can be used to pull environment variables into Vault for secure management. Ensure that you review and customize the script according to your environment and Vault configuration.

## Notes:

- Configure each container properly according to your specific use case and security requirements.

- Consider implementing additional security measures such as authentication, encryption, and access controls as needed.

- Regularly update the containers and their dependencies to ensure that you are protected against known vulnerabilities.

## Contributing:

Feel free to contribute to this project by submitting bug reports, feature requests, or pull requests.

## License:

This project is licensed under the [MIT License](LICENSE).
