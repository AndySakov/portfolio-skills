# portfolio-skills

Claude skills for Temi's job applications. They work against his portfolio site,
[AndySakov/obafemiteminife](https://github.com/AndySakov/obafemiteminife), which holds the claims, the problem pages
and the `npm run lens` / `npm run vet` scripts the skills call.

| Skill | What it does |
|---|---|
| `portfolio-lens` | Makes a tailored portfolio link (a lens) for one application, and reads its open receipts |
| `application-vet` | Vets an application against what the site can prove: job fit before applying, the draft before sending, and follow-ups after |

## Install

**Claude Code on a laptop.** This repository is a plugin marketplace:

```
/plugin marketplace add AndySakov/portfolio-skills
/plugin install portfolio@temi
```

The skills then run as `/portfolio:portfolio-lens` and `/portfolio:application-vet`, and Claude picks them up on
its own when a request matches. `/plugin marketplace update temi` pulls new versions.

**claude.ai, Cowork and cloud sessions.** Plugins from a marketplace don't load in cloud sessions, so upload the
skills to the account instead:

```
./scripts/zip.sh
```

Then upload `dist/portfolio-lens.zip` and `dist/application-vet.zip` under Settings > Capabilities > Skills. Upload
again after changing a skill.

## Where the skills find the site

Each skill starts by locating a checkout of the site: the current directory if it is the site, then
`$PORTFOLIO_REPO`, then `~/obafemiteminife`, `~/code/obafemiteminife` and `~/Projects/obafemiteminife`, and
otherwise it clones it. Set `PORTFOLIO_REPO` if the checkout lives somewhere else.

They also need these, from 1Password's Automation vault:

| Variable | What for |
|---|---|
| `ADMIN_TOKEN` | "Portfolio ADMIN_TOKEN". Needed to push, pull or take down lenses, and to read open receipts |
| `SITE_URL` | Optional. Defaults to `https://portfolio.obafemiteminife.workers.dev` |

## Changing a skill

Edit `plugins/portfolio/skills/<name>/SKILL.md`, bump `version` in `plugins/portfolio/.claude-plugin/plugin.json`,
and push. Then update the marketplace on each laptop and re-upload the zip to claude.ai.
