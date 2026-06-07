# Clone the containerized single-node orchestration manifest path
git clone https://github.com/wazuh/wazuh-docker.git --depth=1
cd wazuh-docker/single-node

# Run script to provision secure internal TLS/cryptographic certificates
docker compose -f generate-indexer-certs.yml run --rm generator

# Launch the full dashboard, indexer, and manager stack in background daemon mode
docker compose up -d

# Open agent manager to create the Ubuntu and Windows agents
docker compose exec wazuh.manager /var/ossec/bin/manage_agents
