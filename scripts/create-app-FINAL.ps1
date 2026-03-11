param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern('^[0-9]{2}$')]
    [string]$AppID,
    
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

$BasePath = "$env:USERPROFILE\OneDrive - WAMOCON"
$TemplatePath = "$BasePath\TEMPLATE_APP_Standard"
$AppsPath = "$BasePath\APPs"
$NewAppPath = "$AppsPath\APP_$AppID`_$AppName"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  WAMOCON App Creator" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Pruefe..." -ForegroundColor Yellow

if (-not (Test-Path "$TemplatePath")) {
    Write-Host "Fehler: Template nicht gefunden!" -ForegroundColor Red
    exit 1
}
Write-Host "OK: Template gefunden" -ForegroundColor Green

if (-not (Test-Path "$AppsPath")) {
    New-Item -ItemType Directory -Path "$AppsPath" -Force | Out-Null
}
Write-Host "OK: APPs Ordner" -ForegroundColor Green

if (Test-Path "$NewAppPath") {
    Write-Host "Fehler: Existiert bereits!" -ForegroundColor Red
    exit 1
}
Write-Host "OK: Keine Duplikate" -ForegroundColor Green

Write-Host ""
Write-Host "Erstelle App..." -ForegroundColor Yellow

Copy-Item -Path "$TemplatePath" -Destination "$NewAppPath" -Recurse -Force
Write-Host "OK: Kopiert" -ForegroundColor Green

$Subs = @(
    "02_Anforderungen\02.1_Funktionale-Anforderungen",
    "02_Anforderungen\02.2_Technische-Anforderungen",
    "02_Anforderungen\02.3_Prozesse",
    "02_Anforderungen\02.4_Akzeptanzkriterien",
    "03_Design\03.1_UI-Design",
    "03_Design\03.2_UX-Research",
    "03_Design\03.3_Design-System",
    "03_Design\03.4_Prototypes",
    "05_Testmanagement\05.1_Test-Planung",
    "05_Testmanagement\05.2_Manual-Tests",
    "05_Testmanagement\05.3_Automated-Tests",
    "05_Testmanagement\05.4_UAT"
)

foreach ($Sub in $Subs) {
    $SubPath = "$NewAppPath\$Sub"
    if (-not (Test-Path "$SubPath")) {
        New-Item -ItemType Directory -Path "$SubPath" -Force | Out-Null
    }
}
Write-Host "OK: Sub-Ordner erstellt" -ForegroundColor Green

$InfoPath = "$NewAppPath\APP_INFO.txt"
$InfoContent = "APP: APP_$AppID`_$AppName`nErstellt: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`nStatus: OK"
Set-Content -Path "$InfoPath" -Value $InfoContent -Force

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ERFOLGREICH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "App: APP_$AppID`_$AppName" -ForegroundColor Green
Write-Host "Pfad: $NewAppPath" -ForegroundColor Green
Write-Host ""
