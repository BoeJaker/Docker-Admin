FROM hashicorp/vault

# Install OpenSSL
RUN apk --no-cache add openssl

# Set working directory
WORKDIR /certs
# Copy custom openssl.cnf
COPY config/openssl.cnf /etc/ssl/openssl.cnf
COPY config/caopenssl.cnf /etc/ssl/caopenssl.cnf
RUN cat /etc/ssl/openssl.cnf

# # Generate CA key
# RUN openssl req -x509 -newkey rsa:4096 -keyout ca-private-key.pem -out ca-cert.pem -days 365 -nodes -subj "/CN=MyCA"
# # Generate CSR (Certificate Signing Request)
# RUN openssl req -new -newkey rsa:4096 -keyout server-private-key.pem -out server-csr.pem -subj "/CN=vault-server" -passout pass:password 
# # Self Sign
# RUN openssl x509 -req -in server-csr.pem -CA ca-cert.pem -CAkey ca-private-key.pem -CAcreateserial -out full-chain.pem  -days 365\
#     -extensions v3_req -extfile /etc/ssl/openssl.cnf
    
# Generate TLS private key
RUN openssl genrsa -out ca-private-key.pem 2048
RUN openssl genrsa -out server-private-key.pem 2048
# Generate CA certificate and key
RUN openssl req -x509 -new -nodes -key ca-private-key.pem -sha256 -days 365 \
    -subj "/CN=MyCA"  -out ca-cert.pem \
    -config /etc/ssl/caopenssl.cnf

# Generate CSR (Certificate Signing Request) for server certificate
RUN openssl req -new -key server-private-key.pem -out server-csr.pem 
    # -config /etc/ssl/openssl.cnf

# Sign the CSR with the CA certificate to generate the server TLS certificate
RUN openssl x509 -req -days 365 -in server-csr.pem -out full-chain.pem \
    -CA ca-cert.pem -CAkey ca-private-key.pem -CAcreateserial -sha256 \
    -extensions v3_req -extfile /etc/ssl/openssl.cnf

# Cleanup unnecessary files
RUN rm server-csr.pem

# Copy TLS certificates to the desired location
RUN mkdir -p /vault/tls
RUN cp server-private-key.pem /vault/tls/
RUN cp full-chain.pem /vault/tls/
RUN cp ca-cert.pem /vault/tls/
# Set appropriate permissions
RUN chmod -R 400 /vault/tls/

COPY config/config.hcl /etc/vault/config.hcl
RUN mkdir /vault/data ; touch /vault/data/vault.db
RUN chmod 600 /vault/data/vault.db

COPY config/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
CMD ["sh","/usr/local/bin/entrypoint.sh"]
