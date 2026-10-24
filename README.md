# portfolio-skills

Agent skills for Temi's job applications. They work against his portfolio site,
[AndySakov/obafemiteminife](https://github.com/AndySakov/obafemiteminife), which holds the claims, the problem pages
and the `npm run lens` / `npm run vet` scripts the skills call.

| Skill | What it does |
|---|---|
| `portfolio-lens` | Makes a tailored portfolio link (a lens) for one application, and reads its open receipts |
| `application-vet` | Vets an application against what the site can prove: job fit before applying, the draft before sending, and follow-ups after |

## Install

With the [skills CLI](https://github.com/vercel-labs/skills), for every project on this machine:

```bash
npx skills add AndySakov/portfolio-skills -g -a claude-code
```

The repository is private, so this uses your normal git or GitHub CLI login. Leave out `-g` to install into the
current project only, and `-a claude-code` to pick agents interactively.

```bash
npx skills update -g      # pull the latest versions
npx skills ls -g          # see what's installed
```

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

Edit `skills/<name>/SKILL.md` and push, then run `npx skills update -g` on each machine.
