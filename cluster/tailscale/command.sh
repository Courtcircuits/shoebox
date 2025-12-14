helm upgrade \
  --install \
  tailscale-operator \
  tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId=<REDACTED> \
  --set-string oauth.clientSecret=<REDACTED> \
  --wait

