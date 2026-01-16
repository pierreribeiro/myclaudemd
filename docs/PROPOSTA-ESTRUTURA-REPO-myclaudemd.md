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

### Estrutura Atual

```
myclaudemd/                           ❌ PROBLEMAS
├── claude.md                         # Ativo? Qual versão?
├── claude-md-PierreRibeiro_v1.8.0.md # Cópia versionada na raiz
├── claude.md.v1.6.0.backup           # Backup ad-hoc
├── docs/                             # 23 arquivos misturados
│   ├── ISSUE-01.txt ... ISSUE-08.txt # Issues (8 files)
│   ├── PRD-*.md                      # Specs
│   ├── TAG-*.md                      # Protocolos
│   ├── *-GUIDE.md                    # Guias
│   └── HANDOFF-*.md                  # Análises
└── .github/workflows/                # OK - manter
```

---

## 🏗️ ESTRUTURA PROPOSTA

```
myclaudemd/
│
├── 📄 README.md                      # Overview do projeto
├── 📄 CHANGELOG.md                   # Histórico de mudanças
├── 📄 CONTRIBUTING.md                # Guia de contribuição
├── 📄 .gitignore
├── 📄 .markdownlint.json
│
├── 📁 .github/                       # ✅ MANTER - Workflows
│   └── workflows/
│       ├── auto-changelog.yml
│       ├── backup-version.yml
│       ├── critical-changes-alert.yml
│       └── validate-claude.yml
│
│   ════════════════════════════════════════════════════════
│   🎯 ÁREA ATIVA - Onde você trabalha
│   ════════════════════════════════════════════════════════
│
├── 📄 claude.md                      # 🔥 ARQUIVO ATIVO (symlink ou cópia)
│                                     # Sempre aponta para versão em uso
│
├── 📁 current/                       # 📌 VERSÃO ATUAL - Trabalho ongoing
│   ├── claude-md-v2.0.0.md           # Core otimizado (WIP)
│   └── RELEASE-NOTES.md              # Notas da próxima release
│
│   ════════════════════════════════════════════════════════
│   🗄️ SKILLS - Nova Arquitetura
│   ════════════════════════════════════════════════════════
│
├── 📁 skills/                        # 🆕 SKILLS ARCHITECTURE
│   │
│   ├── 📁 personas/                  # 10 personas como skills
│   │   ├── database-expert/
│   │   │   ├── SKILL.md              # Definição do skill
│   │   │   └── README.md             # Documentação (opcional)
│   │   ├── emergency-engineer/
│   │   │   └── SKILL.md
│   │   ├── debug-investigator/
│   │   │   └── SKILL.md
│   │   ├── learning-mentor/
│   │   │   └── SKILL.md
│   │   ├── architect/
│   │   │   └── SKILL.md
│   │   ├── code-reviewer/
│   │   │   └── SKILL.md
│   │   ├── product-manager/
│   │   │   └── SKILL.md
│   │   ├── frontend-developer/
│   │   │   └── SKILL.md
│   │   ├── backend-developer/
│   │   │   └── SKILL.md
│   │   └── neutral-persona/
│   │       └── SKILL.md
│   │
│   ├── 📁 modes/                     # 5 modos operacionais
│   │   ├── discovery-mode/
│   │   │   └── SKILL.md
│   │   ├── build-mode/
│   │   │   └── SKILL.md
│   │   ├── debug-mode/
│   │   │   └── SKILL.md
│   │   ├── learning-mode/
│   │   │   └── SKILL.md
│   │   └── architecture-mode/
│   │       └── SKILL.md
│   │
│   └── 📁 references/                # 4 skills de referência
│       ├── guardrails-enhanced/
│       │   └── SKILL.md
│       ├── tag-system/
│       │   └── SKILL.md
│       ├── activation-commands/
│       │   └── SKILL.md
│       └── output-templates/
│           └── SKILL.md
│
│   ════════════════════════════════════════════════════════
│   📦 DISTRIBUÍVEIS - Arquivos prontos para deploy
│   ════════════════════════════════════════════════════════
│
├── 📁 dist/                          # 🆕 SKILLS EMPACOTADOS
│   ├── database-expert.skill         # ZIP pronto para upload
│   ├── emergency-engineer.skill
│   └── ...                           # Outros .skill files
│
│   ════════════════════════════════════════════════════════
│   📚 DOCUMENTAÇÃO - Organizada por tipo
│   ════════════════════════════════════════════════════════
│
├── 📁 docs/
│   │
│   ├── 📁 guides/                    # Como fazer
│   │   ├── DEPLOYMENT.md
│   │   ├── CREATE-PR-GUIDE.md
│   │   ├── CLOSE-ISSUES-GUIDE.md
│   │   └── SKILL-CREATION-GUIDE.md   # 🆕
│   │
│   ├── 📁 specs/                     # Especificações técnicas
│   │   ├── PRD-TAG-System-Integration-v1.0.md
│   │   ├── PRD-Skills-Architecture-v1.0.md  # 🆕
│   │   ├── ARCHITECTURE-TAG-System-v1.0.md
│   │   └── TAG-Protocol-v1.1.0.md
│   │
│   ├── 📁 analysis/                  # 🆕 Análises e pesquisas
│   │   ├── ANALISE-SKILLS-CLAUDE-MD-v1.8.0.md
│   │   ├── ANALISE-SKILLS-CLAUDE-DESKTOP-v2.md
│   │   └── HANDOFF-PRD-SONNET-Skills-Architecture-v1.md
│   │
│   └── 📁 legacy/                    # 🆕 Docs antigos (referência)
│       ├── ISSUE-01.txt
│       ├── ISSUE-02.txt
│       └── ...
│
│   ════════════════════════════════════════════════════════
│   🗃️ ARQUIVO - Versões anteriores
│   ════════════════════════════════════════════════════════
│
├── 📁 archive/                       # 🆕 VERSÕES ANTERIORES
│   ├── 📁 v1.0.0/
│   │   ├── claude.md
│   │   └── RELEASE-NOTES.md
│   ├── 📁 v1.5.0/
│   │   ├── claude.md
│   │   └── RELEASE-NOTES.md
│   ├── 📁 v1.6.0/
│   │   ├── claude.md
│   │   └── RELEASE-NOTES.md
│   ├── 📁 v1.7.0/
│   │   ├── claude.md
│   │   └── RELEASE-NOTES.md
│   └── 📁 v1.8.0/                    # Versão atual (pré-skills)
│       ├── claude.md
│       └── RELEASE-NOTES.md
│
│   ════════════════════════════════════════════════════════
│   🔧 AUTOMAÇÃO - Scripts e ferramentas
│   ════════════════════════════════════════════════════════
│
└── 📁 scripts/                       # 🆕 AUTOMAÇÃO LOCAL
    ├── package-skill.sh              # Empacota skill → .skill
    ├── package-all-skills.sh         # Empacota todos os skills
    ├── validate-skills.sh            # Valida estrutura dos skills
    ├── archive-version.sh            # Move versão para archive/
    └── deploy-to-claude.sh           # Deploy helper
```

