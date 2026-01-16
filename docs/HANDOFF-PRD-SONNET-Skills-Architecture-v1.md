# 📋 HANDOFF: PRD para Arquitetura de Skills
## Instrução para Claude Sonnet 4.5

**Data**: 2025-01-15  
**Projeto**: Transformação claude.md v1.8.0 → Arquitetura de Skills  
**Responsável PRD**: Claude Sonnet 4.5  
**Stakeholder**: Pierre Ribeiro  

---

## 🎯 OBJETIVO DESTE DOCUMENTO

Este documento contém **todo o contexto necessário** para você (Sonnet 4.5) criar um **PRD (Product Requirements Document)** completo para o projeto de transformação do arquivo de preferências pessoais (claude.md) de Pierre Ribeiro em uma arquitetura modular de Skills para Claude Desktop.

**Sua tarefa**: Criar o PRD técnico baseado nas descobertas, análises e POC validado documentados abaixo.

---

## 📊 CONTEXTO DO PROJETO

### O Que É

Pierre Ribeiro mantém um arquivo de preferências pessoais (`claude.md`) que configura o comportamento do Claude Desktop. O arquivo atual (v1.8.0) tem **~1.050 linhas** e **~5.500-6.500 tokens**, carregando tudo em cada sessão mesmo quando apenas uma fração é usada.

### Problema Identificado

**~70% do conteúdo é carregado mas usado apenas OCASIONALMENTE ou SOB DEMANDA**, resultando em:
- Consumo excessivo de tokens por sessão
- Custo desnecessário (~$0.05-0.06/sessão)
- Tempo de processamento inicial elevado
- Arquivo monolítico difícil de manter

### Solução Proposta

Transformar funcionalidades do claude.md em **Skills nativos do Claude Desktop** usando o sistema de Skills global disponível em **Settings > Capabilities**. Isso permite:
- Progressive Disclosure (carregar sob demanda)
- Funcionamento em **sessões avulsas** (fora de projetos)
- Redução de ~68% em tokens iniciais
- Modularidade e manutenibilidade

---

## 🔬 DESCOBERTA CRÍTICA: Skills Nativos vs Proposta Inicial

### Proposta Inicial (INCORRETA)
Usar **Project Knowledge (RAG)** para carregar skills sob demanda. 

**Problema**: RAG só funciona **dentro de Projetos**, não em sessões avulsas.

### Descoberta Validada (CORRETA)
Claude Desktop tem um sistema de **Skills NATIVO e GLOBAL** em Settings > Capabilities:

| Característica | Valor |
|----------------|-------|
| **Escopo** | GLOBAL (toda a aplicação) |
| **Disponibilidade** | Todas as sessões (projetos E avulsas) |
| **Progressive Disclosure** | NATIVO (metadata → body → resources) |
| **Trigger** | Automático via campo `description` |
| **Upload** | ZIP com estrutura SKILL.md |

### Como Funciona

```
1. Pierre cria skill (ex: database-expert.skill)
2. Upload via Settings > Capabilities
3. Claude lê APENAS metadata (~100 palavras) de todos skills
4. Quando detecta match com description → carrega body do skill
5. Comportamento aplicado automaticamente
```

**Documentação oficial**:
- https://support.claude.com/en/articles/12512180-using-skills-in-claude
- https://support.claude.com/en/articles/12512198-how-to-create-custom-skills

---

## ✅ POC VALIDADO COM SUCESSO

### Skill Criado: database-expert

**Arquivo**: `database-expert/SKILL.md` (128 linhas, 2.2 KB)

**Estrutura do SKILL.md**:

