# idea-dumpster



```
 _     _                      _                           _            
(_)   | |                    | |                         | |           
 _  __| | ___  __ _ ______ __| |_   _ _ __ ___  _ __  ___| |_ ___ _ __ 
| |/ _` |/ _ \/ _` |______/ _` | | | | '_ ` _ \| '_ \/ __| __/ _ \ '__|
| | (_| |  __/ (_| |     | (_| | |_| | | | | | | |_) \__ \ ||  __/ |   
|_|\__,_|\___|\__,_|      \__,_|\__,_|_| |_| |_| .__/|___/\__\___|_|   
                                               | |                     
                                               |_|                     
```


Slash commands for **Claude Code** and shell functions for **OpenAI Codex** that turn rough startup and product ideas into structured research reports, saved directly to your Obsidian vault.

**Claude Code:**
```
/analyze-idea "A tool where I can dump ideas and get proper research"
```

**Codex (after install):**
```
analyze-idea "A tool where I can dump ideas and get proper research"
```

Produces a 25-section report — market research, competitors, tech stack, cost estimates, viability score — and writes it to `{vault}/Ideas/Research/`. No browser tabs, no copy-pasting, no switching apps.

---

## Commands

| Command | Claude Code | Codex | What you get |
|---------|-------------|-------|-------------|
| `analyze-idea` | `/analyze-idea` | `analyze-idea` | Full research report with weighted viability score (0–100) |
| `compare-ideas` | `/compare-ideas` | `compare-ideas` | Side-by-side matrix of 2–4 ideas |
| `generate-prd` | `/generate-prd` | `generate-prd` | Product requirements document |
| `generate-roadmap` | `/generate-roadmap` | `generate-roadmap` | Sprint-level roadmap with milestones |
| `estimate-cost` | `/estimate-cost` | `estimate-cost` | Infrastructure cost breakdown (MVP → scale) |
| `find-datasets` | `/find-datasets` | `find-datasets` | Relevant public datasets and APIs |
| `suggest-tech-stack` | `/suggest-tech-stack` | `suggest-tech-stack` | Stack recommendation with tradeoffs |

---

## Install

**macOS / Linux**

```bash
git clone https://github.com/ExPl0iT-29/idea-dumpster.git
cd idea-dumpster
chmod +x install.sh
./install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/ExPl0iT-29/idea-dumpster.git
cd idea-dumpster
.\install.ps1
```

The installer:
- Asks for your Obsidian vault path
- Auto-detects which AI tools you have installed (Claude Code, Codex, or both)
- Copies commands to the right locations for each tool
- For Codex: injects shell functions into your `~/.bashrc` / `~/.zshrc` (Unix) or PowerShell `$PROFILE` (Windows)
- Creates the `Ideas/` folder structure in your vault

Restart Claude Code and/or reload your shell after installing.

---

## Usage

### Claude Code

```
/analyze-idea "Subscription box for indie game soundtracks"
```

With extra context:

```
/analyze-idea "Subscription box for indie game soundtracks"
Notes: targeting US market, I have music licensing connections, budget ~$10K to start
```

### Codex

```bash
analyze-idea "Subscription box for indie game soundtracks"
```

With extra context:

```bash
analyze-idea "Subscription box for indie game soundtracks — targeting US market, music licensing connections, budget ~$10K"
```

> Codex commands run with `--approval-mode full-auto` so the agent generates and saves the report without prompting for each step. You can review the file in your vault when it finishes.

### Compare ideas

**Claude Code:**
```
/compare-ideas "indie game soundtrack box" vs "video game lore podcast network"
```

**Codex:**
```bash
compare-ideas "indie game soundtrack box" vs "video game lore podcast network"
```

Or reference reports you've already generated:

```
/compare-ideas "farmwise-crop-price-ai-platform" vs "termread-cli-book-reader"
compare-ideas "farmwise-crop-price-ai-platform" vs "termread-cli-book-reader"
```

### Follow-up commands

Once you have an analysis you like, chain the other commands:

**Claude Code:**
```
/generate-prd "Indie Game Soundtrack Box"
/generate-roadmap "Indie Game Soundtrack Box"
/estimate-cost "Indie Game Soundtrack Box" --scale 5000 users
```

**Codex:**
```bash
generate-prd "Indie Game Soundtrack Box"
generate-roadmap "Indie Game Soundtrack Box"
estimate-cost "Indie Game Soundtrack Box" --scale 5000 users
```

---

## Report structure

Every `analyze-idea` report includes:

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

- [Claude Code](https://claude.ai/code) and/or [OpenAI Codex CLI](https://github.com/openai/codex) — at least one must be installed
- [Obsidian](https://obsidian.md) — reports are saved as Markdown to your vault
- No API keys beyond what your chosen AI tool requires

---

## How it works

### Claude Code

Commands are [Claude Code custom slash commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands) — Markdown files in `~/.claude/commands/` that Claude follows when you type `/analyze-idea`. Claude generates the report and uses its `Write` tool to save it directly to your vault.

### Codex

Commands are Markdown prompt files installed to `~/.codex/commands/` (Unix) or `%USERPROFILE%\.codex\commands\` (Windows). The installer adds shell functions (`analyze-idea`, `generate-prd`, etc.) to your shell profile. Each function reads the corresponding prompt file and passes it to `codex --approval-mode full-auto`, which generates and writes the report autonomously.

Both tools read the same underlying prompt logic — the only differences are file format (YAML frontmatter for Claude Code, plain Markdown for Codex) and how files are saved (Claude's `Write` tool vs. Codex's shell file writes).

---

## Customization

**Change vault path after install:**

- Claude Code: edit the `Vault path:` line in `~/.claude/commands/analyze-idea.md` (and other command files)
- Codex: edit the same line in `~/.codex/commands/analyze-idea.md`

**Add your own sections:**
Edit any command file in `~/.claude/commands/` or `~/.codex/commands/`. They're plain Markdown files.

**Adjust scoring weights:**
Find the scoring table in `analyze-idea.md` and change the `Weight` column values. Higher weight = more influence on the final score.

---

## Contributing

Issues and PRs welcome. If you add a new command (e.g., `generate-pitch`, `find-competitors`, `estimate-revenue`) and it's useful, open a PR and I'll merge it.

When adding a new command, add it to both `commands/` (Claude Code, with YAML frontmatter) and `codex/` (Codex, without frontmatter), and update the shell function lists in both install scripts.

---

## License

MIT