---

## 📋 DETALHAMENTO DAS ÁREAS

### 1. 🎯 Área Ativa (raiz + current/)

| Item | Propósito | Uso |
|------|-----------|-----|
| `claude.md` | Arquivo ATIVO usado pelo Claude Desktop | Diário |
| `current/` | Trabalho em progresso da próxima versão | Desenvolvimento |

**Regra**: `claude.md` na raiz é sempre a versão **em produção**.

### 2. 🗄️ Skills (skills/)

| Subdiretório | Conteúdo | Quantidade |
|--------------|----------|------------|
| `personas/` | Skills de personas comportamentais | 10 |
| `modes/` | Skills de modos operacionais | 5 |
| `references/` | Skills de referência/documentação | 4 |

**Total**: 19 skills

### 3. 📦 Distribuíveis (dist/)

Contém arquivos `.skill` prontos para upload no Claude Desktop.

```bash
# Exemplo de conteúdo
dist/
├── database-expert.skill    # 2.2 KB
├── emergency-engineer.skill # 1.8 KB
└── learning-mentor.skill    # 2.0 KB
```

**Workflow**: `scripts/package-skill.sh` → gera → `dist/*.skill`

### 4. 📚 Documentação (docs/)

| Subdiretório | Tipo de Conteúdo | Exemplos |
|--------------|------------------|----------|
| `guides/` | How-to, tutoriais | Deploy, criar PR |
| `specs/` | Especificações técnicas | PRDs, arquitetura |
| `analysis/` | Análises, pesquisas, handoffs | Skills analysis |
| `legacy/` | Docs antigos (referência) | Issues arquivadas |

### 5. 🗃️ Archive (archive/)

Backup organizado por versão semântica.

