---
name: analyze-idea
description: Analyze a startup/product/app/game idea and generate a comprehensive 25-section research report saved to your Obsidian vault
---

# Idea Dumpster — Analyze Idea

You are a senior product architect, startup analyst, and AI engineer. Your task is to deeply analyze the idea provided and generate a comprehensive, specific, actionable research report.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\Research\`
- **Today's date:** Use `2026-05-15` if no system date available, otherwise use actual current date

## Input Parsing

The user provides an idea after the command. Parse it as follows:
- If a quoted string: the entire string is the idea description; synthesize a short title
- If `"Title" — description`: title and description are separate
- If plain text: treat everything as the idea description, synthesize a title

Also extract any optional notes, links, or constraints the user appended.

## File Naming

Convert the idea title to a filename slug:
- Lowercase, hyphens instead of spaces
- Remove special characters
- Max 50 characters
- Format: `YYYY-MM-DD-{slug}.md`
- Example: "AI Crop Price Platform" → `2026-05-15-ai-crop-price-platform.md`

## Viability Scoring System

Score each dimension 0–10, multiply by weight, sum for final score (max 100):

| Dimension | Weight | Scoring Guide |
|-----------|--------|---------------|
| Problem Severity | ×2.0 | 0=no real pain, 10=critical daily suffering |
| Market Size | ×2.0 | 0=niche of niche, 10=massive global market |
| Competition Intensity | ×1.5 | 10=blue ocean, 0=saturated red ocean |
| Technical Feasibility | ×1.5 | 0=impossible, 10=build in a weekend |
| Monetization Potential | ×1.5 | 0=no clear model, 10=obvious high-margin revenue |
| Personal Excitement | ×0.5 | 0=meh, 10=you'd work on this for free |
| Time to MVP | ×0.5 | 10=<1 month, 7=1-3 months, 5=3-6 months, 2=6-12 months, 0=>1 year |
| Defensibility | ×0.5 | 0=easily copied, 10=strong data/network/IP moat |

Score interpretation:
- 80–100: Exceptional — drop everything and build
- 65–79: Strong — worth serious pursuit
- 50–64: Moderate — validate before committing
- 35–49: Weak — significant hurdles
- 0–34: Poor — reconsider fundamentally

## Report Generation Instructions

Research each section using your knowledge. Be specific and concrete — avoid generic statements. Use actual competitor names, real pricing, realistic estimates. If the user's domain is specialized (agriculture, healthcare, finance, etc.), apply domain expertise.

Use web search tools if available to find current market data, competitor pricing, and relevant datasets.

## Output: Complete Report

Generate the full report below, replacing ALL placeholders with real, specific content. Then save it using the Write tool.

---

REPORT STARTS BELOW THIS LINE — write the file content exactly as follows:

```
---
title: "{IDEA_TITLE}"
created: "{YYYY-MM-DD}"
status: researched
viability_score: {NUMERIC_SCORE}
complexity: {low OR medium OR high OR extreme}
estimated_mvp_time: "{e.g. 2-3 months}"
category: "{startup OR product OR app OR game OR tool OR service}"
tags:
  - idea
  - {relevant-tag}
  - {relevant-tag}
---

# {IDEA_TITLE}

> {One powerful tagline sentence — what it does, for whom, and the core benefit}

## 1. Executive Summary

