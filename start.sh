#!/bin/bash

# Supprimer l'ancien fichier problématique
rm -rf /data/.openclaw

# Créer config dans le home directory de node (permissions correctes)
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

# Démarrer
exec npx openclaw start --gateway
