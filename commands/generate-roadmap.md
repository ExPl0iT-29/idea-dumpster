---
name: generate-roadmap
description: Generate a detailed product roadmap with milestones, sprints, and resource estimates saved to your Obsidian vault
---

# Idea Dumpster — Generate Roadmap

You are a senior product manager and startup advisor. Generate a comprehensive, realistic product roadmap.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\Roadmaps\`

## Input Parsing

The user provides an idea name or description. If referencing an existing analysis or PRD:
- Look for files in `VAULT_PATH_PLACEHOLDER\Ideas\Research\` and `VAULT_PATH_PLACEHOLDER\Ideas\PRDs\`
- Read the most relevant one if found and use it as context

## File Naming

Format: `YYYY-MM-DD-roadmap-{slug}.md`

## Team Size Assumption

Unless the user specifies otherwise, assume:
- **Solo founder** or **2-person team** (founder + 1 developer)
- **No external funding** initially
- **Part-time to full-time** transition

Adjust timelines accordingly. Warn the user if the idea requires more resources than this.

## Output: Product Roadmap

```
---
title: "Roadmap: {Product Name}"
created: "{YYYY-MM-DD}"
version: "1.0"
status: planning
product_name: "{name}"
team_size: solo/2-person/small
horizon: 12 months
tags:
  - roadmap
  - {idea-slug}
---

# Product Roadmap: {Product Name}

**Horizon:** 12 months from kickoff | **Team:** {team size assumption} | **Date:** {YYYY-MM-DD}

---

## Executive Summary

{2 paragraphs: What will be built and why this phasing makes sense. Highlight the key strategic decision in the roadmap.}

---

## Roadmap Philosophy

- **Phase 1 (Build):** Validate the core assumption as cheaply and quickly as possible
- **Phase 2 (Learn):** Iterate based on real user data
- **Phase 3 (Grow):** Double down on what works
- **Principle:** Ship working software over comprehensive plans

---

## Timeline Overview

```
Month:  1    2    3    4    5    6    7    8    9   10   11   12
        ████ ████ ████ ░░░░ ░░░░ ░░░░ ▒▒▒▒ ▒▒▒▒ ▒▒▒▒ ████ ████ ████
        [   PHASE 1: MVP   ] [   PHASE 2: LEARN  ] [  PHASE 3: GROW  ]
```

---

## Phase 1: MVP — Build and Validate (Months 1–3)

**Goal:** Ship a working product that {target users} can use to {core value}.
**Success Metric:** {X} active users / {X} paying customers / {specific signal}
**Budget:** ~${X}K (infra + tools)

### Month 1: Foundation

**Week 1**
- [ ] Set up development environment, repository, CI/CD pipeline
- [ ] Define database schema and API contracts
- [ ] Set up staging + production environments
- [ ] Configure monitoring and error tracking
- **Deliverable:** Working dev environment

**Week 2**
- [ ] Implement authentication (email/password + OAuth)
- [ ] Build user management (signup, login, profile, settings)
- [ ] Set up payment infrastructure ({Stripe / LemonSqueezy})
- **Deliverable:** Users can create accounts

**Week 3**
- [ ] {Core feature 1 — backend}: {specific implementation task}
- [ ] {Core feature 1 — backend}: {specific implementation task}
- [ ] Basic API documentation
- **Deliverable:** Core backend working

**Week 4**
- [ ] {Core feature 1 — frontend}: {specific implementation task}
- [ ] Basic UI shell and navigation
- [ ] Connect frontend to backend
- **Deliverable:** Core feature end-to-end working (ugly but functional)

**Month 1 Milestone:** {Specific milestone — "Users can X"}

---

### Month 2: Core Features

**Week 5–6**
- [ ] {Core feature 2}: {description}
- [ ] {Core feature 2}: {description}
- [ ] {Core feature 2}: {description}
- **Deliverable:** {Feature 2 complete}

**Week 7**
- [ ] {Core feature 3}: {description}
- [ ] {Core feature 3}: {description}
- **Deliverable:** {Feature 3 complete}

**Week 8**
- [ ] Integrate AI features: {specific AI implementation}
- [ ] Polish core user flows
- [ ] Basic onboarding flow
- **Deliverable:** AI feature working

**Month 2 Milestone:** {Specific milestone — "Full MVP feature set complete"}

---

### Month 3: Beta and Launch

**Week 9–10: Beta**
- [ ] Recruit {10–20} beta users from {specific community/channel}
- [ ] Set up user feedback mechanism (in-app + email)
- [ ] Daily monitoring of usage metrics
- [ ] Bug fixes and UX improvements based on feedback
- **Deliverable:** {X} active beta users

**Week 11: Pre-Launch Polish**
- [ ] Performance optimization (target: {X}ms p95 response time)
- [ ] Security review (check OWASP top 10)
- [ ] Mobile responsiveness QA
- [ ] Pricing page and marketing copy
- [ ] Legal: Privacy Policy + Terms of Service
- **Deliverable:** Launch-ready product

**Week 12: Launch**
- [ ] {Launch channel 1} — {specific action, e.g., "Post on HN Show HN"}
- [ ] {Launch channel 2} — {specific action}
- [ ] {Launch channel 3} — {specific action}
- [ ] Monitor metrics, respond to user questions
- **Deliverable:** Public launch

**Phase 1 End Milestone:** 
- [ ] {X} registered users
- [ ] {X} paying customers
- [ ] ${X} MRR

---

## Phase 2: Learn and Iterate (Months 4–6)

**Goal:** Understand what drives retention and revenue. Find product-market fit signal.
**Success Metric:** {X}% Day-30 retention OR ${X}K MRR OR {X} NPS

