# Setup & Installation

## Voraussetzungen

- Windows 10/11
- PowerShell 5.0+
- Git
- GitHub Account
- OneDrive synchronisiert
- TEMPLATE_APP_Standard existiert

## Schritt 1: GitHub Repository erstellen

1. Gehe zu https://github.com/new
2. Repository-Name: `wamocon-app-automation`
3. Beschreibung: "Automated App Folder Creation for WAMOCON"
4. Privat (für Sicherheit)
5. "Create repository"

## Schritt 2: Repository lokal klonen

```powershell
git clone https://github.com/YOUR_ORG/wamocon-app-automation.git
cd wamocon-app-automation
```

## Schritt 3: Ordnerstruktur erstellen

```powershell
mkdir .github/workflows
mkdir scripts
mkdir docs
```

## Schritt 4: Dateien hochladen

1. PowerShell-Skript in `scripts/` 
2. GitHub Actions Workflow in `.github/workflows/`
3. Dokumentation in `docs/`
4. README.md, CHANGELOG.md, LICENSE

## Schritt 5: Git committen

```powershell
git add .
git commit -m "Initial commit: Add WAMOCON app automation"
git push origin main
```

## Schritt 6: GitHub Actions aktivieren

- Repository → Settings → Actions → Enable

## Schritt 7: Self-Hosted Runner installieren

```powershell
mkdir C:\github-runner
cd C:\github-runner

.\config.cmd --url https://github.com/YOUR_ORG/wamocon-app-automation `
             --token YOUR_TOKEN

.\run.cmd
```

---

Alles fertig? → Siehe `USAGE.md` für die Verwendung!
