vault server -config=/etc/vault/config.hcl &
sleep 10
openssl x509 -in /vault/tls/full-chain.pem -text -noout
openssl x509 -in /vault/tls/ca-cert.pem -text -noout
export VAULT_ADDR='https://127.0.0.1:8200'
vault operator init -ca-cert=/vault/tls/ca-cert.pem

tail -f /dev/null
