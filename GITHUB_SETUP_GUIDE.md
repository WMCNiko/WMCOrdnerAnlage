# GitHub Setup - Schritt für Schritt

## 1. GitHub Repository erstellen

1. Gehe zu: https://github.com/new
2. Fülle aus:
   - **Repository name:** `wamocon-app-automation`
   - **Description:** `Automated App Folder Creation for WAMOCON`
   - **Visibility:** Private
3. Klick: "Create repository"

## 2. Repository lokal klonen

```powershell
git clone https://github.com/YOUR_USERNAME/wamocon-app-automation.git
cd wamocon-app-automation
```

## 3. Dateien hochladen

```powershell
# Verzeichnisstruktur erstellen
mkdir .github/workflows
mkdir scripts
mkdir docs

# Dateien kopieren
# - create-app-FINAL.ps1 → scripts/
# - create-app.yml → .github/workflows/
# - *.md Dateien → docs/
# - README.md, CHANGELOG.md, LICENSE → Hauptverzeichnis
```

## 4. Git Commit & Push

```powershell
git config --global user.name "Dein Name"
git config --global user.email "deine@email.de"

git add .
git commit -m "Initial commit: WAMOCON app automation"
git push origin main
```

## 5. GitHub Actions aktivieren

1. Repository → Settings → Actions
2. Stelle sicher: Actions sind aktiviert

## 6. Self-Hosted Runner installieren

```powershell
mkdir C:\github-runner
cd C:\github-runner

# Download Link von GitHub kopieren
Invoke-WebRequest -Uri "..." -OutFile runner.zip
Expand-Archive -Path runner.zip

# Konfigurieren
.\config.cmd --url https://github.com/YOUR_ORG/wamocon-app-automation `
             --token YOUR_TOKEN

# Starten
.\run.cmd
```

---

**Fertig!** Testen Sie jetzt den Workflow!