```yaml
---
name: database-expert
description: Persona Database Reliability Engineer (DBRE) para administração 
de bancos de dados. ATIVAR quando mensagens contiverem TAGs @Database expert@ 
ou @DBA mode@, ou discussões sobre Oracle, PostgreSQL, SQL Server, MySQL, 
BigQuery, performance tuning, query optimization, HA/DR, high availability, 
disaster recovery, migrations, backup, recovery, replication, indexes, 
execution plans, AWR, ASH, RMAN, Data Guard, Patroni, Barman, PgBouncer.
---

# Database Reliability Engineer Persona 🗄️

## Identidade
[Comportamento detalhado da persona]

## Stack de Expertise
[Tecnologias e ferramentas]

## Template de Output para Scripts SQL
[Template padronizado com headers, validação, rollback]

## Contexto do Usuário
[Comunicação senior-to-senior]
```

### Resultado do Teste

| Critério | Resultado |
|----------|-----------|
| Trigger por TAG funciona | ✅ SUCCESS |
| Trigger por keywords funciona | ✅ SUCCESS |
| Template SQL aplicado | ✅ SUCCESS |
| Perguntas DBA feitas | ✅ SUCCESS |
| Sessão AVULSA funciona | ✅ SUCCESS |
| Não trigga erroneamente | ✅ SUCCESS |

**CONCLUSÃO DO POC**: Skills nativos funcionam para **personas comportamentais**, não apenas para workflows/tarefas.

---

## 📈 MÉTRICAS DAS ANÁLISES

### Diagnóstico do claude.md v1.8.0

| Seção | Linhas | % Total | Uso/Sessão |
|-------|--------|---------|------------|
| Metadata | 15 | 1.4% | SEMPRE |
| Identity & Context | 60 | 5.7% | SEMPRE |
| Cognitive Style | 40 | 3.8% | SEMPRE |
| Communication | 45 | 4.3% | SEMPRE |
| Workflows | 35 | 3.3% | OCASIONAL |
| **Guardrails Enhanced** | **200** | **19.0%** | SEMPRE* |
| Default Persona | 40 | 3.8% | SEMPRE |
| **Persona System (10)** | **120** | **11.4%** | SOB DEMANDA |
| **TAG System** | **150** | **14.3%** | SOB DEMANDA |
| Output Formats | 70 | 6.7% | OCASIONAL |
| **Operational Modes** | **80** | **7.6%** | SOB DEMANDA |
| Tools & Integrations | 80 | 7.6% | OCASIONAL |
| **Activation Commands** | **100** | **9.5%** | REFERÊNCIA |
| TAG Parsing Rules | 60 | 5.7% | REFERÊNCIA |
| Maintenance | 50 | 4.8% | RARAMENTE |
| Success Metrics | 40 | 3.8% | RARAMENTE |

**Itens em negrito**: Candidatos prioritários para transformação em Skills

### Estimativa de Redução

| Componente | Linhas Antes | Linhas Core | Economia |
|------------|--------------|-------------|----------|
| Personas (10) | 120 | 25 | -95 |
| TAG System | 150 | 20 | -130 |
| Guardrails Enhanced | 200 | 50 | -150 |
| Operational Modes | 80 | 15 | -65 |
| Activation Commands | 100 | 15 | -85 |
| Tools & Integrations | 80 | 20 | -60 |
| Output Formats | 70 | 20 | -50 |
| Success Metrics | 40 | 0 | -40 |
| **TOTAL** | **840** | **165** | **-675** |

### Projeção Final

| Métrica | Atual v1.8.0 | Proposta v2.0 | Melhoria |
|---------|--------------|---------------|----------|
| Linhas core | ~1.050 | ~325 | **-69%** |
| Tokens carregados | ~5.500-6.500 | ~1.700-2.100 | **-68%** |
| Skills criados | 0 | ~15-19 | Modular |
| Funcionalidades | 100% | 100% | Mantidas |
| Custo/sessão | ~$0.055 | ~$0.019 | **-65%** |

---

## 🏗️ ARQUITETURA PROPOSTA

### Estrutura de Arquivos