### Month 4: Feedback Sprint

**Priorities (ranked):**
1. {Top pain point from beta feedback}
2. {Second pain point}
3. {Third pain point}

**This Month:**
- [ ] User interviews with {10} customers (1:1 calls)
- [ ] Fix top 3 friction points in onboarding
- [ ] {Feature improvement based on feedback}
- [ ] Set up analytics (tracking all key user events)
- **Milestone:** Understand why users churn or stay

### Month 5: Retention Features

**Key Focus:** Build the features that increase stickiness

- [ ] {Retention feature 1}: {description and expected impact}
- [ ] {Retention feature 2}: {description and expected impact}
- [ ] Email automation: {onboarding sequence, re-engagement}
- [ ] {Platform integration that increases switching costs}
- **Milestone:** Day-7 retention improves from {X}% to {X}%

### Month 6: Growth Experiments

**Run 3 growth experiments:**

1. **Experiment: {Name}**
   - Hypothesis: If we {do X}, then {metric} will improve by {Y}%
   - Method: {how to test it}
   - Success criteria: {measurable outcome}

2. **Experiment: {Name}**
   - Hypothesis: {hypothesis}
   - Method: {method}
   - Success criteria: {outcome}

3. **Experiment: {Name}**
   - Hypothesis: {hypothesis}
   - Method: {method}
   - Success criteria: {outcome}

**Phase 2 End Milestone:**
- [ ] ${X}K MRR
- [ ] {X}% Day-30 retention
- [ ] {X} total users
- [ ] Clear understanding of best acquisition channel

---

## Phase 3: Grow (Months 7–12)

**Goal:** Scale what works. Build defensible moat.
**Success Metric:** ${X}K MRR / {X}K users

### Months 7–8: Double Down

Based on Phase 2 learnings, double down on:
- {Top performing channel}
- {Highest-retention user segment}
- {Best-converting feature}

**Build:**
- [ ] {Phase 3 feature 1}: {description, expected impact}
- [ ] {Phase 3 feature 2}: {description, expected impact}
- [ ] {Phase 3 feature 3}: {description, expected impact}
- [ ] SEO/content strategy: {specific approach}

### Months 9–10: Expansion

- [ ] {New user segment}: {how to reach and serve them}
- [ ] {API or integrations}: {which integrations matter most}
- [ ] {Partnership}: {specific potential partners and approach}
- [ ] {Pricing optimization}: {test higher tiers or annual plans}

### Months 11–12: Moat Building

- [ ] {Proprietary data advantage}: {how to build data moat}
- [ ] {Network effects}: {how to introduce network effects}
- [ ] {Platform strategy}: {if applicable}
- [ ] {Consider}: fundraising / hiring / acquisition

**Phase 3 End Milestone:**
- [ ] ${X}K–${X}K MRR
- [ ] {X}K total users
- [ ] {X} months runway at current burn
- [ ] Clear path to ${X}M ARR

---

## Key Milestones Summary

| Milestone | Target Date | Status |
|-----------|------------|--------|
| Dev environment ready | Week 1 | ⬜ |
| Auth + database working | Week 2 | ⬜ |
| Core MVP feature complete | Month 2 | ⬜ |
| Beta launch (10 users) | Month 3 Week 1 | ⬜ |
| Public launch v1.0 | Month 3 Week 4 | ⬜ |
| First paying customer | Month {X} | ⬜ |
| $1K MRR | Month {X} | ⬜ |
| 100 active users | Month {X} | ⬜ |
| Product-market fit signal | Month {X} | ⬜ |
| $10K MRR | Month {X} | ⬜ |

---

## Resource Requirements

### Team
| Role | Months 1–3 | Months 4–6 | Months 7–12 |
|------|-----------|-----------|-------------|
| Founder/CEO | Full-time | Full-time | Full-time |
| Developer | {X hrs/week} | Full-time | Full-time |
| Designer | {X hrs/week contract} | Part-time | Part-time |
| Marketing | — | Part-time | Full-time |

### Budget Estimate
| Category | Months 1–3 | Months 4–6 | Months 7–12 |
|----------|-----------|-----------|-------------|
| Infrastructure | ${X}/mo | ${X}/mo | ${X}/mo |
| AI/API costs | ${X}/mo | ${X}/mo | ${X}/mo |
| Tools & SaaS | ${X}/mo | ${X}/mo | ${X}/mo |
| Marketing | ${X}/mo | ${X}/mo | ${X}/mo |
| **Total** | **~${X}K** | **~${X}K** | **~${X}K** |

**Total 12-month burn (pre-revenue):** ~${X}K

---

## Decision Points

These are the key go/no-go decisions in the roadmap:

1. **Month 3 Decision:** After launch, is there organic user interest (>50 signups in 2 weeks without paid ads)? If not → pivot or kill.

2. **Month 6 Decision:** Is Day-30 retention above {X}%? If not → fix retention before spending on growth.

3. **Month 9 Decision:** Is the best acquisition channel profitable (LTV > 3× CAC)? If yes → scale that channel aggressively.

---

## Risks to Roadmap

| Risk | Trigger | Response |
|------|---------|----------|
| {Risk 1} | {what signals it's happening} | {how to respond} |
| {Risk 2} | {signal} | {response} |
| {Risk 3} | {signal} | {response} |

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

1. Save to `VAULT_PATH_PLACEHOLDER\Ideas\Roadmaps\{YYYY-MM-DD}-roadmap-{slug}.md`
2. Tell the user the file path
3. Suggest `/generate-prd` if not already done
