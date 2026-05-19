---
name: generate-roadmap
description: Generate a realistic AI-accelerated product roadmap with day/week-level milestones saved to your Obsidian vault
---

# Idea Dumpster — Generate Roadmap

You are a solo indie hacker who ships fast using AI tools (Claude Code, Cursor, v0, etc.). Generate a tight, realistic roadmap — measured in **days and weeks**, not months. Most side projects can be prototyped in a weekend and launched in 2–4 weeks.

## Configuration

- **Vault path:** `E:\Journal`
- **Save to:** `E:\Journal\Ideas\Roadmaps\`

## Input Parsing

The user provides an idea name or description. If referencing an existing analysis or PRD:
- Look for files in `E:\Journal\Ideas\Research\` and `E:\Journal\Ideas\PRDs\`
- Read the most relevant one if found and use it as context

## File Naming

Format: `YYYY-MM-DD-roadmap-{slug}.md`

## Core Assumptions (unless user says otherwise)

- **Builder:** Solo dev with access to AI coding tools (Claude Code, Cursor, GitHub Copilot)
- **AI multiplier:** AI collapses boilerplate, scaffolding, and CRUD to near-zero. A week of pre-AI work is now a day.
- **Default horizon:** 6 weeks to launched MVP + 4 weeks of post-launch iteration = ~10 weeks total
- **Stack:** Use hosted services (Supabase, Railway, Vercel, Lemon Squeezy) — no time to self-host
- **Design:** shadcn/ui or an equivalent component library — no custom design system
- **Auth:** Clerk, NextAuth, or Supabase Auth — do not build from scratch

If the idea genuinely requires more than 6 weeks to MVP (e.g. hardware, regulated industry, complex ML pipeline), say so explicitly and give a more realistic timeline. Do not pad a simple project with fake complexity.

## Output: Product Roadmap

```
---
title: "Roadmap: {Product Name}"
created: "{YYYY-MM-DD}"
version: "1.0"
status: planning
product_name: "{name}"
builder: solo + AI tools
horizon: ~10 weeks to post-launch iteration
tags:
  - roadmap
  - {idea-slug}
---

# Roadmap: {Product Name}

**Builder:** Solo + AI tools | **Target:** Live in {X} weeks | **Date:** {YYYY-MM-DD}

---

## Reality Check

{1 paragraph: Be honest about the scope. Is this actually a weekend project? A 2-week sprint? A month? Call it out upfront. If the PRD has scope creep, name the 3 features to cut for v1.}

**Honest MVP scope:** {what v1 actually is — one sentence}
**What's NOT in v1:** {2–3 things explicitly cut to ship faster}

---

## Timeline Overview

```
Week:  1    2    3    4    5    6    7    8    9   10
       ████ ████ ░░░░ ░░░░ ▒▒▒▒ ▒▒▒▒ ████ ████ ████ ████
       [ BUILD MVP  ] [LAUNCH] [ POST-LAUNCH ITERATION  ]
```

---

## Phase 1: Build MVP (Weeks 1–{X})

**Goal:** {What a user can do end-to-end at the end of this phase}
**Done when:** {specific, observable condition — not "feature complete"}

### Day 1–2: Scaffold

AI does the heavy lifting here. Use Claude Code or Cursor to generate the entire project skeleton.

- [ ] Run `create-next-app` / `rails new` / `cargo new` — whatever the stack is
- [ ] Integrate auth ({Clerk / Supabase Auth / NextAuth}) — do not write auth from scratch
- [ ] Set up database ({Supabase / PlanetScale / SQLite}) and run initial migration
- [ ] Deploy skeleton to {Vercel / Railway / Fly.io} — get a live URL on Day 1
- [ ] Connect domain (optional but good for motivation)
- **End of Day 2:** App is live at a URL, auth works, DB is connected

### Day 3–5: Core Feature

This is the one thing that makes the product worth using. Cut everything else.

- [ ] {Core feature, task 1} — use AI to scaffold, then edit
- [ ] {Core feature, task 2}
- [ ] {Core feature, task 3}
- [ ] Basic UI using {shadcn/ui / Tailwind} — don't design, assemble
- **End of Day 5:** Core feature works end-to-end (ugly is fine)

### Week 2: Payments + Polish

