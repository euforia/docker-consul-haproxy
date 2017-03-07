global
    maxconn 2048

defaults
    mode http
    timeout client 5s
    timeout server 5s
    timeout connect 5s

listen http-in
    bind *:8080{{range service "REPLACE"}}
    server {{.Node}} {{.Address}}:{{.Port}}{{end}}