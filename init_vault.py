import docker
import hvac
import secrets
import ssl
import tempfile
import os

# Initialize Docker client
docker_client = docker.from_env()

# Initialize Vault client
vault_client = hvac.Client(url='http://vault.example.com', token='your_vault_token')

# Function to generate random username and password
def generate_credentials():
    username = f'user_{secrets.token_urlsafe(6)}'
    password = secrets.token_urlsafe(12)
    return username, password

# Function to generate SSL certificate and key
def generate_ssl_cert():
    cert_dir = tempfile.mkdtemp()
    cert_path = os.path.join(cert_dir, 'certificate.pem')
    key_path = os.path.join(cert_dir, 'key.pem')

    # Generate SSL certificate and key
    ssl_context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
    ssl_context.check_hostname = False
    ssl_context.verify_mode = ssl.CERT_NONE
    cert, key = ssl_context.get_ca_certs()

    with open(cert_path, 'wb') as cert_file:
        cert_file.write(cert)
    with open(key_path, 'wb') as key_file:
        key_file.write(key)

    return cert_path, key_path

# Function to store credentials and SSL certificates in Vault
def store_secrets(service_name, username, password, cert_path, key_path):
    # Store credentials in Vault
    vault_credentials_path = f'secret/{service_name}/credentials'
    vault_client.write(vault_credentials_path, username=username, password=password)

    # Store SSL certificate and key in Vault
    vault_ssl_cert_path = f'secret/{service_name}/ssl_certificate'
    vault_ssl_key_path = f'secret/{service_name}/ssl_key'
    with open(cert_path, 'rb') as cert_file:
        vault_client.write(vault_ssl_cert_path, certificate=cert_file.read())
    with open(key_path, 'rb') as key_file:
        vault_client.write(vault_ssl_key_path, key=key_file.read())

# Function to inject credentials and SSL certificates into Docker containers
def inject_secrets(service_name, username, password, cert_path, key_path):
    service = docker_client.services.get(service_name)
    env_vars = {
        'USERNAME': username,
        'PASSWORD': password,
        'SSL_CERT_PATH': cert_path,
        'SSL_KEY_PATH': key_path
    }
    service.update(env=env_vars)

# Example usage
def main():
    service_name = 'example_service'

    # Generate credentials
    username, password = generate_credentials()

    # Generate SSL certificate and key
    cert_path, key_path = generate_ssl_cert()

    # Store credentials and SSL certificates in Vault
    store_secrets(service_name, username, password, cert_path, key_path)

    # Inject credentials and SSL certificates into Docker containers
    inject_secrets(service_name, username, password, cert_path, key_path)

if __name__ == "__main__":
    main()