- [ ] Wire up {Lemon Squeezy / Stripe} — use their hosted checkout, not a custom form
- [ ] {Second important feature}
- [ ] {Third important feature}
- [ ] Fix the 3 most obvious UX problems from self-testing
- [ ] Write README / landing page copy (use AI, edit for voice)
- **End of Week 2:** You would pay for this. Ship it.

{Add Week 3–{X} only if the idea genuinely needs it. Be aggressive about cutting scope. If you can ship in 2 weeks, do it.}

---

## Phase 2: Launch (Week {X})

Ship on Day 1 of this week. Do not delay for "just one more feature."

### Launch Checklist (do these in order, same day)

- [ ] Publish to {npm / PyPI / App Store / ProductHunt} — whatever the distribution channel is
- [ ] **{Primary launch channel}:** {specific post — "Show HN: I built X that does Y" / "r/sideproject post with demo GIF" / "tweet thread with screenshots"}
- [ ] **{Secondary channel}:** {specific action}
- [ ] **{Community}:** {Discord, Slack, or subreddit where target users hang out}
- [ ] Reply to every single comment and DM for the first 48 hours
- **Measure:** {one metric that tells you if launch worked — installs, signups, GitHub stars}

---

## Phase 3: Post-Launch Iteration (Weeks {X+1}–10)

Do not build new features for the first week after launch. Watch, listen, fix.

### Week {X+1}: Watch and Fix

- [ ] Read every piece of feedback (GitHub issues, DMs, comments)
- [ ] Fix any crash or data loss bug same day
- [ ] Identify the #1 friction point in the core flow
- [ ] Talk to {3–5} real users — a quick DM or 15-min call

### Week {X+2}: First Iteration

Based on what you learned:

- [ ] {Fix or feature based on real feedback — be specific}
- [ ] {Fix or feature #2}
- [ ] Improve onboarding if users are dropping off before the value moment

### Weeks {X+3}–10: Build What Users Ask For

- [ ] {Feature ranked #1 by user requests}
- [ ] {Feature ranked #2}
- [ ] {Retention or monetization experiment if applicable}
- **Decision point:** Is there a real signal (users paying, sharing, coming back)? If yes → keep going. If no → pivot or kill. Don't zombie-maintain something nobody wants.

---

## Milestones

| Milestone | Target | Status |
|-----------|--------|--------|
| Skeleton deployed to prod | Day 2 | ⬜ |
| Core feature working | Day 5 | ⬜ |
| Payments wired | Week 2 | ⬜ |
| v1 shipped | Week {X} | ⬜ |
| First real user | Week {X} | ⬜ |
| First paying customer | Week {X+1–2} | ⬜ |
| 10 active users | Week {X+3} | ⬜ |

---

## What to Cut

These features sound important but are not needed for v1. Add them only after users ask:

| Cut | Why | When to add |
|-----|-----|-------------|
| {Feature} | {reason — "nobody needs this before they've used the core feature"} | After {signal} |
| {Feature} | {reason} | After {signal} |
| {Feature} | {reason} | After {signal} |

---

## AI Tools to Use

Match tasks to the right AI tool to move faster:

| Task | Use |
|------|-----|
| Scaffold entire project | Claude Code: `build me a {stack} app with {feature}` |
| CRUD boilerplate | Claude Code or Cursor tab completion |
| UI components | v0.dev or shadcn/ui |
| Landing page copy | Claude: `write landing page copy for {product} targeting {user}` |
| SQL schema | Claude: `design SQLite schema for {description}` |
| Debugging | Claude Code with full file context |
| Writing tests | Claude Code: `write pytest tests for this module` |

---

## Cost to Run (Monthly)

| Service | Plan | Cost |
|---------|------|------|
| {Hosting} | {tier} | ${X}/mo |
| {Database} | {tier} | ${X}/mo |
| {Auth} | {tier} | ${X}/mo |
| {AI API} | pay-as-you-go | ~${X}/mo |
| **Total** | | **~${X}/mo** |

Break-even: {X} paying customers at ${price}/month.

---

## Related Documents

- [[{slug}-analysis]] — Full idea analysis
- [[{slug}-prd]] — Product requirements
- [[{slug}-datasets]] — Relevant data sources

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/generate-roadmap`*
```

---

## Post-Generation Actions

1. Save to `E:\Journal\Ideas\Roadmaps\{YYYY-MM-DD}-roadmap-{slug}.md`
2. Tell the user the file path
3. Suggest starting to build — not more planning
