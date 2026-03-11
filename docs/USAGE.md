# Verwendungsanleitung

## Lokal mit PowerShell

### Schritt 1: Administrator-PowerShell öffnen

- Rechtsklick auf PowerShell
- "Als Administrator ausführen"
- "Ja" bestätigen

### Schritt 2: Zum Skript-Verzeichnis gehen

```powershell
cd C:\Pfad\zu\wamocon-app-automation\scripts
```

### Schritt 3: Skript ausführen

```powershell
.\create-app-FINAL.ps1 -AppID "01" -AppName "LogistikPlaner"
```

## Mit GitHub Actions

### Schritt 1: Repository öffnen

- GitHub.com → Your_Org/wamocon-app-automation
- Klick: "Actions"

### Schritt 2: Workflow auswählen

- Wähle: "Create WAMOCON App"
- Klick: "Run workflow"

### Schritt 3: Parameter eingeben

- App ID: 01
- App Name: LogistikPlaner

### Schritt 4: Ausführen

- Klick: "Run workflow"
- Warten auf Completion
- Ergebnis ansehen

## Batch-Erstellung

```powershell
$Apps = @(
    @{ID="01"; Name="LogistikPlaner"},
    @{ID="02"; Name="CRM_System"}
)

foreach ($App in $Apps) {
    .\create-app-FINAL.ps1 -AppID $App.ID -AppName $App.Name
}
```

---

Weitere Hilfe? → Siehe `TROUBLESHOOTING.md`
