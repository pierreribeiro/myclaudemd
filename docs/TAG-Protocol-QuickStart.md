# TAG Protocol v1.0 - Quick Start Guide

**Cheat Sheet para Pierre Ribeiro**
**Versão:** 1.0
**Atualizado:** 2025-11-16

---

## 🎯 FORMATO RÁPIDO

```
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @[STATUS] ~[CONTEXTO] ![PRIORIDADE]
```

| Símbolo | O Que É | Obrigatório? | Exemplo |
|---------|---------|--------------|---------|
| `#` | Categoria principal | ✅ **SIM** | `#GIT` `#DB` `#DATA` |
| `@` | Status do trabalho | ⚠️ Recomendado | `@START` `@SUCCESS` `@ERROR` |
| `~` | Contexto/Ambiente | ❌ Opcional | `~PRODUCTION` `~LEARNING` |
| `!` | Prioridade | ❌ Opcional | `!CRITICAL` `!HIGH` |

---

## 🏷️ TOP 10 CATEGORIAS (Uso Frequente)

| # | Categoria | Quando Usar | Exemplo Rápido |
|---|-----------|-------------|----------------|
| 1 | `#GIT` | Git, GitHub, commits, PRs | `#GIT:PR:REVIEW @START` |
| 2 | `#DB` | Databases, queries, migrations | `#DB:QUERY:SLOW @DEBUG ~PRODUCTION` |
| 3 | `#DATA` | Pipelines, ETL, analytics | `#DATA:PIPELINE:ETL @SUCCESS` |
| 4 | `#INFRA` | Terraform, AWS, Docker, K8s | `#INFRA:TERRAFORM:DEPLOY @PROGRESS` |
| 5 | `#CODE` | Python, scripts, desenvolvimento | `#CODE:PYTHON:SCRIPT @START` |
| 6 | `#DEBUG` | Troubleshooting, investigação | `#DEBUG:ERROR:500 @ERROR ~PRODUCTION !CRITICAL` |
| 7 | `#LEARN` | Aprendizado, prática, tutoriais | `#LEARN:PRACTICE:GIT @START ~LEARNING` |
| 8 | `#ARCH` | Arquitetura, design de sistemas | `#ARCH:DESIGN:API @REVIEW` |
| 9 | `#MCP` | MCP servers, configuração | `#MCP:SETUP:POSTGRES @SUCCESS` |
| 10 | `#DOC` | Documentação, READMEs, wikis | `#DOC:README:UPDATE @DONE` |

---

## 📊 STATUS LIFECYCLE (Fluxo Típico)

```
@START → @PROGRESS → @SUCCESS ✅
                  ↓
               @ERROR → @RESOLVED → @DONE ✅
                  ↓
               @BLOCKED → @REVIEW → @DONE ✅
                  ↓
               @ABANDONED ❌
```

### Status Indicators - Quick Ref

| Status | Quando Usar | Exemplo |
|--------|-------------|---------|
| `@START` | Iniciando tarefa/investigação | `#GIT:CLONE:REPO @START` |
| `@PROGRESS` | Trabalho em andamento | `#DATA:ETL:BUILD @PROGRESS` |
| `@SUCCESS` | Completado com sucesso | `#DB:MIGRATION:V2 @SUCCESS` |
| `@ERROR` | Erro encontrado | `#DEBUG:API:TIMEOUT @ERROR ~PRODUCTION` |
| `@BLOCKED` | Bloqueado/impedimento | `#INFRA:DEPLOY:K8S @BLOCKED` |
| `@RESOLVED` | Erro resolvido | `#DEBUG:API:TIMEOUT @RESOLVED` |
| `@REVIEW` | Precisa revisão | `#CODE:PR:123 @REVIEW` |
| `@DONE` | 100% completo | `#DOC:API:V1 @DONE` |
| `@TESTING` | Em fase de testes | `#CODE:FEATURE:AUTH @TESTING` |
| `@ABANDONED` | Cancelado/abandonado | `#ARCH:POC:REDIS @ABANDONED` |

---

## 🔍 COMO BUSCAR DEPOIS

### Busca Básica (Por Categoria)
```python
conversation_search(query="GIT SETUP")
→ Todas conversas sobre Git setup
```

### Busca por Status
```python
conversation_search(query="ERROR PRODUCTION")
→ Todos os erros de produção
```

### Busca Combinada
```python
conversation_search(query="DB MIGRATION SUCCESS")
→ Migrações de DB bem-sucedidas
```

### Busca por Contexto
```python
conversation_search(query="LEARNING PRACTICE")
→ Todas as sessões de aprendizado
```

---

## 💡 PADRÕES COMUNS (Copy-Paste Ready)

### 🔥 Git/GitHub
```
#GIT:SETUP:REPO @START
#GIT:BRANCH:FEATURE @PROGRESS
#GIT:COMMIT:PUSH @SUCCESS
#GIT:PR:REVIEW @REVIEW
#GIT:MERGE:CONFLICT @ERROR → @RESOLVED
```

### 🗄️ Database
```
#DB:QUERY:SLOW @DEBUG ~PRODUCTION
#DB:MIGRATION:V1.5 @START → @SUCCESS
#DB:BACKUP:RESTORE @TESTING ~STAGING
#DB:TUNE:INDEX @SUCCESS ~PRODUCTION
```

### 📊 Data Engineering
```
#DATA:PIPELINE:ETL @START
#DATA:QUALITY:VALIDATION @ERROR → @RESOLVED
#DATA:STREAM:KAFKA @SUCCESS ~PRODUCTION
```

