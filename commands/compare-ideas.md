---
name: compare-ideas
description: Compare 2-4 ideas side-by-side and produce a ranked comparison report saved to your Obsidian vault
---

# Idea Dumpster — Compare Ideas

You are a senior product strategist. Your task is to compare multiple startup/product ideas and produce a rigorous side-by-side analysis with a clear winner recommendation.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\Comparisons\`

## Input Parsing

The user provides 2–4 ideas to compare. They may be:
1. Names of ideas (referencing existing analysis files in `VAULT_PATH_PLACEHOLDER\Ideas\Research\`)
2. Brief descriptions inline
3. A mix of both

If referencing existing reports, attempt to read those files first using the Read tool.

Extract: title, core concept, and any additional context for each idea.

## File Naming

Format: `YYYY-MM-DD-compare-{idea1-slug}-vs-{idea2-slug}.md`
Example: `2026-05-15-compare-crop-ai-vs-farm-marketplace.md`

## Comparison Framework

Evaluate each idea across these dimensions (score 0–10 each):

| Dimension | Description |
|-----------|-------------|
| Problem Severity | How painful and frequent is the core problem? |
| Market Size | Total addressable market potential |
| Competition | 10=blue ocean, 0=saturated |
| Technical Feasibility | Ease of building with a small team |
| Monetization | Clarity and strength of revenue model |
| Time to Revenue | How quickly can you start earning? |
| Founder-Market Fit | How well does your background suit this? |
| Defensibility | Long-term moat potential |
| Excitement | Your personal passion for this domain |
| Uniqueness | How differentiated from existing solutions |

**Viability Score = Σ(score × weight)** using the same weights as `/analyze-idea`

## Output Report

Generate the complete comparison report below:

---

```
---
title: "Idea Comparison: {Idea A} vs {Idea B} {vs Idea C if applicable}"
created: "{YYYY-MM-DD}"
status: compared
ideas_compared:
  - "{Idea A title}"
  - "{Idea B title}"
tags:
  - comparison
  - idea
---

# Idea Comparison: {Idea A} vs {Idea B}

> Comparing {N} ideas to determine which deserves your time and resources most.

---

## Quick Overview

| | {Idea A} | {Idea B} | {Idea C if applicable} |
|--|----------|----------|------------------------|
| **Tagline** | {one-liner} | {one-liner} | {one-liner} |
| **Category** | {type} | {type} | {type} |
| **Target User** | {who} | {who} | {who} |
| **Revenue Model** | {model} | {model} | {model} |
| **MVP Timeline** | {time} | {time} | {time} |
| **Est. MVP Cost** | ${X}K | ${X}K | ${X}K |
| **Viability Score** | {X}/100 | {X}/100 | {X}/100 |

---

## Scoring Matrix

| Dimension | Weight | {Idea A} | {Idea B} | {Idea C} |
|-----------|--------|----------|----------|----------|
| Problem Severity | ×2.0 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Market Size | ×2.0 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Competition | ×1.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Tech Feasibility | ×1.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Monetization | ×1.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Personal Excitement | ×0.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Time to MVP | ×0.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| Defensibility | ×0.5 | {X} ({score}) | {X} ({score}) | {X} ({score}) |
| **TOTAL** | | **{X}/100** | **{X}/100** | **{X}/100** |

---

## Deep Comparison

### Problem & Market

**{Idea A}:** {2-3 sentences on the problem and market opportunity}

**{Idea B}:** {2-3 sentences on the problem and market opportunity}

**Edge:** {Which idea has the stronger problem/market fit and why}

---

### Competitive Landscape

**{Idea A}:** {Key competitors and the gap you'd exploit}

**{Idea B}:** {Key competitors and the gap you'd exploit}

**Edge:** {Which has better competitive positioning and why}

---

### Technical Complexity

**{Idea A}:** {Honest assessment of what's hard to build}

**{Idea B}:** {Honest assessment of what's hard to build}

**Edge:** {Which is more technically achievable for your situation}

---

### Revenue Potential

| | {Idea A} | {Idea B} |
|--|----------|----------|
| Model | {model} | {model} |
| Target ARPU | ${X}/mo | ${X}/mo |
| Year 1 Revenue Potential | ${X}K | ${X}K |
| Year 3 Revenue Potential | ${X}M | ${X}M |
| Path to profitability | Month {X} | Month {X} |

**Edge:** {Which has stronger revenue potential and why}

---

### Risk Profile

| Risk Type | {Idea A} | {Idea B} |
|-----------|----------|----------|
| Market risk | {High/Med/Low} | {High/Med/Low} |
| Technical risk | {High/Med/Low} | {High/Med/Low} |
| Competitive risk | {High/Med/Low} | {High/Med/Low} |
| Regulatory risk | {High/Med/Low} | {High/Med/Low} |
| Funding risk | {High/Med/Low} | {High/Med/Low} |

**Overall Risk:** {Which is safer and for whom}

---

### Founder-Market Fit

**{Idea A}:** {How your background and interests align with this domain}

**{Idea B}:** {How your background and interests align with this domain}

**Edge:** {Which plays more to your strengths}

---

## Trade-off Analysis

### {Idea A}: Pros & Cons
**Pros:**
- {Pro 1 — specific}
- {Pro 2}
- {Pro 3}

**Cons:**
- {Con 1 — specific}
- {Con 2}
- {Con 3}

### {Idea B}: Pros & Cons
**Pros:**
- {Pro 1 — specific}
- {Pro 2}
- {Pro 3}

**Cons:**
- {Con 1 — specific}
- {Con 2}
- {Con 3}

---

## Strategic Considerations

### Can They Coexist?
{Can you pursue both ideas? Are they complementary? Would one enable the other? Or must you choose?}

### Portfolio Thinking
{If you had to put these on a risk/reward matrix, where does each land? Which fits your current life situation best?}

### Sequencing
{If you should build both eventually, which one should come first and why?}

---

## Winner Recommendation

### 🥇 Build First: {WINNING IDEA}

**Reasoning:** {3-5 sentences of direct reasoning. Why this idea wins on the dimensions that matter most for your situation. What it has that the other(s) don't.}

**What makes this the right choice now:** {Timing argument — why this moment is right for this idea}

**The critical assumption to validate:** {The one hypothesis that, if wrong, changes the recommendation}

### {Runner-up idea}: Revisit When
{Under what conditions should you come back to this idea? What would need to change for it to become more attractive?}

---

## Next Steps for Winner

1. **This week:** {Most important first action — specific}
2. **This month:** {Key milestone to hit}
3. **Run next:** `/generate-prd "{winning idea title}"` to create a full PRD

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/compare-ideas`*
```

---

## Post-Generation Actions

1. Save to `VAULT_PATH_PLACEHOLDER\Ideas\Comparisons\{filename}.md` using Write tool
2. Announce the winner and file path
3. Suggest running `/generate-prd` for the winning idea
