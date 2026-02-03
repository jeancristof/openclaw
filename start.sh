#!/bin/bash

# Créer le dossier avec bonnes permissions
mkdir -p /data/.openclaw
chown -R node:node /data/.openclaw

# Écrire la config en tant que node
su node -c 'cat > /data/.openclaw/openclaw.json << CONFIG
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
CONFIG'

# Démarrer OpenClaw
exec su node -c "npx openclaw start --gateway"