```
Claude Desktop Settings > Capabilities > Skills
├── database-expert.skill       ✅ POC Validado
├── emergency-engineer.skill
├── debug-investigator.skill
├── learning-mentor.skill
├── architect.skill
├── code-reviewer.skill
├── product-manager.skill
├── frontend-developer.skill
├── backend-developer.skill
├── neutral-persona.skill
├── discovery-mode.skill
├── build-mode.skill
├── debug-mode.skill
├── learning-mode.skill
├── architecture-mode.skill
├── tag-system-reference.skill
├── guardrails-enhanced.skill
├── activation-commands.skill
└── output-templates.skill
```

### Estrutura de Cada Skill (Padrão)

```
skill-name/
├── SKILL.md                  # OBRIGATÓRIO
│   ├── YAML frontmatter      # name + description (OBRIGATÓRIO)
│   │   ├── name: (64 chars max)
│   │   └── description: (200 chars max, triggers)
│   └── Markdown body         # Instruções detalhadas
├── references/               # OPCIONAL - Material de referência
└── scripts/                  # OPCIONAL - Código executável
```

### Claude.md Core v2.0 (~325 linhas)

Seções que PERMANECEM no core:

| Seção | Linhas | Razão |
|-------|--------|-------|
| Metadata | 10 | Versão, compatibilidade |
| Identity Core | 40 | Contexto sempre necessário |
| Cognitive Style | 30 | Neurodiversidade essencial |
| Communication Core | 25 | 3 contextos resumidos |
| Default Persona | 30 | Comportamento padrão |
| Guardrails P0 | 50 | Críticos, sempre ativos |
| Persona Index | 25 | TAGs → Skills mapping |
| Mode Index | 15 | Modos → Skills mapping |
| TAG System Core | 20 | Regra de inferência |
| Quick Reference | 30 | Comandos essenciais |
| Skill Instructions | 20 | Como carregar skills |

---

## 📋 REQUISITOS DO PRD

### O PRD Deve Conter

1. **Visão Geral do Projeto**
   - Problema (arquivo monolítico)
   - Solução (Skills modulares)
   - Benefícios esperados (métricas)

2. **Escopo**
   - In-scope: 10 personas, 5 modos, 4 referências
   - Out-of-scope: Mudanças no sistema de TAGs de chat search

3. **Arquitetura Técnica**
   - Estrutura de Skills
   - Formato SKILL.md
   - Progressive Disclosure nativo
   - Mecanismo de trigger

4. **Especificação dos Skills**
   - Lista completa de skills a criar
   - Priorização (baseada em impacto)
   - Template padrão para cada tipo

5. **Cronograma de Implementação**
   - Fase 1: Personas (maior impacto)
   - Fase 2: Modos operacionais
   - Fase 3: Referências
   - Fase 4: Core v2.0

6. **Critérios de Aceitação**
   - Skill funciona em sessão avulsa
   - Trigger automático correto
   - Comportamento aplicado consistentemente
   - Não trigga erroneamente

7. **Riscos e Mitigações**
   - Skill não encontrado → fallback
   - Trigger incorreto → refinar description
   - Performance → medir latência

8. **Métricas de Sucesso**
   - Redução de tokens ≥60%
   - 100% funcionalidades mantidas
   - Zero breaking changes

### Formato Esperado

- Documento Markdown
- Seções claras com headers
- Tabelas para especificações
- Diagramas Mermaid onde apropriado
- Checklists para implementação

---

## 🎯 INFORMAÇÕES DO STAKEHOLDER

### Pierre Ribeiro

**Perfil**:
- Senior Data Engineer/DBA, 15+ anos
- TEA Level 1 + ADHD (neurodivergente)
- Prefere informação visual e estruturada
- Business-first mindset

**Preferências para o PRD**:
- Estrutura clara e step-by-step
- Tabelas comparativas
- Métricas quantificáveis
- Trade-offs explícitos
- Roadmap com fases

**Ambiente**:
- Claude Desktop (Windows 11)
- Claude Code (VSCode/WSL2)
- GitHub repo: `myclaude`
- Skills via Settings > Capabilities

