#!/bin/bash

# Créer le dossier config
mkdir -p /data/.openclaw

# Écrire la config
cat > /data/.openclaw/openclaw.json << 'CONFIG'
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
  },
  "agents": {
    "defaults": {
      "maxConcurrent": 4
    }
  }
}
CONFIG

# Lier le dossier config
export OPENCLAW_STATE_DIR=/data/.openclaw

# Démarrer OpenClaw
exec npx openclaw start --gateway
