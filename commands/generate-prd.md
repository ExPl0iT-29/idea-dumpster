---
name: generate-prd
description: Generate a complete Product Requirements Document (PRD) for an idea, saved to your Obsidian vault
---

# Idea Dumpster — Generate PRD

You are a senior product manager at a top-tier tech company. Generate a comprehensive, engineering-ready Product Requirements Document.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\PRDs\`

## Input Parsing

The user provides an idea name or description. If referencing an existing analysis:
- Look for the file in `VAULT_PATH_PLACEHOLDER\Ideas\Research\`
- If found, read it and use it as context
- If not found, ask the user for more context or proceed with what's provided

## File Naming

Format: `YYYY-MM-DD-prd-{slug}.md`
Example: `2026-05-15-prd-crop-price-ai-platform.md`

## Output: Product Requirements Document

Generate the following PRD completely and specifically:

---

```
---
title: "PRD: {Product Name}"
created: "{YYYY-MM-DD}"
version: "1.0"
status: draft
product_name: "{name}"
author: "Tushar Satpute"
reviewers: []
tags:
  - prd
  - {idea-slug}
---

# PRD: {Product Name}

**Version:** 1.0 | **Status:** Draft | **Date:** {YYYY-MM-DD}

---

## 1. Document Purpose

This PRD defines the requirements for **{Product Name}** — {one-sentence description}. It serves as the authoritative reference for design, engineering, and stakeholder alignment.

**Intended Readers:** Engineers, Designers, Stakeholders

---

## 2. Product Overview

### Problem
{2-3 paragraphs: the specific problem, who has it, and why current solutions are inadequate}

### Solution
{2-3 paragraphs: what the product does, core mechanism, and how it solves the problem}

### Target Users
**Primary:** {specific user type}
**Secondary:** {specific user type}
**Out of scope:** {who this is NOT for — important for scope control}

### Success Criteria
The product is successful if, within {timeframe}:
- {Measurable outcome 1}
- {Measurable outcome 2}
- {Measurable outcome 3}

---

## 3. Goals and Non-Goals

### Goals (v1.0)
- [ ] {Goal 1 — specific, measurable}
- [ ] {Goal 2}
- [ ] {Goal 3}
- [ ] {Goal 4}
- [ ] {Goal 5}

### Non-Goals (explicitly out of scope for v1.0)
- {Non-goal 1} — *reason: {why deferred}*
- {Non-goal 2} — *reason: {why deferred}*
- {Non-goal 3} — *reason: {why deferred}*

---

## 4. User Stories

### Epic 1: {Core Feature Area}

**US-001:** As a {user type}, I want to {action} so that {benefit}.
- **Acceptance Criteria:**
  - Given {context}, when {action}, then {expected result}
  - Given {context}, when {action}, then {expected result}
- **Priority:** P0 (Must Have)
- **Estimate:** {S/M/L/XL}

**US-002:** As a {user type}, I want to {action} so that {benefit}.
- **Acceptance Criteria:**
  - Given {context}, when {action}, then {expected result}
- **Priority:** P0
- **Estimate:** {S/M/L/XL}

### Epic 2: {Feature Area}

**US-003:** As a {user type}, I want to {action} so that {benefit}.
- **Acceptance Criteria:**
  - {criteria}
- **Priority:** P1 (Should Have)
- **Estimate:** {S/M/L/XL}

**US-004:** As a {user type}, I want to {action} so that {benefit}.
- **Priority:** P1
- **Estimate:** {S/M/L/XL}

### Epic 3: {Feature Area}

**US-005:** As a {user type}, I want to {action} so that {benefit}.
- **Priority:** P2 (Nice to Have)
- **Estimate:** {S/M/L/XL}

{Add more epics and user stories as needed — minimum 8-10 user stories total}

---

## 5. Functional Requirements

### FR-001: {Requirement Name}
**Priority:** P0
**Description:** {Detailed description of what the system must do}
**Input:** {what triggers this}
**Output/Behavior:** {what the system produces or does}
**Edge Cases:** {what happens in unusual situations}

### FR-002: {Requirement Name}
**Priority:** P0
**Description:** {Detailed description}
**Input:** {trigger}
**Output/Behavior:** {result}
**Edge Cases:** {edge cases}

### FR-003: {Requirement Name}
**Priority:** P1
**Description:** {Detailed description}
**Input:** {trigger}
**Output/Behavior:** {result}

{Continue for all key functional requirements — aim for 8-15}

---

## 6. Non-Functional Requirements

### Performance
- **Response time:** {Key actions must complete within X seconds}
- **Throughput:** {System must handle X concurrent users}
- **Availability:** {X}% uptime SLA
- **Latency:** {AI features within X seconds, standard operations within X ms}

### Security
- **Authentication:** {JWT / OAuth 2.0 / other — specific requirement}
- **Authorization:** {Role-based access control requirements}
- **Data encryption:** At rest (AES-256) and in transit (TLS 1.3)
- **PII handling:** {specific requirements for personal data}
- **Audit logging:** {what user actions must be logged}

### Scalability
- **Initial capacity:** Support {X} concurrent users at launch
- **Growth capacity:** Scale to {X} users within {X} months without architecture changes
- **Data growth:** {Expected data volume per month}

### Reliability
- **Error handling:** All API errors must return standardized error responses
- **Data backup:** {backup frequency and retention}
- **Recovery time:** {RTO and RPO targets}

