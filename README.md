# 📊 Avila Pulse - Telemetria Executiva

> Hub de telemetria executiva com dashboards em tempo real, métricas consolidadas e analytics avançados

[![Deploy](https://img.shields.io/badge/Deploy-GitHub%20Pages-blue.svg)](https://avilaops.github.io/Pulse)
[![Status](https://img.shields.io/badge/Status-Live-brightgreen.svg)](https://avilaops.github.io/Pulse)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## ✨ Features

- ⚡ **Dashboard Interativo** - Visualização em tempo real com Chart.js
- 📊 **4 Gráficos Dinâmicos** - Events, Users, Latency, Errors
- 🔄 **WebSocket Simulation** - Atualizações automáticas a cada 5 segundos
- 📈 **Métricas Animadas** - Contadores com efeito visual
- 📥 **Export JSON** - Baixe todos os dados das métricas
- 🎨 **Dark Theme Premium** - Design moderno com gradientes
- 📱 **Responsive** - Funciona em desktop e mobile

## 🤖 AI Agents (Documentação)

Documentação de 9 agentes especializados em `AI/`:

1. **Analytics AI** - Análise de padrões
2. **Forecasting AI** - Previsões
3. **Anomaly Detector** - Detecção de anomalias
4. **Optimization AI** - Otimizações
5. **Report Generator** - Relatórios
6. **Query Assistant** - NLP queries
7. **Smart Alert Manager** - Alertas
8. **Capacity Planner** - Planejamento
9. **Integration Orchestrator** - Integrações

## 🚀 Deploy

### GitHub Pages

Deploy automático via GitHub Actions quando você fizer push para `main`:

```bash
git add .
git commit -m "feat: Update Pulse"
git push origin main
```

Acesse: **https://avilaops.github.io/Pulse**

### Desenvolvimento Local

```bash
# Servir localmente
npx http-server . -p 8080

# Ou com Python
python -m http.server 8080
```

Acesse: http://localhost:8080

## 📊 Dashboard Features

- **4 Gráficos Chart.js**
  - Events/min (linha com gradiente roxo)
  - Active Users (linha com gradiente verde)
  - Avg Latency (linha com gradiente amarelo)
  - Errors by Type (rosca - 4xx, 5xx, Timeouts, Network)

- **Métricas Animadas**
  - Total Events: contador animado
  - Active Users: contador animado
  - Avg Latency: contador animado
  - Error Rate: percentual animado

- **Controles**
  - Filtro por período (1h, 24h, 7d, 30d)
  - Seletor de tipo de métrica
  - Range de datas
  - Export para JSON
  - Notificações toast

- **WebSocket Simulation**
  - Atualiza dados a cada 5 segundos
  - Simula dados em tempo real
  - Efeitos de transição suaves

## 🏗️ Estrutura

```
Pulse/
├── index.html              # Landing page
├── dashboard.html          # Dashboard interativo
├── API.md                  # Documentação da API
├── .github/
│   └── workflows/
│       └── pages.yml       # GitHub Actions
└── AI/                     # Agentes IA (docs)
```

## 📚 Documentação

- [Dashboard Interativo](https://avilaops.github.io/Pulse/dashboard.html)
- [API Reference](API.md)
- [Repositório GitHub](https://github.com/avilaops/Pulse)

## 🎨 Tecnologias

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Charts**: Chart.js 4.4.0
- **Icons**: Iconoir
- **Deploy**: GitHub Pages
- **CI/CD**: GitHub Actions

## 🔒 Segurança

- HTTPS obrigatório
- CSP headers configurados
- Rate limiting
- JWT authentication
- CORS configurado

## 🤝 Contribuindo

Contribuições são bem-vindas! Veja [CONTRIBUTING.md](../CONTRIBUTING.md)

## 📄 Licença

MIT License - veja [LICENSE](../LICENSE)

---

**Desenvolvido por:** [Avila Inc](https://avila.inc)
**Status:** Live no GitHub Pages
**URL:** https://avilaops.github.io/Pulse
**Repositório:** https://github.com/avilaops/Pulse
