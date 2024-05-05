import docker
from ldap3 import Server, Connection, MODIFY_ADD, MODIFY_REPLACE

# Function to get Docker hosts
def get_docker_hosts():
    client = docker.from_env()
    return client.containers.list()

# Function to add Docker hosts to LDAP
def add_hosts_to_ldap(hosts):
    ldap_server = 'ldap://192.168.3.201:1389'
    ldap_bind_dn = 'cn=admin,dc=example,dc=org'
    ldap_bind_password = 'admin'
    
    server = Server(ldap_server)
    conn = Connection(server, user=ldap_bind_dn, password=ldap_bind_password, auto_bind=True)
    
    for host in hosts:
        hostname = host.attrs['Config']['Hostname']
        dn = 'cn={},ou=hosts,dc=mydomain,dc=com'.format(hostname)
        entry = {
            'objectClass': ['top', 'device'],
            'cn': hostname,
            'ipHostNumber': host.attrs['NetworkSettings']['IPAddress']
        }
        conn.add(dn, attributes=entry)
        print('Host {} added to LDAP.'.format(hostname))
    
    conn.unbind()

def main():
    docker_hosts = get_docker_hosts()
    add_hosts_to_ldap(docker_hosts)

if __name__ == "__main__":
    main()
