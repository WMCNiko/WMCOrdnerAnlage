# Troubleshooting

## Problem 1: Template nicht gefunden

**Fehler:**
```
Fehler: Template nicht gefunden!
```

**Lösung:**

```powershell
Test-Path "$env:USERPROFILE\OneDrive - WAMOCON\TEMPLATE_APP_Standard"
```

Sollte `True` sein. Falls `False` → Template erstellen!

## Problem 2: ExecutionPolicy Fehler

**Fehler:**
```
Script execution is disabled on this system
```

**Lösung:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
```

## Problem 3: App existiert bereits

**Fehler:**
```
Fehler: Existiert bereits!
```

**Lösung:** Andere App-ID oder App-Name verwenden

## Problem 4: GitHub Actions funktioniert nicht

**Fehler:** Workflow wird nicht ausgeführt

**Lösungen:**

1. Self-Hosted Runner prüfen
2. Runner neu starten
3. Logs anschauen

---

**Weitere Hilfe?** Kontaktiere das Team!
