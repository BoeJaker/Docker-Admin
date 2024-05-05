ui            = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://127.0.0.1:8200"
disable_mlock = true

storage "raft" {
  path = "/vault/data"
  node_id = "raft_node_id"
}

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/vault/tls/full-chain.pem"
  tls_key_file  = "/vault/tls/server-private-key.pem"
  tls_verify    = false
}

#telemetry {
#  statsite_address = "127.0.0.1:8125"
#  disable_hostname = true
#}
