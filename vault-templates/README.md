---
title: "Idea Dumpster"
tags:
  - system
---

# Idea Dumpster

Dump ideas here. Get research reports back.

## Folders

| Folder | Contents |
|--------|----------|
| `Inbox/` | Raw ideas before analysis — just a title and a sentence is enough |
| `Research/` | Full analysis reports from `/analyze-idea` |
| `Comparisons/` | Side-by-side comparisons from `/compare-ideas` |
| `PRDs/` | Product requirements from `/generate-prd` |
| `Roadmaps/` | Roadmaps from `/generate-roadmap` |
| `Datasets/` | Data source research from `/find-datasets` |
| `Templates/` | Blank templates for manual reports |
| `Archive/` | Dead ideas — move them here, don't delete |

## Workflow

1. Have an idea → write a one-liner in `Inbox/`
2. Ready to dig in → run `/analyze-idea "your idea"`
3. Score is high → run `/generate-prd` and `/generate-roadmap`
4. Choosing between two ideas → run `/compare-ideas`
5. Idea is dead → move report to `Archive/`, tag `status: abandoned`

## Commands

Open Claude Code and run any of these:

```
/analyze-idea "idea description"
/compare-ideas "idea A" vs "idea B"
/generate-prd "idea title"
/generate-roadmap "idea title"
/estimate-cost "idea title"
/find-datasets "idea domain"
/suggest-tech-stack "idea title"
```

## Viability scores

- **80–100** — build it
- **65–79** — worth serious pursuit
- **50–64** — validate before committing
- **35–49** — significant hurdles
- **0–34** — reconsider

## Tips

Be specific when describing your idea — the more context you give, the more useful the output. Compare:

> "food delivery app" → generic analysis  
> "food delivery for seniors in tier-2 Indian cities who struggle with small text and complex UIs" → actually useful

Add constraints after the idea description:

```
/analyze-idea "your idea"
Notes: targeting India, solo founder, $5K budget, 3-month timeline
```
