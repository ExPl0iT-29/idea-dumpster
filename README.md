# idea-dumpster

Claude Code slash commands that turn rough startup and product ideas into structured research reports, saved directly to your Obsidian vault.

```
/analyze-idea "A CLI book reader with ASCII art and gamification"
```

Produces a 25-section report — market research, competitors, tech stack, cost estimates, viability score — and writes it to `{vault}/Ideas/Research/`. No browser tabs, no copy-pasting, no switching apps.

---

## Commands

| Command | What you get |
|---------|-------------|
| `/analyze-idea` | Full research report with weighted viability score (0–100) |
| `/compare-ideas` | Side-by-side matrix of 2–4 ideas |
| `/generate-prd` | Product requirements document |
| `/generate-roadmap` | 12-month roadmap with milestones |
| `/estimate-cost` | Infrastructure cost breakdown (MVP → scale) |
| `/find-datasets` | Relevant public datasets and APIs |
| `/suggest-tech-stack` | Stack recommendation with tradeoffs |

---

## Install

**macOS / Linux**

```bash
git clone https://github.com/your-username/idea-dumpster.git
cd idea-dumpster
chmod +x install.sh
./install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/your-username/idea-dumpster.git
cd idea-dumpster
.\install.ps1
```

The script asks for your Obsidian vault path, copies the commands to `~/.claude/commands/`, and creates the `Ideas/` folder structure in your vault.

Restart Claude Code after installing.

---

## Usage

### Analyze an idea

```
/analyze-idea "Subscription box for indie game soundtracks"
```

With extra context:

```
/analyze-idea "Subscription box for indie game soundtracks"
Notes: targeting US market, I have music licensing connections, budget ~$10K to start
```

### Compare ideas

```
/compare-ideas "indie game soundtrack box" vs "video game lore podcast network"
```

Or reference reports you've already generated:

```
/compare-ideas "farmwise-crop-price-ai-platform" vs "termread-cli-book-reader"
```

### Follow-up commands

Once you have an analysis you like, chain the other commands:

```
/generate-prd "Indie Game Soundtrack Box"
/generate-roadmap "Indie Game Soundtrack Box"
/estimate-cost "Indie Game Soundtrack Box" --scale 5000 users
```

---

## Report structure

Every `/analyze-idea` report includes:

1. Executive Summary
2. Problem Statement
3. Target Audience + Personas
4. Market Research (TAM/SAM/SOM)
5. Competitor Analysis
6. Unique Value Proposition
7. Monetization Strategies
8. Recommended Tech Stack
9. AI Recommendations
10. Development Complexity
11. MVP Features
12. Future Features
13. Product Roadmap
14. Architecture
15. Deployment Strategy
16. Cost Estimates
17. Third-Party Services
18. Public Datasets and APIs
19. Risks and Challenges
20. Legal and Compliance
21. Go-To-Market Strategy
22. SWOT Analysis
23. Success Metrics
24. Final Verdict
25. Viability Score (weighted 0–100)

Reports are saved as Markdown with YAML frontmatter, so they work as first-class Obsidian notes.

---

## Viability scoring

Each idea is scored across 8 dimensions with different weights:

| Dimension | Weight |
|-----------|--------|
| Problem Severity | ×2.0 |
| Market Size | ×2.0 |
| Competition Intensity | ×1.5 |
| Technical Feasibility | ×1.5 |
| Monetization Potential | ×1.5 |
| Personal Excitement | ×0.5 |
| Time to MVP | ×0.5 |
| Defensibility | ×0.5 |

Max score: 100. Interpretation: 80+ = build it, 65–79 = strong, 50–64 = validate first, below 50 = serious concerns.

---

## Vault structure

After install, your vault will have:

```
{vault}/Ideas/
├── Inbox/          ← dump raw ideas here before analyzing
├── Research/       ← generated analysis reports
├── Comparisons/    ← generated comparison reports
├── PRDs/           ← generated product requirements
├── Roadmaps/       ← generated roadmaps
├── Datasets/       ← dataset research
├── Templates/      ← blank templates for manual use
└── Archive/        ← move dead ideas here
```

---

## Examples

See [`examples/`](examples/) for a complete sample report.

---

## Requirements

- [Claude Code](https://claude.ai/code) — the commands run as Claude Code slash commands
- [Obsidian](https://obsidian.md) — reports are saved as Markdown to your vault
- No API keys, no accounts, no servers

---

## Customization

**Change vault path after install:**
Open `~/.claude/commands/analyze-idea.md` (and the other command files) and find the `Vault path:` line near the top. Update it to your vault path.

**Add your own sections:**
Edit any command file in `~/.claude/commands/`. They're just Markdown files with instructions Claude follows.

**Adjust scoring weights:**
Find the scoring table in `~/.claude/commands/analyze-idea.md` and change the `Weight` column values. Higher weight = more influence on the final score.

---

## How it works

These are [Claude Code custom commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands) — Markdown files that live in `~/.claude/commands/` and define instructions Claude follows when you invoke them. When you run `/analyze-idea`, Claude reads `analyze-idea.md`, follows the instructions, generates the report, and uses the `Write` tool to save it to your vault.

No external process, no background service. It's Claude generating structured output based on a detailed prompt template.

---

## Contributing

Issues and PRs welcome. If you add a new command (e.g., `/generate-pitch`, `/find-competitors`, `/estimate-revenue`) and it's useful, open a PR and I'll merge it.

---

## License

MIT
