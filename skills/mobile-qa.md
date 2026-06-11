# Skill: Mobile QA via Dia

Use when: any change has been deployed and the dual-viewport check is required (always — see PROJECT_CONTEXT.md mobile QA rule).

## Steps

1. Ensure `_mobile-preview-live.html` exists in the project root. If not, create it (template below).
2. Open the wrapper in Dia via osascript:
   ```
   open -a 'Dia' '<full path to _mobile-preview-live.html>'
   ```
3. Wait 3–4 seconds for fonts/scripts to load.
4. Take a screenshot via `mcp__computer-use__screenshot`.
5. Visually verify the change is correct at 390×844 (iPhone 15 viewport).
6. Specifically check: stat layout, nav hamburger, hero typography, card grid collapse, on-loan styling.

## Wrapper template (`_mobile-preview-live.html`)

```html
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Mobile Preview</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{background:#1a1a2e;display:flex;flex-direction:column;align-items:center;justify-content:center;min-height:100vh;font-family:-apple-system,sans-serif;color:#e0e0e0;padding:1.5rem}
.lbl{font-size:13px;margin-bottom:12px;color:#888;letter-spacing:0.05em;font-family:SFMono-Regular,Menlo,monospace}
.lbl strong{color:#CBB9D6}
.frame{border:3px solid #444;border-radius:40px;padding:12px 8px;background:#000;box-shadow:0 20px 60px rgba(0,0,0,0.5)}
.notch{width:120px;height:5px;background:#333;border-radius:3px;margin:0 auto 8px}
iframe{display:block;width:390px;height:844px;border:none;border-radius:28px;background:#fff}
</style></head><body>
<div class="lbl">LIVE — <strong>27plus-gear.netlify.app/equipment.html</strong> — iPhone 15 (390×844)</div>
<div class="frame"><div class="notch"></div>
<iframe src="https://27plus-gear.netlify.app/equipment.html"></iframe>
</div></body></html>
```

## Why Dia + iframe (not Chrome resize, not file://)

- Chrome `resize_window` is silently clamped by macOS minimum (~500px) — phone widths don't work.
- Local `file://` doesn't go through Netlify, so service workers, redirects, and CDN fonts behave differently.
- An iframe at exact pixel dimensions gives the inner content a *real* CSS viewport — `@media` queries fire correctly, `clamp()` computes against true viewport units, JS render runs normally.
