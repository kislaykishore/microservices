# Install Prometheus

curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-prometheus.yaml | kubectl apply -n istio-system -f -

# Install Grafana
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-grafana.yaml | kubectl apply -n istio-system -f -

# Install Service Graph
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-servicegraph.yaml | kubectl apply -n istio-system -f -

# Install Jaeger (tracing)
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-tracing.yaml | kubectl apply -n istio-system -f -