```
archive/
├── v1.0.0/              # Release inicial
├── v1.5.0/              # Database Expert persona
├── v1.6.0/              # Guardrails enhanced
├── v1.7.0/              # TAG System
└── v1.8.0/              # Automatic TAGs (atual)
```

**Regra**: Cada versão tem `claude.md` + `RELEASE-NOTES.md`

### 6. 🔧 Scripts (scripts/)

| Script | Função |
|--------|--------|
| `package-skill.sh` | Empacota um skill em .skill |
| `package-all-skills.sh` | Empacota todos os skills |
| `validate-skills.sh` | Valida estrutura YAML/MD |
| `archive-version.sh` | Move versão atual para archive |
| `deploy-to-claude.sh` | Helper de deploy |

---

## 🔄 PLANO DE MIGRAÇÃO

### Fase 1: Criar Estrutura Base

```bash
# Criar novos diretórios
mkdir -p archive/{v1.0.0,v1.5.0,v1.6.0,v1.7.0,v1.8.0}
mkdir -p skills/{personas,modes,references}
mkdir -p docs/{guides,specs,analysis,legacy}
mkdir -p dist
mkdir -p scripts
mkdir -p current
```

### Fase 2: Mover Arquivos Existentes

```bash
# Backups para archive
mv claude.md.v1.6.0.backup archive/v1.6.0/claude.md
mv claude-md-PierreRibeiro_v1.8.0.md archive/v1.8.0/claude.md

# Docs para subdiretórios
mv docs/DEPLOYMENT*.md docs/guides/
mv docs/*-GUIDE.md docs/guides/
mv docs/PRD-*.md docs/specs/
mv docs/ARCHITECTURE-*.md docs/specs/
mv docs/TAG-Protocol*.md docs/specs/
mv docs/ANALISE-*.md docs/analysis/
mv docs/HANDOFF-*.md docs/analysis/
mv docs/ISSUE-*.txt docs/legacy/
```

### Fase 3: Criar Skill Inicial

```bash
# Database expert já validado
mkdir -p skills/personas/database-expert
# Copiar SKILL.md do POC
```

### Fase 4: Atualizar .gitignore

```gitignore
# Adicionar ao .gitignore
dist/*.skill          # Skills são rebuild artifacts
*.backup              # Backups ad-hoc (usar archive/)
```

### Fase 5: Atualizar GitHub Actions

Ajustar workflows para nova estrutura (se necessário).

---

## 📊 COMPARAÇÃO: ANTES vs DEPOIS

| Aspecto | Antes | Depois |
|---------|-------|--------|
| **Versões na raiz** | 3 arquivos misturados | 1 arquivo ativo |
| **Backups** | Ad-hoc (.backup) | Organizados em archive/ |
| **Skills** | Não existe | Estrutura completa |
| **Docs organizados** | 23 arquivos em 1 pasta | 4 subpastas por tipo |
| **Distribuíveis** | Não existe | dist/ com .skill files |
| **Scripts** | Não existe | scripts/ com automação |

---

## ✅ BENEFÍCIOS

### Para Desenvolvimento

1. **Clareza**: Sabe exatamente onde está cada coisa
2. **Versionamento**: Histórico organizado em archive/
3. **Skills**: Estrutura pronta para nova arquitetura
4. **Automação**: Scripts padronizados

### Para Manutenção

1. **Backups rastreáveis**: Por versão semântica
2. **Docs navegáveis**: Por tipo de conteúdo
3. **Modularidade**: Skills independentes
4. **CI/CD ready**: Estrutura compatível com workflows

### Para Escalabilidade

1. **Novos skills**: Basta criar pasta em skills/
2. **Novas versões**: Archive automático
3. **Nova documentação**: Categorizada desde o início

---

## 🎯 PRÓXIMOS PASSOS

1. ☐ **Aprovar** esta estrutura proposta
2. ☐ **Executar** Fase 1 (criar diretórios)
3. ☐ **Executar** Fase 2 (mover arquivos)
4. ☐ **Criar** scripts de automação
5. ☐ **Testar** workflows com nova estrutura
6. ☐ **Documentar** em README.md

---

## 📌 NOTAS

- A estrutura é **evolutiva** - pode crescer conforme necessário
- O `claude.md` na raiz **sempre** é a versão ativa
- Skills em `skills/` são **source**, `dist/` são **build artifacts**
- Workflows existentes devem continuar funcionando

---

*Proposta criada para projeto myclaudemd*  
*Foco: Organização, backup, suporte a Skills*
