#!/usr/bin/env bash
set -e

COMMANDS_DIR="$HOME/.claude/commands"

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

echo ""
echo "Installing to:"
echo "  Commands → $COMMANDS_DIR"
echo "  Vault    → $VAULT_PATH/Ideas"
echo ""

# Create commands directory
mkdir -p "$COMMANDS_DIR"

# Copy command files, substituting the vault path
for file in commands/*.md; do
    filename=$(basename "$file")
    sed "s|VAULT_PATH_PLACEHOLDER|$VAULT_PATH|g" "$file" > "$COMMANDS_DIR/$filename"
done

# Create Ideas folder structure in vault
for folder in Inbox Research Comparisons PRDs Roadmaps Datasets Templates Archive; do
    mkdir -p "$VAULT_PATH/Ideas/$folder"
done

# Copy vault templates
cp vault-templates/Templates/*.md "$VAULT_PATH/Ideas/Templates/"
cp vault-templates/README.md "$VAULT_PATH/Ideas/README.md"

echo "Done."
echo ""
echo "Restart Claude Code, then try:"
echo "  /analyze-idea \"your idea here\""
echo ""
