# Deploy Avila Pulse para Azure Static Web App
# Script de deploy automatizado

param(
    [string]$Environment = "production",
    [switch]$CreateNew = $false
)

$ErrorActionPreference = "Stop"

Write-Host "📊 Deploy Avila Pulse para Azure" -ForegroundColor Cyan
Write-Host "Environment: $Environment" -ForegroundColor Yellow
Write-Host ""

# Verificar se está no diretório correto
$pulsePath = "c:\Users\nicol\OneDrive\Avila\1.2 - Avilaops\1.2.2 - Products\Pulse"
if (-not (Test-Path $pulsePath)) {
    Write-Host "❌ Diretório Pulse não encontrado!" -ForegroundColor Red
    exit 1
}

Set-Location $pulsePath

# Verificar arquivos necessários
$requiredFiles = @("index.html", "staticwebapp.config.json", "swa-cli.config.json", "README.md")
foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "❌ Arquivo $file não encontrado!" -ForegroundColor Red
        exit 1
    }
    Write-Host "✅ $file encontrado" -ForegroundColor Green
}

Write-Host ""

# Verificar SWA CLI instalado
Write-Host "🔍 Verificando SWA CLI..." -ForegroundColor Cyan
$swaVersion = npx @azure/static-web-apps-cli --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  SWA CLI não encontrado. Instalando..." -ForegroundColor Yellow
    npm install -g @azure/static-web-apps-cli
}
else {
    Write-Host "✅ SWA CLI versão: $swaVersion" -ForegroundColor Green
}

Write-Host ""

if ($CreateNew) {
    # Criar novo Static Web App via Azure CLI
    Write-Host "🏗️  Criando novo Static Web App..." -ForegroundColor Cyan

    $resourceGroup = "avila-pulse-rg"
    $appName = "pulse-avila-inc"
    $location = "eastus2"

    # Criar resource group se não existir
    az group create --name $resourceGroup --location $location

    # Criar Static Web App
    az staticwebapp create `
        --name $appName `
        --resource-group $resourceGroup `
        --location $location `
        --source https://github.com/avilaops/Pulse `
        --branch main `
        --app-location "/" `
        --output-location "." `
        --login-with-github

    Write-Host "✅ Static Web App criado!" -ForegroundColor Green
}
else {
    # Deploy para app existente
    Write-Host "🚀 Fazendo deploy..." -ForegroundColor Cyan

    # Verificar se há token de deploy
    if (-not $env:AZURE_STATIC_WEB_APPS_API_TOKEN) {
        Write-Host "⚠️  AZURE_STATIC_WEB_APPS_API_TOKEN não configurado" -ForegroundColor Yellow
        Write-Host "Configure com: `$env:AZURE_STATIC_WEB_APPS_API_TOKEN='seu-token'" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Ou faça login com Azure CLI:" -ForegroundColor Yellow
        Write-Host "az login" -ForegroundColor White
        Write-Host ""

        # Tentar deploy via SWA CLI
        swa deploy --app-location . --output-location . --env $Environment
    }
    else {
        # Deploy com token
        swa deploy `
            --app-location . `
            --output-location . `
            --deployment-token $env:AZURE_STATIC_WEB_APPS_API_TOKEN `
            --env $Environment
    }

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Deploy concluído com sucesso!" -ForegroundColor Green
        Write-Host ""
        Write-Host "🌐 URL: https://pulse.avila.inc" -ForegroundColor Cyan
        Write-Host "🤖 Agentes IA: https://pulse.avila.inc/AI" -ForegroundColor Cyan
    }
    else {
        Write-Host ""
        Write-Host "❌ Erro no deploy!" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "📊 Pulse deploy finalizado!" -ForegroundColor Green