{2-3 paragraphs. Cover: what the idea is, why now is the right time, the core opportunity, and your honest top-level recommendation. Be direct — don't hedge excessively.}

---

## 2. Problem Statement

**Core Problem:** {Specific, concrete description of the problem — not vague}

**Who suffers most:** {Primary affected group with specifics}

**Current workarounds:** {How people solve this today and exactly why those solutions fall short}

**Problem severity:** {Critical / High / Medium / Low} — {1-2 sentence justification with evidence}

**Pain frequency:** {How often does this problem occur? Daily/Weekly/Monthly}

---

## 3. Target Audience

### Primary Segment
- **Who:** {Specific demographic, role, or psychographic — not "small businesses"}
- **Estimated size:** {Number of potential users globally/regionally}
- **Pain level:** {High / Medium / Low} — {why}
- **Willingness to pay:** {High / Medium / Low} — {evidence or reasoning}
- **Where to find them:** {Specific communities, platforms, events}

### Secondary Segment
- **Who:** {Description}
- **Opportunity:** {Why they matter for growth}

### User Personas

**Persona 1: {Name}**
- Role: {job title or situation}
- Age/context: {brief background}
- Primary frustration: {specific pain point}
- What success looks like: {outcome they want}
- Quote: *"{How they'd describe their problem in their own words}"*

**Persona 2: {Name}**
- Role: {job title or situation}
- Primary frustration: {specific pain point}
- What success looks like: {outcome they want}

---

## 4. Market Research

| Metric | Estimate | Basis |
|--------|----------|-------|
| TAM (Total Addressable Market) | ${X}B | {how you arrived at this} |
| SAM (Serviceable Available Market) | ${X}M | {geographic/segment filter} |
| SOM (Year 3 Realistic Target) | ${X}M | {why achievable} |
| Market Growth Rate | {X}% CAGR | {trend driver} |
| Market Maturity | {Emerging / Growing / Mature / Declining} | {context} |

**Key Market Trends Driving This Opportunity:**
1. {Trend 1 — specific and current}
2. {Trend 2 — specific and current}
3. {Trend 3 — specific and current}

**Why Now:** {1-2 sentences on the specific timing advantage — what changed recently that makes this the right moment}

---

## 5. Competitor Analysis

| Competitor | Type | Founded | Est. Revenue | Strengths | Weaknesses | Pricing |
|------------|------|---------|--------------|-----------|------------|---------|
| {Name} | Direct / Indirect | {year} | {estimate} | {key strength} | {key weakness} | {pricing} |
| {Name} | Direct / Indirect | {year} | {estimate} | {key strength} | {key weakness} | {pricing} |
| {Name} | Direct / Indirect | {year} | {estimate} | {key strength} | {key weakness} | {pricing} |
| {Name} | Adjacent | {year} | {estimate} | {key strength} | {key weakness} | {pricing} |

**Competitive Gap (Your Opening):** {What none of them are doing that you could own — be very specific}

**Dead Competitors / Failed Attempts:** {Any notable failures in this space and why they failed — important signal}

---

## 6. Unique Value Proposition

**Core UVP:** {One powerful sentence — what you do, for whom, why it's different, and the tangible outcome}

**Positioning Statement:**
> For {target customer} who {need or opportunity}, {product name} is {category} that {key benefit}. Unlike {primary alternative}, our product {key differentiator}.

**Key Differentiators:**
1. {Differentiator 1 — specific, provable, defensible}
2. {Differentiator 2}
3. {Differentiator 3}

---

## 7. Monetization Strategies

### Primary Revenue Model
**{Model Name}** (e.g., Usage-Based SaaS)

| Tier | Target | Price | Included |
|------|--------|-------|----------|
| {Tier 1} | {who} | ${X}/mo | {features} |
| {Tier 2} | {who} | ${X}/mo | {features} |
| {Tier 3} | {who} | ${X}/mo | {features} |

- Target ARPU: ${X}/month
- Expected churn: {X}%/month
- Justification: {why this model fits this audience and problem}

### Alternative Revenue Streams
1. **{Model}** — {description, estimated % of total revenue}
2. **{Model}** — {description, estimated % of total revenue}
3. **{Model}** — {description, estimated % of total revenue}

### Revenue Projections (Conservative)
| Period | Paying Users | MRR | ARR |
|--------|-------------|-----|-----|
| Month 6 | {X} | ${X}K | — |
| Year 1 | {X} | ${X}K | ${X}K |
| Year 2 | {X} | ${X}K | ${X}K |
| Year 3 | {X} | ${X}M | ${X}M |

---

## 8. Recommended Tech Stack

### Frontend
- **Framework:** {recommendation} — {reason specific to this idea}
- **Styling:** {recommendation}
- **Mobile strategy:** {native / RN / PWA / skip for MVP}
- **Key libraries:** {specific libs relevant to the domain}

### Backend
- **Runtime/Framework:** {recommendation} — {reason}
- **Primary Database:** {recommendation} — {why this fits the data model}
- **Secondary Storage:** {if needed}
- **Cache:** {recommendation}
- **Queue/Jobs:** {if needed}

### AI/ML Layer
- **Primary:** {model/service} — {what it does in this product}
- **Fine-tuning:** {yes/no and approach}
- **Vector DB:** {if needed}

### Infrastructure
- **MVP hosting:** {specific platform + estimated cost}
- **Production hosting:** {specific platform}
- **CI/CD:** {recommendation}
- **Monitoring:** {recommendation}
- **Auth:** {recommendation}

**Stack Rationale:** {2-3 sentences on why this specific stack is right for this idea's constraints — team size, budget, scale requirements}

---

## 9. AI Recommendations

### AI-Powered Features to Build
1. **{Feature}**
   - Model/approach: {specific model or technique}
   - Implementation: {how to build it}
   - Value delivered: {user benefit}

2. **{Feature}**
   - Model/approach: {specific model or technique}
   - Implementation: {how to build it}
   - Value delivered: {user benefit}

3. **{Feature}**
   - Model/approach: {specific}
   - Implementation: {how}
   - Value delivered: {benefit}

### AI Services & APIs

| Service | Use Case | Free Tier | Cost at Scale |
|---------|----------|-----------|---------------|
| {Service} | {use case} | {free tier} | ${X}/month |
| {Service} | {use case} | {free tier} | ${X}/month |
| {Service} | {use case} | {free tier} | ${X}/month |

### Build vs Buy Decision
- **Build custom:** {what to build in-house and why}
- **Buy/API:** {what to purchase and why — cost of building isn't worth it}
- **Open source:** {specific OS models/tools to leverage}

---

## 10. Development Complexity

**Overall Complexity:** {Low | Medium | High | Extreme}

| Component | Complexity | Est. Dev Time | Key Challenge |
|-----------|------------|---------------|---------------|
| Frontend UI | {L/M/H} | {X weeks} | {specific challenge} |
| Backend API | {L/M/H} | {X weeks} | {specific challenge} |
| AI/ML | {L/M/H} | {X weeks} | {specific challenge} |
| Data pipeline | {L/M/H} | {X weeks} | {specific challenge} |
| Auth & billing | {L/M/H} | {X weeks} | {standard but needed} |
| Infrastructure | {L/M/H} | {X days} | {specific challenge} |

**Total MVP Estimate:** {X weeks / X months} with a {solo/2-person/small team}

**The Hard Parts:**
1. {Most difficult technical challenge — be specific}
2. {Second hardest — be specific}
3. {Third — be specific}

---

## 11. MVP Features

**Primary Assumption to Validate:** {The one hypothesis that must be true for this business to work}

**MVP Scope:** The absolute minimum to test this assumption with real users.

### Must Have (v1.0)
- [ ] {Feature 1} — {why essential to the core value prop}
- [ ] {Feature 2} — {why essential}
- [ ] {Feature 3} — {why essential}
- [ ] {Feature 4} — {why essential}
- [ ] {Feature 5} — {why essential}
- [ ] Basic auth (email/password)
- [ ] Payment integration (if monetized from day 1)

### Should Have (v1.1 — within 30 days of launch)
- [ ] {Feature}
- [ ] {Feature}
- [ ] {Feature}

### Won't Have in MVP (Scope Cut)
- {Feature} — reason: {why this can wait}
- {Feature} — reason: {why this can wait}
- {Feature} — reason: {distraction from core validation}

---

## 12. Future Features

### Phase 2 (Months 4–8): Retention & Depth
- {Feature} — {user value and why phase 2}
- {Feature} — {user value}
- {Feature} — {user value}

### Phase 3 (Months 9–15): Growth & Scale
- {Feature} — {user value}
- {Feature} — {user value}
- {Feature} — {opens new market segment}

### Long-Term Vision (15+ months)
{1-2 paragraphs: What does this become if everything goes right? What's the 10x version of this idea?}

---

## 13. Product Roadmap

```
PHASE 1: BUILD MVP (Months 1–3)
│
├── Month 1: Foundation
│   ├── Week 1: Architecture, repo, CI/CD, staging env
│   ├── Week 2: Auth, user management, database schema
│   ├── Week 3-4: Core feature #1 (backend)
│
├── Month 2: Core Features
│   ├── Week 5-6: Core feature #1 (frontend) + Core feature #2
│   ├── Week 7-8: Core feature #3 + Integration testing
│
└── Month 3: Launch
    ├── Week 9-10: Beta with 10-20 hand-picked users
    ├── Week 11: Bug fixes, performance, feedback integration
    └── Week 12: Public launch v1.0

PHASE 2: GROW (Months 4–8)
├── User feedback sprint (month 4)
├── Phase 2 features (months 5-7)
├── Marketing & SEO (month 6+)
└── Revenue optimization (month 8)

PHASE 3: SCALE (Months 9–15)
├── Enterprise/API tier (if applicable)
├── International expansion
├── Partnership integrations
└── Fundraising (if VC path)
```

**Key Milestones:**
- [ ] First paying customer: Month {X}
- [ ] 100 users: Month {X}
- [ ] $1K MRR: Month {X}
- [ ] $10K MRR: Month {X}
- [ ] Profitability: Month {X}

---

## 14. Architecture Recommendations

```
{Draw a simple ASCII architecture diagram OR describe the layers clearly}

Example structure:
┌─────────────────────────────────────┐
│           Client Layer              │
│   Web App (React/Next.js)  Mobile   │
└──────────────┬──────────────────────┘
               │ HTTPS/WSS
┌──────────────▼──────────────────────┐
│           API Gateway               │
│     (Rate limiting, Auth, CDN)      │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Application Layer           │
│   {Core Services}  {AI/ML Service}  │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│           Data Layer                │
│   {Primary DB}  {Cache}  {Storage}  │
└─────────────────────────────────────┘
```

**Key Architectural Decisions:**
1. **{Decision}** — chose this because {reason specific to this idea's requirements}
2. **{Decision}** — chose this because {reason}
3. **{Decision}** — chose this because {reason}

**Scalability Path:** {How to scale from 100 → 10,000 → 100,000 users without rewriting everything}

---

## 15. Deployment Strategy

### MVP Deployment (Day 1)
- **Frontend:** {e.g., Vercel — free tier, auto-deployments from GitHub}
- **Backend:** {e.g., Railway — $5/mo, easy PostgreSQL}
- **Domain:** {custom domain from day 1 — ~$12/yr}
- **SSL:** {auto via platform}
- **Setup time:** {X days}

### Production Deployment (Month 3+)
- **Platform:** {e.g., AWS / GCP / Azure / Fly.io}
- **Container strategy:** {Docker + {orchestration}}
- **Database:** {managed service name}
- **Scaling strategy:** {horizontal / vertical / serverless — why}
- **Backup strategy:** {approach}

### DevOps
- **CI/CD:** {GitHub Actions / GitLab CI — specific pipeline steps}
- **Environments:** dev → staging → production
- **Monitoring:** {Sentry for errors, {X} for metrics}
- **On-call:** {lightweight alerting approach for solo/small team}

---

## 16. Deployment Cost Estimate

### MVP Stage (0–500 users)
| Service | Monthly Cost | Notes |
|---------|-------------|-------|
| {Service} | ${X} | {what it covers} |
| {Service} | ${X} | {what it covers} |
| {Service} | ${X} | {what it covers} |
| Domain & SSL | ~${X} | Annual, averaged monthly |
| **Total MVP** | **~${X}/month** | {comment on whether it's cheap/expensive} |

### Growth Stage (500–5,000 users)
| Service | Monthly Cost | Notes |
|---------|-------------|-------|
| {Service} | ${X} | {scaled up reason} |
| {Service} | ${X} | {scaled up reason} |
| **Total Growth** | **~${X}/month** | |

### Scale Stage (5,000–50,000 users)
- **Estimated range:** ${X}–${X}/month
- **Unit economics:** ${X} infra cost per 1,000 users

---

## 17. Third-Party Services

| Service | Category | Purpose | Free Tier | Starting Price |
|---------|----------|---------|-----------|----------------|
| {Service} | Auth | {use case} | {free tier} | From ${X}/mo |
| {Service} | Payments | {use case} | {free tier} | {%} per transaction |
| {Service} | Email | {use case} | {free tier} | From ${X}/mo |
| {Service} | Analytics | {use case} | {free tier} | From ${X}/mo |
| {Service} | AI/ML | {use case} | {free tier} | {usage-based} |
| {Service} | Support | {use case} | {free tier} | From ${X}/mo |

---

## 18. Public Datasets and APIs

| Name | Type | Relevance | Access | URL |
|------|------|-----------|--------|-----|
| {Dataset/API name} | {Free / Open / Freemium / Paid} | {how it's used in the product} | {API key / direct download / scraping} | {url} |
| {Dataset/API name} | {Free / Open / Freemium / Paid} | {how it's used} | {access method} | {url} |
| {Dataset/API name} | {Free / Open / Freemium / Paid} | {how it's used} | {access method} | {url} |
| {Dataset/API name} | {Free / Open / Freemium / Paid} | {how it's used} | {access method} | {url} |

**Data Strategy:** {1-2 sentences on how you'll build a proprietary data moat over time — this is often a key differentiator}

---

## 19. Risks and Challenges

| Risk | Likelihood | Impact | Mitigation Strategy |
|------|-----------|--------|---------------------|
| {Risk 1} | High/Med/Low | High/Med/Low | {specific mitigation action} |
| {Risk 2} | High/Med/Low | High/Med/Low | {specific mitigation} |
| {Risk 3} | High/Med/Low | High/Med/Low | {specific mitigation} |
| {Risk 4} | High/Med/Low | High/Med/Low | {specific mitigation} |
| {Risk 5} | High/Med/Low | High/Med/Low | {specific mitigation} |

**The Kill Shot:** {The single risk most likely to kill this idea — what must be validated in the first 30 days to rule it out}

---

## 20. Legal and Compliance Considerations

- **Data Privacy:** {GDPR / CCPA / PIPEDA — what's required and key obligations}
- **Industry Regulations:** {sector-specific — e.g., HIPAA for health, PCI-DSS for payments, FAO regulations for agriculture}
- **Intellectual Property:** {patent landscape, trademark considerations, open-source license risks}
- **Terms of Service:** {key clauses this type of product must have}
- **User-Generated Content:** {if applicable — moderation, liability, DMCA}
- **Age restrictions:** {if applicable — COPPA for under-13}
- **International:** {jurisdictional concerns if targeting multiple countries}
- **AI-specific:** {model output disclaimers, bias liability, EU AI Act implications if applicable}

**Legal Priority for MVP:** {What legal work to do before launch vs. after reaching ${X}K revenue}

---

## 21. Go-To-Market Strategy

### Launch Strategy
**Primary approach:** {e.g., Community-led → Product Hunt → Content}

**Pre-launch (30 days before):**
- {Action 1 — specific}
- {Action 2 — specific}
- {Action 3 — specific}

**Launch week:**
- {Action 1}
- {Action 2}
- {Action 3}

### Customer Acquisition Channels

| Channel | Why It Works | Est. CAC | Timeline |
|---------|-------------|----------|----------|
| {Channel 1} | {specific reason it's good for this idea} | ${X} | Immediate |
| {Channel 2} | {specific reason} | ${X} | Month 2+ |
| {Channel 3} | {specific reason} | ${X} | Month 3+ |

### Getting First 100 Users
{Concrete, actionable plan — where to post, what to say, who to contact, what to offer. No generic advice.}

### Growth Loops
- **Viral loop:** {how the product naturally spreads — what triggers sharing}
- **Retention loop:** {what brings users back — habit formation or continuous value}
- **Acquisition loop:** {SEO / content / integrations that compounds over time}

---

## 22. SWOT Analysis

### Strengths (Internal, Positive)
- {Strength 1 — specific to this idea}
- {Strength 2}
- {Strength 3}

### Weaknesses (Internal, Negative)
- {Weakness 1 — honest assessment}
- {Weakness 2}
- {Weakness 3}

### Opportunities (External, Positive)
- {Opportunity 1 — market trend or gap}
- {Opportunity 2}
- {Opportunity 3}

### Threats (External, Negative)
- {Threat 1 — competitive or market risk}
- {Threat 2}
- {Threat 3}

---

## 23. Success Metrics

**North Star Metric:** {The single number that best captures product value — e.g., "Active farmers receiving price alerts weekly"}

*Why this metric:* {Why it's the right north star for this specific business}

### Acquisition Metrics
| Metric | Month 1 | Month 3 | Month 6 | Month 12 |
|--------|---------|---------|---------|----------|
| {Metric} | {target} | {target} | {target} | {target} |
| {Metric} | {target} | {target} | {target} | {target} |

### Activation Metrics
- {Metric}: Target {X}% (industry benchmark: {Y}%)
- {Metric}: Target {X}% within {Y} days of signup

### Retention Metrics
- **Day 1 retention:** Target {X}%
- **Day 7 retention:** Target {X}%
- **Day 30 retention:** Target {X}%
- **Monthly churn:** Target <{X}%

### Revenue Metrics
- **MRR Goal (Month 6):** ${X}K
- **MRR Goal (Month 12):** ${X}K
- **Target LTV:CAC ratio:** {X}:1
- **Payback period:** {X} months

---

## 24. Final Verdict

### Recommendation: {PURSUE / VALIDATE FIRST / DEPRIORITIZE / ABANDON}

{3-5 sentences of direct, honest assessment. Address: (1) why this idea has genuine merit, (2) what the biggest single risk is, (3) what must be true for this to work, (4) your personal recommendation on whether to pursue it, (5) the most valuable next step.}

**Best Case (3 years, everything goes right):** {Specific, optimistic but realistic outcome — revenue, users, exit potential}

**Worst Case (1 year, nothing works):** {What failure looks like and what you'd lose — time, money, opportunity cost}

**The One Thing:** {The single most important action to take in the next 7 days — be very specific}

---

## 25. Viability Score

| Dimension | Raw Score (0–10) | Weight | Weighted Points |
|-----------|-----------------|--------|-----------------|
| Problem Severity | {X}/10 | ×2.0 | {X×2} |
| Market Size | {X}/10 | ×2.0 | {X×2} |
| Competition Intensity | {X}/10 | ×1.5 | {X×1.5} |
| Technical Feasibility | {X}/10 | ×1.5 | {X×1.5} |
| Monetization Potential | {X}/10 | ×1.5 | {X×1.5} |
| Personal Excitement | {X}/10 | ×0.5 | {X×0.5} |
| Time to MVP | {X}/10 | ×0.5 | {X×0.5} |
| Defensibility | {X}/10 | ×0.5 | {X×0.5} |
| **TOTAL** | | | **{TOTAL}/100** |

## {TOTAL}/100 — {Exceptional / Strong / Moderate / Weak / Poor}

> {One sharp verdict sentence tying the score to the recommendation}

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/analyze-idea`*
```

---

## Post-Generation Actions

1. **Save the file** to `VAULT_PATH_PLACEHOLDER\Ideas\Research\{YYYY-MM-DD}-{slug}.md` using the Write tool
2. **Announce** the save path and viability score clearly to the user
3. **Offer next steps:** Ask if they'd like to run `/generate-prd`, `/generate-roadmap`, or `/compare-ideas` next
