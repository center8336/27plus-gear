#!/bin/bash
# Deploy equipment.html to GitHub → Netlify auto-deploy.
# Usage:  ./deploy.sh                            # uses default commit message
#         ./deploy.sh "Add Universal Audio x4"   # custom commit message
set -e

cd "$(dirname "$0")"

# Clean any stale locks
rm -f .git/index.lock .git/HEAD.lock 2>/dev/null || true

MSG="${1:-Update equipment list}"

# Stage the site pages + plan images (multi-page site)
git add equipment.html room.html img deploy.sh

# Skip commit if nothing changed
if git diff --cached --quiet; then
  echo "No changes to equipment.html — nothing to deploy."
  exit 0
fi

git -c user.name='陳棉' -c user.email='center8336@gmail.com' commit -m "$MSG"
git push origin main

# Read NETLIFY_BUILD_HOOK from .env and trigger Netlify deploy directly.
# (The GitHub→Netlify webhook isn't auto-installed when using a deploy key,
#  so we trigger the build hook ourselves — guarantees a deploy every push.)
if [ -f .env ]; then
  HOOK=$(grep '^NETLIFY_BUILD_HOOK=' .env | cut -d= -f2- | tr -d '"' | tr -d "'")
  if [ -n "$HOOK" ]; then
    curl -s -X POST "$HOOK" -d '{}' >/dev/null && echo "✓ Netlify build triggered."
  fi
fi

echo ""
echo "✓ Pushed to GitHub. Netlify will deploy in ~30s."
echo "→ https://27plus-gear.netlify.app/equipment.html"
echo "→ https://27plus-gear.netlify.app/room.html"
