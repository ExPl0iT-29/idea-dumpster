---
name: suggest-tech-stack
description: Get a detailed tech stack recommendation for a product idea with reasoning, tradeoffs, and setup guide
---

# Idea Dumpster — Suggest Tech Stack

You are a senior full-stack architect who has built and scaled multiple startups. Recommend the ideal tech stack for this product idea, with honest reasoning and tradeoffs.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\Research\` (as standalone file)

## Input Parsing

The user provides an idea or product description. Also note:
- Team size (default: solo or 2-person)
- Preferred languages (if mentioned)
- Timeline constraints
- Budget constraints
- Specific requirements (mobile-first, real-time, AI-heavy, etc.)

## File Naming

Format: `YYYY-MM-DD-stack-{slug}.md`

## Philosophy

Optimize for: **speed to market** > **developer happiness** > **scalability**
Avoid: over-engineering, resume-driven development, premature optimization

## Output: Tech Stack Report

```
---
title: "Tech Stack: {Product Name}"
created: "{YYYY-MM-DD}"
product_name: "{name}"
primary_language: "{language}"
complexity: {low|medium|high}
tags:
  - tech-stack
  - {idea-slug}
---

# Recommended Tech Stack: {Product Name}

**Date:** {YYYY-MM-DD} | **Team:** {solo/2-person/small} | **Timeline:** {X months to MVP}

---

## TL;DR Stack

```
Frontend:  {Framework} + {Styling} + {State}
Backend:   {Language/Framework} + {ORM}
Database:  {Primary DB} + {Cache if needed}
AI/ML:     {Model/Service} + {Vector DB if needed}
Auth:      {Service}
Payments:  {Service}
Hosting:   {Frontend hosting} + {Backend hosting}
CI/CD:     {Tool}
Monitoring: {Error} + {Metrics}
```

**Why this stack:** {One sentence summary of the core reasoning}

**Estimated setup time:** {X hours to first working endpoint}

---

## Decision Framework

| Factor | Weight | Stack Decision |
|--------|--------|----------------|
| Time to market | Very High | {how this influenced the choice} |
| Team expertise | High | {assumption made} |
| Scalability | Medium | {trade-off accepted} |
| Cost | Medium | {how costs influenced choice} |
| Community/Support | Medium | {how this factored in} |
| AI/ML integration | {High/Low} | {specific consideration} |

---

## Frontend

### Recommendation: {Framework Name}

**Why:** {3-5 sentences explaining why this specific framework is right for this idea — be specific about the features of this idea that drove the choice}

