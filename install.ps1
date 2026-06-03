$ErrorActionPreference = "Stop"

$ClaudeCommandsDir = "$env:USERPROFILE\.claude\commands"
$CodexCommandsDir  = "$env:USERPROFILE\.codex\commands"

Write-Host ""
Write-Host "idea-dumpster installer"
Write-Host "----------------------"
Write-Host ""

# Prompt for vault path
while ($true) {
    $VaultPath = Read-Host "Obsidian vault path (e.g. E:\Journal or C:\Users\you\Documents\MyVault)"
    $VaultPath = $VaultPath.Trim('"').Trim("'")

    if (Test-Path $VaultPath) {
        break
    } else {
        $Create = Read-Host "That path doesn't exist. Create it? [y/N]"
        if ($Create -match "^[Yy]$") {
            New-Item -ItemType Directory -Force -Path $VaultPath | Out-Null
            break
        }
    }
}

# Detect which AI tools are available
$HasClaude = $null -ne (Get-Command claude -ErrorAction SilentlyContinue)
$HasCodex  = $null -ne (Get-Command codex  -ErrorAction SilentlyContinue)

Write-Host ""
Write-Host "Detected tools:"
if ($HasClaude) { Write-Host "  Claude Code -- found" } else { Write-Host "  Claude Code -- not found (install from https://claude.ai/code)" }
if ($HasCodex)  { Write-Host "  OpenAI Codex -- found" } else { Write-Host "  OpenAI Codex -- not found (install from https://github.com/openai/codex)" }

Write-Host ""
Write-Host "Installing to:"
Write-Host "  Vault -> $VaultPath\Ideas"
if ($HasClaude) { Write-Host "  Claude commands -> $ClaudeCommandsDir" }
if ($HasCodex)  { Write-Host "  Codex commands  -> $CodexCommandsDir" }
Write-Host ""

# ── Claude Code ────────────────────────────────────────────────────────────────
if ($HasClaude) {
    New-Item -ItemType Directory -Force -Path $ClaudeCommandsDir | Out-Null
    Get-ChildItem "commands\*.md" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        $content = $content.Replace("VAULT_PATH_PLACEHOLDER", $VaultPath)
        Set-Content -Path "$ClaudeCommandsDir\$($_.Name)" -Value $content -NoNewline
    }
    Write-Host "Claude Code: commands installed to $ClaudeCommandsDir"
}

# ── OpenAI Codex ───────────────────────────────────────────────────────────────
if ($HasCodex) {
    New-Item -ItemType Directory -Force -Path $CodexCommandsDir | Out-Null
    Get-ChildItem "codex\*.md" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        $content = $content.Replace("VAULT_PATH_PLACEHOLDER", $VaultPath)
        Set-Content -Path "$CodexCommandsDir\$($_.Name)" -Value $content -NoNewline
    }
    Write-Host "Codex: commands installed to $CodexCommandsDir"

    # Inject PowerShell functions into the user's profile
    $ProfilePath = $PROFILE.CurrentUserAllHosts
    if (-not (Test-Path $ProfilePath)) {
        New-Item -ItemType File -Force -Path $ProfilePath | Out-Null
    }

    $ProfileContent = Get-Content $ProfilePath -Raw -ErrorAction SilentlyContinue

    # Remove any previous Idea Dumpster block
    $ProfileContent = $ProfileContent -replace '(?s)# -- Idea Dumpster \(Codex\) start.*?# -- Idea Dumpster \(Codex\) end\r?\n?', ''

    $CodexDir = $CodexCommandsDir  # capture for the heredoc

    $FunctionBlock = @"

# -- Idea Dumpster (Codex) start
function Invoke-IdeaDumpster {
    param([string]`$Command, [Parameter(ValueFromRemainingArguments=`$true)][string[]]`$Arguments)
    `$promptFile = "$CodexDir\`$Command.md"
    if (-not (Test-Path `$promptFile)) { Write-Error "idea-dumpster: unknown command: `$Command"; return }
    `$prompt = (Get-Content `$promptFile -Raw) + "`n`nARGUMENTS: `$(`$Arguments -join ' ')"
    codex --approval-mode full-auto `$prompt
}
function analyze-idea       { Invoke-IdeaDumpster analyze-idea       @args }
function generate-prd       { Invoke-IdeaDumpster generate-prd       @args }
function generate-roadmap   { Invoke-IdeaDumpster generate-roadmap   @args }
function compare-ideas      { Invoke-IdeaDumpster compare-ideas      @args }
function estimate-cost      { Invoke-IdeaDumpster estimate-cost      @args }
function find-datasets      { Invoke-IdeaDumpster find-datasets      @args }
function suggest-tech-stack { Invoke-IdeaDumpster suggest-tech-stack @args }
# -- Idea Dumpster (Codex) end
"@

    $ProfileContent + $FunctionBlock | Set-Content -Path $ProfilePath -NoNewline
    Write-Host "Codex: PowerShell functions added to $ProfilePath"
    Write-Host "       Run '. `$PROFILE' or open a new terminal to activate."
}

if (-not $HasClaude -and -not $HasCodex) {
    Write-Host "Neither Claude Code nor Codex was found in PATH."
    Write-Host "Install at least one:"
    Write-Host "  Claude Code: https://claude.ai/code"
    Write-Host "  Codex CLI:   https://github.com/openai/codex"
}

# ── Vault structure ────────────────────────────────────────────────────────────
@("Inbox","Research","Comparisons","PRDs","Roadmaps","Datasets","Templates","Archive") | ForEach-Object {
    New-Item -ItemType Directory -Force -Path "$VaultPath\Ideas\$_" | Out-Null
}

Copy-Item "vault-templates\Templates\*.md" "$VaultPath\Ideas\Templates\"
Copy-Item "vault-templates\README.md" "$VaultPath\Ideas\README.md"

Write-Host ""
Write-Host "Done."
Write-Host ""

if ($HasClaude) {
    Write-Host "Claude Code -- restart Claude Code, then try:"
    Write-Host "  /analyze-idea `"your idea here`""
    Write-Host ""
}

if ($HasCodex) {
    Write-Host "Codex -- reload your profile (. `$PROFILE) or open a new terminal, then try:"
    Write-Host "  analyze-idea `"your idea here`""
    Write-Host ""
}
