$ErrorActionPreference = "Stop"

$CommandsDir = "$env:USERPROFILE\.claude\commands"

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

Write-Host ""
Write-Host "Installing to:"
Write-Host "  Commands -> $CommandsDir"
Write-Host "  Vault    -> $VaultPath\Ideas"
Write-Host ""

# Create commands directory
New-Item -ItemType Directory -Force -Path $CommandsDir | Out-Null

# Copy command files, substituting the vault path
Get-ChildItem "commands\*.md" | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $content = $content.Replace("VAULT_PATH_PLACEHOLDER", $VaultPath)
    Set-Content -Path "$CommandsDir\$($_.Name)" -Value $content -NoNewline
}

# Create Ideas folder structure in vault
@("Inbox","Research","Comparisons","PRDs","Roadmaps","Datasets","Templates","Archive") | ForEach-Object {
    New-Item -ItemType Directory -Force -Path "$VaultPath\Ideas\$_" | Out-Null
}

# Copy vault templates
Copy-Item "vault-templates\Templates\*.md" "$VaultPath\Ideas\Templates\"
Copy-Item "vault-templates\README.md" "$VaultPath\Ideas\README.md"

Write-Host "Done."
Write-Host ""
Write-Host "Restart Claude Code, then try:"
Write-Host "  /analyze-idea `"your idea here`""
Write-Host ""
