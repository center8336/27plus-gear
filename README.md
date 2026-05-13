# All-About-GEAR

Studio equipment inventory site for 陳棉 · 27+ Home Studio.

**Live:** https://27plus-gear.netlify.app/equipment.html

## How to edit

All gear data lives at the top of `equipment.html` inside the `SECTIONS` array. To add an item:

```js
{
  id: 'mics', nav: 'Mics', title: 'Microphones', cjk: '麥 克 風', accent: 1,
  items: [
    { name: 'Neumann U87 ai', meta: 'Large-Diaphragm Condenser' },
    // ← add a new line here, that's it
  ]
}
```

Counts (`01 / 07`), nav links, and section numbering are generated automatically.
Mark a loaned item with `onLoan: true` — it gets strikethrough + a 出借中 badge.

## How to deploy

```bash
./deploy.sh "your commit message"
```

Pushes `equipment.html` to GitHub `main`. Netlify webhook auto-deploys in ~10–60 seconds.

## Files

- `equipment.html` — the site (data + render in one file)
- `deploy.sh` — one-command deploy
- `.env` — GitHub PAT, Netlify token, site ID (not committed)
- `.gitignore` — excludes `.env`, `.DS_Store`
