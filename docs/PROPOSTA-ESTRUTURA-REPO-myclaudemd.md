# 📁 Proposta: Nova Estrutura do Repositório myclaudemd

**Data**: 2025-01-15  
**Versão**: 1.0  
**Objetivo**: Reorganizar repositório para suportar Skills, backups organizados e trabalho ongoing

---

## 📊 DIAGNÓSTICO DA ESTRUTURA ATUAL

### Problemas Identificados

| Problema | Impacto | Severidade |
|----------|---------|------------|
| Arquivos na raiz misturados | Difícil identificar versão ativa | 🟡 Médio |
| docs/ com 23 arquivos diversos | Navegação confusa | 🟡 Médio |
| Backup ad-hoc (.backup) | Inconsistente, difícil rastrear | 🔴 Alto |
| Sem estrutura para Skills | Bloqueio para nova arquitetura | 🔴 Alto |
| Sem área de análises | Pesquisa dispersa | 🟡 Médio |

---

## 🏗️ ESTRUTURA PROPOSTA

```
myclaudemd/
│
├── 📄 README.md                      # Overview do projeto
├── 📄 CHANGELOG.md                   # Histórico de mudanças
├── 📄 CONTRIBUTING.md                # Guia de contribuição
│
├── 📁 .github/workflows/             # ✅ MANTER - Workflows
│
│   ════════════════════════════════════════════════════════
│   🎯 ÁREA ATIVA
│   ════════════════════════════════════════════════════════
│
├── 📄 claude.md                      # 🔥 ARQUIVO ATIVO
│
├── 📁 current/                       # 📌 VERSÃO ATUAL - WIP
│   ├── claude-md-v2.0.0.md
│   └── RELEASE-NOTES.md
│
│   ════════════════════════════════════════════════════════
│   🗄️ SKILLS - Nova Arquitetura
│   ════════════════════════════════════════════════════════
│
├── 📁 skills/
│   ├── 📁 personas/                  # 10 personas
│   │   ├── database-expert/SKILL.md
│   │   ├── emergency-engineer/SKILL.md
│   │   └── ... (8 mais)
│   ├── 📁 modes/                     # 5 modos
│   │   ├── discovery-mode/SKILL.md
│   │   └── ... (4 mais)
│   └── 📁 references/                # 4 referências
│       ├── guardrails-enhanced/SKILL.md
│       └── ... (3 mais)
│
│   ════════════════════════════════════════════════════════
│   📦 DISTRIBUÍVEIS
│   ════════════════════════════════════════════════════════
│
├── 📁 dist/                          # Skills empacotados (.skill)
│   ├── database-expert.skill
│   └── ...
│
│   ════════════════════════════════════════════════════════
│   📚 DOCUMENTAÇÃO
│   ════════════════════════════════════════════════════════
│
├── 📁 docs/
│   ├── 📁 guides/                    # How-to
│   ├── 📁 specs/                     # PRDs, arquiteturas
│   ├── 📁 analysis/                  # Análises, handoffs
│   └── 📁 legacy/                    # Issues arquivadas
│
│   ════════════════════════════════════════════════════════
│   🗃️ ARQUIVO
│   ════════════════════════════════════════════════════════
│
├── 📁 archive/                       # Versões anteriores
│   ├── v1.0.0/claude.md
│   ├── v1.5.0/claude.md
│   ├── v1.6.0/claude.md
│   ├── v1.7.0/claude.md
│   └── v1.8.0/claude.md
│
│   ════════════════════════════════════════════════════════
│   🔧 AUTOMAÇÃO
│   ════════════════════════════════════════════════════════
│
└── 📁 scripts/
    ├── package-skill.sh
    ├── package-all-skills.sh
    ├── validate-skills.sh
    └── archive-version.sh
```

---

## 📋 RESUMO DAS ÁREAS

| Área | Propósito | Conteúdo |
|------|-----------|----------|
| **raiz** | Arquivo ativo | `claude.md` em uso |
| **current/** | Work in progress | Próxima versão |
| **skills/** | Source dos skills | 19 skills (personas/modes/refs) |
| **dist/** | Build artifacts | .skill files para deploy |
| **docs/** | Documentação | Guides, specs, analysis, legacy |
| **archive/** | Backup versionado | v1.0.0 até v1.8.0 |
| **scripts/** | Automação | Package, validate, deploy |

---

## 🔄 PLANO DE MIGRAÇÃO

### Fase 1: Criar Estrutura
```bash
mkdir -p archive/{v1.0.0,v1.5.0,v1.6.0,v1.7.0,v1.8.0}
mkdir -p skills/{personas,modes,references}
mkdir -p docs/{guides,specs,analysis,legacy}
mkdir -p dist scripts current
```

### Fase 2: Mover Arquivos
```bash
# Backups
mv claude.md.v1.6.0.backup archive/v1.6.0/claude.md
mv claude-md-PierreRibeiro_v1.8.0.md archive/v1.8.0/claude.md

# Docs por tipo
mv docs/*-GUIDE.md docs/DEPLOYMENT*.md docs/guides/
mv docs/PRD-*.md docs/ARCHITECTURE-*.md docs/TAG-*.md docs/specs/
mv docs/ANALISE-*.md docs/HANDOFF-*.md docs/analysis/
mv docs/ISSUE-*.txt docs/legacy/
```

### Fase 3: Criar Skills
```bash
mkdir -p skills/personas/database-expert
# Copiar SKILL.md do POC validado
```

---

*Proposta para projeto myclaudemd - Foco: Organização, backup, suporte a Skills*
