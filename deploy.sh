#!/bin/bash
# Deploy equipment.html to GitHub → Netlify auto-deploy.
# Usage:  ./deploy.sh                            # uses default commit message
#         ./deploy.sh "Add Universal Audio x4"   # custom commit message
set -e

cd "$(dirname "$0")"

# Clean any stale locks
rm -f .git/index.lock .git/HEAD.lock 2>/dev/null || true

MSG="${1:-Update equipment list}"

# Stage only equipment.html (don't touch other files)
git add equipment.html

# Skip commit if nothing changed
if git diff --cached --quiet; then
  echo "No changes to equipment.html — nothing to deploy."
  exit 0
fi

git -c user.name='陳棉' -c user.email='center8336@gmail.com' commit -m "$MSG"
git push origin main

echo ""
echo "✓ Pushed to GitHub. Netlify will auto-deploy in ~10–60s."
echo "→ https://27plus-gear.netlify.app/equipment.html"