---

## 📚 REFERÊNCIAS DISPONÍVEIS

### Documentos de Análise

1. **ANALISE-SKILLS-CLAUDE-MD-v1.8.0.md**
   - Diagnóstico completo do arquivo atual
   - Proposta inicial de arquitetura
   - Estimativas de redução

2. **ANALISE-SKILLS-CLAUDE-DESKTOP-v2.md**
   - Revisão crítica da proposta
   - Identificação de gaps
   - Validação de viabilidade

### POC Validado

3. **database-expert/SKILL.md**
   - Skill funcional testado
   - Estrutura de referência
   - Template para outras personas

### Documentação Oficial

4. **Anthropic Skills Documentation**
   - Using Skills: https://support.claude.com/en/articles/12512180
   - Creating Skills: https://support.claude.com/en/articles/12512198

---

## ⚠️ PONTOS CRÍTICOS PARA O PRD

### 1. Skills Comportamentais vs Tarefas

O POC provou que Skills funcionam para **personas** (comportamento), não apenas para tarefas (criar docs, etc.). O PRD deve documentar esta descoberta.

### 2. Campo Description é Crítico

O trigger automático depende 100% do campo `description` no frontmatter YAML. O PRD deve especificar guidelines claras para escrever descriptions efetivas.

### 3. Limite de Caracteres

- `name`: 64 caracteres máximo
- `description`: 200 caracteres máximo

O PRD deve considerar como encaixar todos os triggers necessários no limite.

### 4. Sessões Avulsas

A grande vantagem dos Skills nativos é funcionarem em **qualquer sessão**. O PRD deve enfatizar isso como diferencial vs Project Knowledge.

### 5. Claude.md Core Ainda Necessário

Mesmo com Skills, o arquivo claude.md core (~325 linhas) ainda é necessário para:
- Contexto de identidade
- Neurodiversidade
- Guardrails P0
- Índices de TAGs

---

## 🔄 INSTRUÇÕES PARA CRIAR O PRD

### Passo 1: Estruturar o Documento

Use a estrutura padrão de PRD:
1. Executive Summary
2. Problem Statement
3. Goals & Success Metrics
4. Scope
5. Technical Architecture
6. Detailed Requirements
7. Implementation Plan
8. Risks & Mitigations
9. Appendices

### Passo 2: Incorporar Métricas

Use os números das análises (redução 68%, 19 skills, etc.)

### Passo 3: Especificar Cada Skill

Para cada skill, documentar:
- Nome
- Description (triggers)
- Conteúdo do body
- Prioridade

### Passo 4: Definir Fases

Baseado na priorização:
1. Fase 1 - Personas (maior ROI)
2. Fase 2 - Modos operacionais
3. Fase 3 - Referências
4. Fase 4 - Core optimization

### Passo 5: Criar Checklist de Implementação

Lista de tarefas específicas para Pierre executar.

---

## 🎯 ENTREGÁVEL ESPERADO

**Título**: PRD - Arquitetura de Skills para Claude Desktop

**Formato**: Markdown (.md)

**Extensão**: ~500-800 linhas (documento completo)

**Audiência**: Pierre Ribeiro (implementador)

**Tom**: Técnico, preciso, acionável

---

## 📌 NOTAS FINAIS

1. Este handoff contém **todo o contexto necessário** - não busque informações adicionais

2. O POC foi **validado com sucesso** - a abordagem é viável

3. Foque em **acionabilidade** - Pierre deve conseguir executar a partir do PRD

4. Mantenha **compatibilidade** com o sistema atual (não breaking changes)

5. Priorize **redução de tokens** mantendo 100% das funcionalidades

---

*Handoff criado por Claude Opus 4.5 para Claude Sonnet 4.5*  
*Projeto: Arquitetura de Skills para Claude Desktop*  
*Data: 2025-01-15*