### Usability
- **Onboarding:** New users must reach core value within {X} minutes
- **Accessibility:** {WCAG 2.1 AA compliance / basic accessibility}
- **Mobile:** {mobile-first / responsive / native app}
- **Browser support:** {list supported browsers}

### Compliance
- {GDPR / CCPA / HIPAA / other — specific requirements}

---

## 7. User Interface Requirements

### Key Screens

**Screen 1: {Screen Name}**
- Purpose: {what user accomplishes here}
- Key elements: {list important UI elements}
- User action: {primary CTA}
- Success state: {what user sees on success}
- Error states: {how errors are displayed}

**Screen 2: {Screen Name}**
- Purpose: {purpose}
- Key elements: {elements}
- User action: {action}

**Screen 3: {Screen Name}**
- Purpose: {purpose}
- Key elements: {elements}

### Design Principles
- {Design principle 1 — specific to this product}
- {Design principle 2}
- {Design principle 3}

### UX Flows

**Primary Flow: {Core User Journey}**
1. {Step 1}
2. {Step 2}
3. {Step 3}
4. {Step 4 — completion/value moment}

**Secondary Flow: {Another Key Journey}**
1. {Step 1}
2. {Step 2}
3. {Step 3}

---

## 8. API Requirements

### External APIs Consumed
| API | Purpose | Auth Method | Rate Limit |
|-----|---------|-------------|------------|
| {API name} | {use case} | {API key / OAuth} | {rate limit} |
| {API name} | {use case} | {auth method} | {rate limit} |

### APIs to Expose (if applicable)
| Endpoint | Method | Description | Auth |
|----------|--------|-------------|------|
| `/api/v1/{resource}` | GET | {description} | Bearer token |
| `/api/v1/{resource}` | POST | {description} | Bearer token |
| `/api/v1/{resource}/{id}` | PUT | {description} | Bearer token |
| `/api/v1/{resource}/{id}` | DELETE | {description} | Bearer token |

---

## 9. Data Requirements

### Data Model (Key Entities)

**{Entity 1}**
```
{EntityName} {
  id: UUID (PK)
  {field}: {type} // {description}
  {field}: {type}
  {field}: {type}
  created_at: timestamp
  updated_at: timestamp
}
```

**{Entity 2}**
```
{EntityName} {
  id: UUID (PK)
  {entity1_id}: UUID (FK → Entity1)
  {field}: {type}
  {field}: {type}
}
```

### Data Retention
- User data: {retention period}
- Logs: {retention period}
- Analytics: {retention period}

### Data Privacy
- PII fields: {list fields containing PII}
- Deletion: {how user data deletion is handled — GDPR right to erasure}
- Export: {how user data export is handled}

---

## 10. Analytics and Tracking

### Events to Track
| Event | Trigger | Properties | Priority |
|-------|---------|------------|----------|
| `{event_name}` | {when it fires} | `{prop1}`, `{prop2}` | P0 |
| `{event_name}` | {when it fires} | `{prop1}` | P0 |
| `{event_name}` | {when it fires} | `{prop1}`, `{prop2}`, `{prop3}` | P1 |
| `{event_name}` | {when it fires} | `{prop1}` | P1 |

### Analytics Tools
- **Product analytics:** {Mixpanel / Amplitude / PostHog}
- **Error tracking:** {Sentry}
- **Performance monitoring:** {Datadog / New Relic / OpenTelemetry}
- **Business metrics:** {internal dashboard / Metabase}

---

## 11. Launch Criteria

### MVP Launch Checklist
- [ ] All P0 user stories implemented and tested
- [ ] Core flow end-to-end tested by {N} beta users
- [ ] Performance benchmarks met ({response time} p95)
- [ ] Security review completed
- [ ] Privacy policy and ToS published
- [ ] Error monitoring active
- [ ] Backup system verified
- [ ] On-call runbook documented

### Definition of Done (per feature)
- [ ] Unit tests written (>80% coverage)
- [ ] Integration tests passing
- [ ] Code reviewed and approved
- [ ] Deployed to staging
- [ ] QA sign-off
- [ ] Documentation updated

---

## 12. Dependencies and Risks

### Dependencies
| Dependency | Type | Owner | Risk if delayed |
|------------|------|-------|-----------------|
| {Dependency} | External / Internal | {owner} | {impact} |
| {Dependency} | External / Internal | {owner} | {impact} |

### Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| {Risk} | High/Med/Low | High/Med/Low | {mitigation} |
| {Risk} | High/Med/Low | High/Med/Low | {mitigation} |

---

## 13. Open Questions

| # | Question | Owner | Due Date | Status |
|---|----------|-------|----------|--------|
| 1 | {Question that needs resolution before build} | {who decides} | {date} | Open |
| 2 | {Question} | {who} | {date} | Open |
| 3 | {Question} | {who} | {date} | Open |

---

## 14. Appendix

### Glossary
- **{Term}:** {definition}
- **{Term}:** {definition}

### Related Documents
- Analysis Report: `[[{slug}-analysis]]`
- Roadmap: `[[{slug}-roadmap]]`
- Architecture: `[[{slug}-architecture]]`

### Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | {YYYY-MM-DD} | Tushar Satpute | Initial draft |

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/generate-prd`*
```

---

## Post-Generation Actions

1. Save to `VAULT_PATH_PLACEHOLDER\Ideas\PRDs\{YYYY-MM-DD}-prd-{slug}.md` using Write tool
2. Tell the user the file path
3. Suggest running `/generate-roadmap` next
