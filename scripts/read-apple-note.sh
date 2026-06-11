#!/bin/bash
# Reads the "器材表" Apple Note and dumps its HTML body to stdout.
# Used by skills/sync-from-apple-note.md.
osascript <<'EOF'
tell application "Notes"
  set noteContent to body of (first note whose name is "器材表")
  return noteContent
end tell
EOF