### ☁️ Infraestrutura
```
#INFRA:TERRAFORM:DEPLOY @PROGRESS ~AWS
#INFRA:DOCKER:BUILD @SUCCESS
#INFRA:K8S:SCALE @BLOCKED → @RESOLVED
```

### 🐛 Debugging
```
#DEBUG:API:500 @ERROR ~PRODUCTION !CRITICAL
#DEBUG:PERFORMANCE:SLOW @START
#DEBUG:MEMORY:LEAK @RESOLVED ~PRODUCTION
```

### 📚 Aprendizado
```
#LEARN:PRACTICE:GIT-BASICS @START ~LEARNING
#LEARN:TUTORIAL:KUBERNETES @PROGRESS ~LEARNING
#LEARN:CONCEPT:MICROSERVICES @SUCCESS ~LEARNING
```

---

## 📝 TEMPLATE DE USO EM CONVERSAS

### Início de Sessão
```markdown
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @START ~[CONTEXTO]

Objetivo: [descrever o que quer fazer]
Contexto: [informações relevantes]
```

### Durante o Trabalho
```markdown
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @PROGRESS

Status: [o que já foi feito]
Próximos passos: [o que vem a seguir]
```

### Ao Encontrar Erro
```markdown
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @ERROR ~[CONTEXTO] ![PRIORIDADE]

Problema: [descrição do erro]
Erro: [mensagem de erro ou comportamento]
```

### Após Resolver
```markdown
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @RESOLVED ~[CONTEXTO]

Solução: [o que foi feito para resolver]
```

### Finalizando Sessão
```markdown
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @SUCCESS

✅ Completado: [resumo do que foi feito]
Aprendizado: [lições aprendidas]
Next: [próximos passos se houver]
```

---

## 🎯 EXEMPLOS REAIS

### Exemplo 1: Git Setup
```
#GIT:SETUP:MYCLAUDEMD @START
Objetivo: Configurar repositório myclaudemd para Claude Code

[... trabalho ...]

#GIT:SETUP:MYCLAUDEMD @SUCCESS
✅ Repo configurado, branches criadas, primeiro commit feito
Next: #GIT:PR:PRIMEIRA-PR
```

### Exemplo 2: Database Performance Issue
```
#DEBUG:DB:TIMEOUT @ERROR ~PRODUCTION !CRITICAL
Problema: Query users_report timeout após 30s
Erro: "ERROR: canceling statement due to statement timeout"

[... investigação ...]

#DEBUG:DB:TIMEOUT @RESOLVED ~PRODUCTION
Solução: Adicionado índice composto em (user_id, created_at)
Performance: 30s → 0.8s
```

### Exemplo 3: Learning Session
```
#LEARN:PRACTICE:KUBERNETES @START ~LEARNING
Objetivo: Aprender conceitos básicos de Kubernetes

Topics:
- Pods, Services, Deployments
- kubectl commands
- YAML manifests

[... estudo ...]

#LEARN:PRACTICE:KUBERNETES @SUCCESS ~LEARNING
✅ Aprendi:
- Criar pods e deployments
- Expor services
- Scale replicas
- View logs com kubectl

Next: #LEARN:PRACTICE:K8S-NETWORKING
```

### Exemplo 4: Infrastructure Deploy
```
#INFRA:TERRAFORM:VPC-SETUP @START ~AWS
Objetivo: Deploy VPC com Terraform na AWS

[... deployment ...]

#INFRA:TERRAFORM:VPC-SETUP @BLOCKED
Blocker: AWS credentials não configuradas no CI/CD

[... configuração ...]

#INFRA:TERRAFORM:VPC-SETUP @RESOLVED
Fix: Configurado AWS_ACCESS_KEY_ID no GitHub Secrets

[... deploy ...]

#INFRA:TERRAFORM:VPC-SETUP @SUCCESS ~AWS
✅ VPC criada com sucesso
Resources: 1 VPC, 3 subnets, 1 internet gateway, 2 route tables
```

---

## 🔗 RECURSOS ADICIONAIS

- **Full Protocol:** [TAG-Protocol-v1.0.md](TAG-Protocol-v1.0.md) - Taxonomia completa, subcategorias detalhadas
- **Integration Guide:** [claude.md](../claude.md) - TAG System section in preferences file
- **PRD:** [PRD-TAG-System-Integration-v1.0.md](PRD-TAG-System-Integration-v1.0.md) - Project requirements and business value

---

## 💡 DICAS DE USO

1. **Sempre comece com `#CATEGORIA`** - É obrigatório e o que permite buscar depois
2. **Use `@STATUS`** - Ajuda muito a filtrar por resultado (errors, success, etc.)
3. **Adicione `~CONTEXTO`** - Especialmente útil para diferenciar PRODUCTION vs LEARNING vs STAGING
4. **Reserve `!PRIORITY`** - Só para coisas realmente críticas/urgentes
5. **Finalize sessões** - Sempre coloque tag final com status e resumo
6. **Seja consistente** - Use sempre os mesmos termos (não misture ERROR/ERRO/FALHA)

---

## ⚡ QUICK COMMAND

Para usar em uma conversa:
1. **Início:** Coloque tag no primeiro prompt
2. **Progresso:** Adicione tags quando houver mudanças significativas
3. **Fim:** Tag final com status e resumo
4. **Buscar depois:** `conversation_search(query="KEYWORDS")`

---

**Criado:** 2025-11-16
**Versão:** 1.0
**Próxima revisão:** Após 30 dias de uso (feedback de Pierre)

---
