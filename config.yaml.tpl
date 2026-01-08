host: ''
port: 8317
tls:
  enable: false
  cert: ''
  key: ''
remote-management:
  allow-remote: false
  secret-key: $2a$10$3DxnGZwdc/YQUmpJRypeVOW0gtAte8XXVsGGcT/rb.ePyw6MhZ/c6
  disable-control-panel: false
  panel-github-repository: https://github.com/router-for-me/Cli-Proxy-API-Management-Center
auth-dir: /Users/didi/.cli-proxy-api
api-keys:
  - testtest
debug: false
logging-to-file: false
logs-max-total-size-mb: 0
usage-statistics-enabled: true
proxy-url: 'socks5://127.0.0.1:1080/'
force-model-prefix: false
request-retry: 3
max-retry-interval: 30
quota-exceeded:
  switch-project: true
  switch-preview-model: false
routing:
  strategy: fill-first
ws-auth: false
request-log: false
streaming: {}
disable-cooling: false
ampcode:
  upstream-url: ""
  upstream-api-key: ""
  restrict-management-to-localhost: false
  model-mappings: []
  force-model-mappings: false
payload:
  default: []
  override: []
