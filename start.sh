#!/bin/bash

# Ignorer /data, utiliser uniquement /home/node
export HOME=/home/node
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "mode": "local"
  },
  "channels": {
    "telegram": {
      "enabled": true,
      "dmPolicy": "allowlist",
      "allowFrom": ["1576473251"]
    }
  }
}
CONFIG

chown -R node:node /home/node/.openclaw

# Démarrer en tant que node
exec su node -c "npx openclaw start --gateway"