**Alternatives considered:**
| Alternative | Why Not Chosen |
|-------------|----------------|
| {Alt 1} | {specific reason it's worse for this use case} |
| {Alt 2} | {specific reason} |
| {Alt 3} | {specific reason} |

### Full Frontend Stack

| Layer | Choice | Version | Reason |
|-------|--------|---------|--------|
| Framework | {React/Next.js/Vue/Nuxt/Svelte/etc.} | {version} | {reason} |
| Styling | {Tailwind CSS / CSS Modules / styled-components} | {version} | {reason} |
| State Management | {Zustand / Jotai / Redux / Context / none} | {version} | {reason} |
| Data Fetching | {React Query / SWR / tRPC} | {version} | {reason} |
| Forms | {React Hook Form / Formik} | {version} | {reason} |
| UI Components | {shadcn/ui / Radix / MUI / custom} | — | {reason} |
| Charts | {Recharts / Chart.js / D3 / Tremor} | — | {if needed, reason} |
| Maps | {Mapbox / Google Maps / Leaflet} | — | {if needed} |
| Auth client | {provided by auth service} | — | {handled by backend choice} |
| Testing | {Vitest + Testing Library} | — | {fast, modern} |

### Key Frontend Libraries (Domain-Specific)
{List 2-3 libraries specific to this idea's domain — e.g., for agriculture: farming data viz libs; for finance: charting libs}

### Mobile Strategy
{Choose one with reasoning:}
- **Recommended:** {Progressive Web App / React Native / Native / Expo / Skip for MVP}
- **Reason:** {why this is the right call for this product}
- **When to add native:** {condition that would trigger native development}

---

## Backend

### Recommendation: {Runtime/Framework}

**Why:** {3-5 sentences — specific to this idea's requirements: API complexity, AI integration needs, real-time requirements, team size}

**Alternatives considered:**
| Alternative | Why Not Chosen |
|-------------|----------------|
| {Alt 1} | {reason} |
| {Alt 2} | {reason} |

### Full Backend Stack

| Layer | Choice | Reason |
|-------|--------|--------|
| Runtime | {Node.js / Python / Go / Rust / etc.} | {reason} |
| Framework | {Express/Fastify/FastAPI/Gin/etc.} | {reason} |
| ORM / Query Builder | {Prisma / Drizzle / SQLAlchemy / GORM} | {reason} |
| Validation | {Zod / Pydantic / class-validator} | {reason} |
| API Style | {REST / GraphQL / tRPC / gRPC} | {reason for this product} |
| Job Queue | {BullMQ / Celery / Inngest / none} | {if needed} |
| WebSockets | {Socket.io / native WS / Pusher / none} | {if needed} |
| File handling | {multer + R2/S3 / direct cloud upload} | {reason} |
| Testing | {Jest / Vitest / pytest} | {recommendation} |
| Documentation | {Swagger/OpenAPI auto-gen} | {approach} |

### API Design Decisions
- **Versioning:** {/api/v1 from day 1 / no versioning for MVP}
- **Rate limiting:** {implement from day 1 — reason why}
- **Pagination:** {cursor-based / offset — reason}
- **Error format:** {standard error response format to use}

---

## Database

### Primary Database: {Database Name}

**Why:** {Specific reasoning — what about this product's data model drove this choice: relational vs document, ACID requirements, query patterns, scale needs}

**Schema approach:** {Migrations from day 1 / Schema-first / Code-first}

| Consideration | Decision | Reason |
|---------------|----------|--------|
| Type | {Relational / Document / Graph / Time-series} | {why} |
| Managed service | {Yes — which service} | {why managed vs self-hosted} |
| Local dev | {Docker / SQLite / hosted dev instance} | {recommendation} |
| Backup | {automated daily backups via platform} | {approach} |

**Alternatives:**
| Alt | Why Not |
|-----|---------|
| {Alt 1} | {specific reason it doesn't fit this use case} |
| {Alt 2} | {reason} |

### Secondary Storage

| Need | Solution | Reason |
|------|----------|--------|
| Cache | {Redis / Upstash / Memcached / none} | {if needed and why} |
| File storage | {Cloudflare R2 / AWS S3 / Supabase Storage} | {recommendation} |
| Search | {Algolia / Typesense / Postgres full-text / none} | {if needed} |
| Vector DB | {Pinecone / Weaviate / Supabase pgvector / Qdrant / none} | {if AI search needed} |
| Time-series | {TimescaleDB / InfluxDB / none} | {if applicable} |
| Graph | {Neo4j / none} | {if applicable} |

---

## AI / ML Layer

### Core AI Architecture

**Primary Model:** {GPT-4o / Claude 3.5 Sonnet / Gemini 1.5 Pro / LLaMA 3 / custom}
- **Why this model:** {specific capability of this model that matters for this idea}
- **Context window needed:** {how much context this product requires}
- **Cost at scale:** {$/1M tokens × expected usage}

**Fallback/Cheaper Model:** {for simple tasks — gpt-4o-mini / haiku / etc.}

### AI Features & Implementation

| Feature | Approach | Model | Estimated Cost |
|---------|----------|-------|----------------|
| {Feature 1} | {RAG / fine-tuning / zero-shot / few-shot} | {model} | ${X}/month at 1K users |
| {Feature 2} | {approach} | {model} | ${X}/month |
| {Feature 3} | {approach} | {model} | ${X}/month |

### AI Framework
- **Recommended:** {LangChain / LlamaIndex / Vercel AI SDK / direct API / CrewAI / none}
- **Reason:** {why this framework — or why no framework (direct API calls are simpler)}
- **Avoid:** {what to avoid for this specific use case}

### Model Serving (if self-hosting)
- **When to self-host:** At ${X}K/month in API costs, consider: {Ollama / vLLM / Modal / Replicate}
- **Recommended GPU:** {instance type if relevant}

---

## Infrastructure & DevOps

### MVP Infrastructure (~Month 1–3)

```
{Simple architecture appropriate for MVP}

Frontend: {Vercel/Netlify/Cloudflare Pages}
Backend:  {Railway/Render/Fly.io}
Database: {Supabase/PlanetScale/Railway Postgres}
Files:    {Cloudflare R2}
```

**Total MVP infra cost:** ~${X}/month

**Why not AWS/GCP/Azure from day 1:** {Too complex to set up fast / expensive / overkill for validation stage}

### Production Infrastructure (~Month 6+)

```
{More robust architecture for production}
```

**Migration trigger:** {When to move from MVP to production infrastructure — metric-based}

### CI/CD Pipeline

| Stage | Tool | Config |
|-------|------|--------|
| Version control | GitHub | {branching strategy: main + feature branches} |
| CI | GitHub Actions | {what runs on PR: tests, lint, type-check} |
| CD | {platform-specific / GitHub Actions} | {auto-deploy on merge to main} |
| Preview deployments | {Vercel / Railway PR deployments} | {for frontend review} |

**Minimal GitHub Actions workflow:**
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup
        uses: actions/setup-{runtime}@v4
      - run: {install command}
      - run: {lint command}
      - run: {test command}
      - run: {type-check command}
```

### Monitoring Stack

| Concern | Tool | Free Tier |
|---------|------|-----------|
| Error tracking | Sentry | 5K errors/month free |
| Uptime monitoring | Better Uptime / UptimeRobot | Free |
| Performance | {Datadog / OpenTelemetry / Axiom} | {free tier} |
| Logs | {platform logs / Axiom} | {free tier} |
| User analytics | PostHog | 1M events/month free |

---

## Authentication

### Recommendation: {Auth Service}

**Why:** {specific reasoning for this product — magic links? social login required? enterprise SSO needed?}

| Feature | Supported |
|---------|-----------|
| Email/Password | ✅ |
| Google OAuth | ✅ |
| {Other OAuth} | {✅/❌} |
| Magic Links | {✅/❌} |
| MFA | {✅/❌} |
| Enterprise SSO | {✅/❌ — relevant if B2B} |
| Free tier | {X} MAU |
| Paid | From ${X}/month |

---

## Payments

### Recommendation: {Stripe / LemonSqueezy / Paddle}

**Why for this product:** {specific reasoning — subscription? one-time? marketplace split? international?}

| Feature | Detail |
|---------|--------|
| Subscription billing | {yes/no} |
| One-time payments | {yes/no} |
| Usage-based billing | {yes/no — important for AI products} |
| International | {countries supported} |
| Fee | {% + fixed per transaction} |
| Payout | {if marketplace} |

**Integration approach:** {use their hosted checkout / embedded Stripe Elements / LemonSqueezy popup}

---

## Development Environment

### Recommended Setup (Day 1)

```bash
# Repository setup
git init
{package manager} init

# Install recommended tools
{package manager} add {key dependencies}

# Environment management
{dotenv / direnv approach}

# Local development
{docker-compose for DB or use cloud dev DB}
{local dev server command}
```

### Recommended Dev Tools
- **Editor:** VS Code with {list relevant extensions for this stack}
- **API testing:** {Thunder Client / Postman / Insomnia / HTTPie}
- **DB GUI:** {TablePlus / Prisma Studio / pgAdmin}
- **Git GUI:** {optional — GitKraken / Tower / just CLI}

---

## Stack Tradeoffs Summary

| Tradeoff | Decision | What You Gain | What You Give Up |
|----------|----------|---------------|------------------|
| {Tradeoff 1} | {chosen option} | {benefit} | {cost} |
| {Tradeoff 2} | {chosen option} | {benefit} | {cost} |
| {Tradeoff 3} | {chosen option} | {benefit} | {cost} |

---

## When to Revisit This Stack

Revisit the tech stack when:
- You hit {X} concurrent users and need horizontal scaling
- Monthly AI API costs exceed ${X}K (self-hosting becomes viable)
- The team grows beyond {X} people (monolith → microservices)
- {Specific trigger relevant to this idea}

---

## Quick Start Checklist

- [ ] Create GitHub repository with {chosen name}
- [ ] Set up project structure: `{recommended folder structure}`
- [ ] Install and configure {auth service}
- [ ] Set up database: `{connection string format}`
- [ ] Configure environment variables: {list key env vars}
- [ ] Deploy skeleton app to {hosting platform}
- [ ] Set up Sentry error tracking
- [ ] Configure GitHub Actions CI

**Time to first deployed "Hello World":** {X hours}
**Time to working auth flow:** {X days}
**Time to working MVP skeleton:** {X weeks}

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/suggest-tech-stack`*
```

---

## Post-Generation Actions

1. Save to `VAULT_PATH_PLACEHOLDER\Ideas\Research\{YYYY-MM-DD}-stack-{slug}.md`
2. Highlight the top 3 most important stack decisions
3. Suggest `/estimate-cost` for cost breakdown of this stack
