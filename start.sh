#!/bin/bash

# Config dans home node
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

# Démarrer directement
exec npx openclaw start --gateway
