#!/usr/bin/env bash
set -e

CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
CODEX_COMMANDS_DIR="$HOME/.codex/commands"

echo ""
echo "idea-dumpster installer"
echo "----------------------"
echo ""

# Prompt for vault path
while true; do
    read -rp "Obsidian vault path (e.g. /Users/you/Documents/MyVault): " VAULT_PATH
    VAULT_PATH="${VAULT_PATH/#\~/$HOME}"  # expand ~ if used
    if [[ -d "$VAULT_PATH" ]]; then
        break
    else
        read -rp "That path doesn't exist. Create it? [y/N] " CREATE
        if [[ "$CREATE" =~ ^[Yy]$ ]]; then
            mkdir -p "$VAULT_PATH"
            break
        fi
    fi
done

# Detect which AI tools are available
HAS_CLAUDE=false
HAS_CODEX=false
command -v claude &>/dev/null && HAS_CLAUDE=true
command -v codex  &>/dev/null && HAS_CODEX=true

echo ""
echo "Detected tools:"
$HAS_CLAUDE && echo "  Claude Code — found" || echo "  Claude Code — not found (install from https://claude.ai/code)"
$HAS_CODEX  && echo "  OpenAI Codex — found" || echo "  OpenAI Codex — not found (install from https://github.com/openai/codex)"

echo ""
echo "Installing to:"
echo "  Vault -> $VAULT_PATH/Ideas"
$HAS_CLAUDE && echo "  Claude commands -> $CLAUDE_COMMANDS_DIR"
$HAS_CODEX  && echo "  Codex commands  -> $CODEX_COMMANDS_DIR"
echo ""

# ── Claude Code ────────────────────────────────────────────────────────────────
if $HAS_CLAUDE; then
    mkdir -p "$CLAUDE_COMMANDS_DIR"
    for file in commands/*.md; do
        filename=$(basename "$file")
        sed "s|VAULT_PATH_PLACEHOLDER|$VAULT_PATH|g" "$file" > "$CLAUDE_COMMANDS_DIR/$filename"
    done
    echo "Claude Code: commands installed to $CLAUDE_COMMANDS_DIR"
fi

# ── OpenAI Codex ───────────────────────────────────────────────────────────────
if $HAS_CODEX; then
    mkdir -p "$CODEX_COMMANDS_DIR"
    for file in codex/*.md; do
        filename=$(basename "$file")
        sed "s|VAULT_PATH_PLACEHOLDER|$VAULT_PATH|g" "$file" > "$CODEX_COMMANDS_DIR/$filename"
    done

    # Inject shell functions into ~/.bashrc and ~/.zshrc
    SHELL_SNIPPET='
# ── Idea Dumpster (Codex) ──────────────────────────────────────────────────────
_idea_dumpster_codex() {
    local cmd="$1"; shift
    local prompt_file="'"$CODEX_COMMANDS_DIR"'/${cmd}.md"
    if [[ ! -f "$prompt_file" ]]; then
        echo "idea-dumpster: unknown command: $cmd" >&2; return 1
    fi
    codex --approval-mode full-auto "$(cat "$prompt_file")

ARGUMENTS: $*"
}
analyze-idea()      { _idea_dumpster_codex analyze-idea      "$@"; }
generate-prd()      { _idea_dumpster_codex generate-prd      "$@"; }
generate-roadmap()  { _idea_dumpster_codex generate-roadmap  "$@"; }
compare-ideas()     { _idea_dumpster_codex compare-ideas     "$@"; }
estimate-cost()     { _idea_dumpster_codex estimate-cost     "$@"; }
find-datasets()     { _idea_dumpster_codex find-datasets     "$@"; }
suggest-tech-stack(){ _idea_dumpster_codex suggest-tech-stack "$@"; }
# ──────────────────────────────────────────────────────────────────────────────
'

    MARKER="# ── Idea Dumpster (Codex)"
    for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
        if [[ -f "$RC" ]]; then
            # Remove any previous installation block
            sed -i.bak "/$MARKER/,/^# ──────/d" "$RC" 2>/dev/null || true
            printf '%s\n' "$SHELL_SNIPPET" >> "$RC"
            echo "Codex: shell functions added to $RC"
        fi
    done

    echo "Codex: commands installed to $CODEX_COMMANDS_DIR"
fi

# ── Vault structure ────────────────────────────────────────────────────────────
for folder in Inbox Research Comparisons PRDs Roadmaps Datasets Templates Archive; do
    mkdir -p "$VAULT_PATH/Ideas/$folder"
done

cp vault-templates/Templates/*.md "$VAULT_PATH/Ideas/Templates/"
cp vault-templates/README.md "$VAULT_PATH/Ideas/README.md"

echo ""
echo "Done."
echo ""

if $HAS_CLAUDE; then
    echo "Claude Code — restart Claude Code, then try:"
    echo "  /analyze-idea \"your idea here\""
    echo ""
fi

if $HAS_CODEX; then
    echo "Codex — reload your shell (source ~/.bashrc or open a new terminal), then try:"
    echo "  analyze-idea \"your idea here\""
    echo ""
fi

if ! $HAS_CLAUDE && ! $HAS_CODEX; then
    echo "Neither Claude Code nor Codex was found in PATH."
    echo "Install at least one:"
    echo "  Claude Code: https://claude.ai/code"
    echo "  Codex CLI:   https://github.com/openai/codex"
fi
