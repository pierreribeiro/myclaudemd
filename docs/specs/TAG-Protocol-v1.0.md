# TAG Protocol v1.0 - Chat Search Optimization
**Criado para:** Pierre Ribeiro  
**Data:** 2025-10-10  
**Propósito:** Sistema de tags para otimizar conversation_search e recent_chats do Claude Desktop  

---

## 🎯 OBJETIVO

Criar um sistema padronizado de tags que permita:
- ✅ Busca eficiente em conversas passadas
- ✅ Rastreabilidade de sessões de trabalho
- ✅ Continuidade entre chats
- ✅ Documentação automática via tags

---

## 📐 FORMATO GERAL

```
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @[STATUS] ~[CONTEXTO] ![PRIORIDADE]
```

### Componentes:

| Símbolo | Propósito | Obrigatório | Exemplos |
|---------|-----------|-------------|----------|
| `#` | TAG principal (busca) | ✅ SIM | `#GIT` `#DB` `#LEARN` |
| `@` | Status/Resultado | ⚠️ Recomendado | `@START` `@SUCCESS` `@ERROR` |
| `~` | Contexto adicional | ❌ Opcional | `~PRODUCTION` `~LEARNING` |
| `!` | Prioridade/Urgência | ❌ Opcional | `!CRITICAL` `!REVIEW` |

---

## 🏷️ TAXONOMIA COMPLETA

### CATEGORIAS PRINCIPAIS

```
#GIT          - Operações Git/GitHub
#DB           - Database (PostgreSQL, Oracle, MySQL, etc.)
#DATA         - Data Engineering (pipelines, ETL, analytics)
#INFRA        - Infraestrutura (Terraform, Ansible, AWS, Azure, GCP)
#CODE         - Desenvolvimento (Python, scripts, apps)
#DEBUG        - Troubleshooting/Investigação
#LEARN        - Sessões de aprendizado
#ARCH         - Arquitetura/Design de sistemas
#DOC          - Documentação
#MCP          - Configuração/uso de MCP servers
#SECURITY     - Segurança, autenticação, compliance
#PERF         - Performance tuning
#MIGRATE      - Migrações (DB, cloud, sistemas)
```

### SUBCATEGORIAS POR CATEGORIA

#### #GIT
```
:SETUP        - Configuração inicial/repositório
:BRANCH       - Operações de branch
:COMMIT       - Commits/histórico
:PR           - Pull requests
:MERGE        - Merges/conflitos
:CLONE        - Clone/fork de repositórios
:CONFIG       - Git config/credentials
```

#### #DB
```
:QUERY        - Consultas/Performance de queries
:MIGRATION    - Migrações de schema/dados
:BACKUP       - Backup/Recovery
:HA           - High Availability/Replicação
:TUNE         - Tuning/Otimização
:MONITOR      - Monitoramento/Alertas
:SECURITY     - Permissões/Auditoria
```

#### #DATA
```
:PIPELINE     - Data pipelines/workflows
:ETL          - ETL/ELT processes
:WAREHOUSE    - Data warehouse/lake
:QUALITY      - Data quality/validation
:STREAM       - Streaming/real-time
:BATCH        - Batch processing
```

#### #INFRA
```
:TERRAFORM    - Terraform IaC
:ANSIBLE      - Ansible automation
:DOCKER       - Docker/containers
:K8S          - Kubernetes
:CLOUD        - Cloud resources (AWS/Azure/GCP)
:NETWORK      - Networking
:MONITOR      - Infrastructure monitoring
```

#### #LEARN
```
:CONCEPT      - Conceito teórico
:PRACTICE     - Prática/Exercício
:REVIEW       - Revisão/Consolidação
:TUTORIAL     - Tutorial seguido
:ITER         - Iteração de aprendizado (ITER1, ITER2, etc.)
```

#### #DEBUG
```
:ERROR        - Erro específico
:INVESTIGATE  - Investigação
:RCA          - Root Cause Analysis
:HOTFIX       - Hotfix urgente
:WORKAROUND   - Workaround temporário
```

### STATUS

```
@START        - Iniciando atividade
@PROGRESS     - Em andamento
@SUCCESS      - Completado com sucesso
@ERROR        - Erro encontrado/não resolvido
@BLOCKED      - Bloqueado/Impedido
@RESOLVED     - Erro resolvido
@REVIEW       - Precisa revisão
@DONE         - Finalizado completamente
@ABANDONED    - Abandonado/Cancelado
```

### CONTEXTO

```
~PRODUCTION   - Produção/Ambiente prod
~STAGING      - Staging/QA
~DEV          - Desenvolvimento
~LOCAL        - Ambiente local
~LEARNING     - Contexto educacional
~EXPLORE      - Exploratório/Investigativo
~POC          - Proof of Concept
~REAL         - Projeto real (vs exemplo/tutorial)
~TEST         - Testing/Validação
```

### PRIORIDADE

```
!CRITICAL     - Crítico/Urgente
!HIGH         - Alta prioridade
!MEDIUM       - Média prioridade
!LOW          - Baixa prioridade
!REVIEW       - Requer revisão senior
!BLOCKED      - Bloqueado aguardando algo
```

---

## 📝 PADRÕES DE USO

### 1. Sessão Simples

```
INÍCIO:
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @START ~[CONTEXTO]
[Descrição do objetivo]

FIM:
#[MESMA-TAG] @[STATUS] ~[CONTEXTO]
[Resumo do resultado]
[Artefatos criados]
[Próximos passos]
```

### 2. Sessão com Múltiplas Etapas

```
ETAPA 1:
#[TAG-GERAL]:STEP1 @START
[trabalho...]
#[TAG-GERAL]:STEP1 @SUCCESS

ETAPA 2:
#[TAG-GERAL]:STEP2 @START
[trabalho...]
#[TAG-GERAL]:STEP2 @SUCCESS

FINAL:
#[TAG-GERAL] @DONE
[Resumo completo de todas etapas]
```

### 3. Debug/Troubleshooting

```
IDENTIFICAÇÃO:
#DEBUG:[SISTEMA]:[SINTOMA] @ERROR ~PRODUCTION !CRITICAL
[Descrição do problema]
[Logs/Evidências]

INVESTIGAÇÃO:
#DEBUG:[SISTEMA]:[SINTOMA] @PROGRESS
[Testes realizados]
[Hipóteses]

RESOLUÇÃO:
#DEBUG:[SISTEMA]:[SINTOMA] @RESOLVED ~PRODUCTION
[Root cause]
[Solução aplicada]
[Prevenção futura]
```

---

## 🔍 ESTRATÉGIAS DE BUSCA

### Busca Hierárquica (do geral ao específico)

```
Nível 1 - Categoria:
conversation_search(query="GIT")
→ Todos chats relacionados a Git

Nível 2 - Subcategoria:
conversation_search(query="GIT SETUP")
→ Apenas setups de Git

Nível 3 - Detalhe:
conversation_search(query="GIT SETUP CALCULATOR")
→ Setup específico do projeto calculadora
```

### Busca por Status

```
Problemas não resolvidos:
conversation_search(query="ERROR BLOCKED")

Sucessos para referência:
conversation_search(query="SUCCESS")

Itens pendentes de revisão:
conversation_search(query="REVIEW")
```

### Busca por Contexto

```
Tudo relacionado a produção:
conversation_search(query="PRODUCTION")

Sessões de aprendizado:
conversation_search(query="LEARNING")

POCs e experimentos:
conversation_search(query="POC EXPLORE")
```

### Busca Temporal + Tags

```
Últimos 10 chats sobre database:
recent_chats(n=10)
→ Filtrar manualmente por "#DB"

Chats da última semana sobre Git:
recent_chats(n=20, after="2025-10-03")
→ Buscar "GIT" nos resultados
```

### Busca Combinada

```
Erros críticos em produção (última semana):
1. recent_chats(n=20, after="2025-10-03")
2. Filtrar: "ERROR CRITICAL PRODUCTION"

Aprendizados sobre MCP:
conversation_search(query="LEARN MCP")
```

---

## 🎯 EXEMPLOS PRÁTICOS

### Exemplo 1: Sessão de Aprendizado

```
==========================================
CHAT: "Git MCP Tutorial - Calculadora"
==========================================

#LEARN:PRACTICE:GIT-ITER1 @START ~LEARNING
Objetivo: Iteração 1 - Setup repositório e estrutura inicial
Repo: pierre.ribeiro/Claude-Test-automation
Branch: feature/simple-calculator

---

@Backend dev@
[comandos MCP executados...]

#LEARN:PRACTICE:GIT-ITER1 @PROGRESS ~LEARNING
Status:
✅ Branch criado
✅ README.md OK
❌ Erro em __init__.py (path incorreto)

---

[debugging...]

#LEARN:PRACTICE:GIT-ITER1 @SUCCESS ~LEARNING
Resultado:
✅ Estrutura completa criada
✅ 4 commits realizados
✅ Path issue resolvido (/calculator/__init__.py correto)

Artefatos:
- Branch: feature/simple-calculator
- Files: calculator/__init__.py, README.md, tests/__init__.py

Aprendizado:
- MCP GitHub paths são absolutos com leading /
- create_or_update_file = commit automático

Next: #LEARN:PRACTICE:GIT-ITER2 - Implementar operações

==========================================
```

**Busca posterior:**
```
conversation_search(query="LEARN PRACTICE GIT ITER1")
→ Recupera toda a sessão acima
```

### Exemplo 2: Debug Produção

```
==========================================
CHAT: "Hotfix - User Login Timeout"
==========================================

#DEBUG:DB:LOGIN-TIMEOUT @ERROR ~PRODUCTION !CRITICAL
Sintoma: Login de usuários timeout após 30s
Impacto: 100% usuários afetados
Início: 2025-10-10 14:30 UTC

Logs:
```
ERROR: Query timeout on users.authenticate()
Query: SELECT * FROM users WHERE email = ? AND active = true
Execution time: 32.4s
```

---

#DEBUG:DB:LOGIN-TIMEOUT @PROGRESS
Investigação:
1. ✅ EXPLAIN ANALYZE mostra Seq Scan em 10M rows
2. ✅ Missing index em users(email, active)
3. ⚠️ Tabela users não tem VACUUM há 6 meses

Hipótese: Combinação de missing index + table bloat

---

#DEBUG:DB:LOGIN-TIMEOUT @RESOLVED ~PRODUCTION
Root Cause:
- Index missing em users(email, active)
- Table bloat 67% (dead tuples)

Solução Aplicada:
1. CREATE INDEX CONCURRENTLY idx_users_email_active 
   ON users(email, active) WHERE active = true;
2. VACUUM ANALYZE users;

Resultado:
- Query time: 32s → 180ms (99.4% improvement)
- 0 downtime durante fix

Prevenção:
- Adicionar index a repositório Terraform
- Configurar auto-vacuum mais agressivo
- Alert em Grafana para queries >5s

Follow-up:
#DB:MONITOR:SLOW-QUERIES - Adicionar monitoramento
#INFRA:TERRAFORM:DB-INDEXES - Adicionar index ao IaC

==========================================
```

**Busca posterior:**
```
conversation_search(query="DEBUG LOGIN TIMEOUT RESOLVED")
→ Recupera solução completa para referência futura
```

### Exemplo 3: Setup de Infraestrutura

```
==========================================
CHAT: "AWS RDS PostgreSQL - Setup Produção"
==========================================

#INFRA:CLOUD:RDS-PG-PROD @START ~PRODUCTION
Objetivo: Provisionar RDS PostgreSQL para produção
Specs: db.r6g.2xlarge, Multi-AZ, 500GB GP3

---

#INFRA:TERRAFORM:RDS-PG-PROD @PROGRESS
Status:
✅ VPC e subnets criadas
✅ Security groups configurados
✅ Parameter group customizado (max_connections=500)
⏳ Aguardando approval de custos ($450/mês estimado)

---

#INFRA:TERRAFORM:RDS-PG-PROD @BLOCKED !REVIEW
Bloqueio: CFO precisa aprovar budget adicional
Alternativa proposta: db.r6g.xlarge ($225/mês) com vertical scaling futuro
ETA aprovação: 2-3 dias úteis

---

#INFRA:TERRAFORM:RDS-PG-PROD @SUCCESS ~PRODUCTION
Resolução: Aprovado db.r6g.xlarge com auto-scaling habilitado

Final Config:
- Instance: db.r6g.xlarge
- Storage: 500GB GP3 (3000 IOPS)
- Multi-AZ: Enabled
- Backup: 7 dias retention
- Monitoring: Enhanced monitoring + CloudWatch alarms

Terraform modules:
- modules/rds-postgresql/main.tf
- modules/rds-postgresql/variables.tf
- environments/prod/rds.tf

Connection string armazenado em: AWS Secrets Manager
Grafana dashboard: https://grafana.company.com/d/rds-prod

Next: #DB:MIGRATION:PROD-DATA - Migrar dados de on-prem

==========================================
```

### Exemplo 4: Sessão Multi-Iteração

```
==========================================
CHAT: "Data Pipeline - Logs Analytics"
==========================================

#DATA:PIPELINE:LOGS-ANALYTICS @START ~POC
Objetivo: POC de pipeline para análise de logs de aplicação
Stack proposto: S3 → Glue → Athena → QuickSight

---

#DATA:PIPELINE:LOGS-ANALYTICS:STEP1 @START
Etapa 1: S3 bucket structure e lifecycle policies

#DATA:PIPELINE:LOGS-ANALYTICS:STEP1 @SUCCESS
✅ Bucket criado: company-logs-analytics-prod
✅ Partitioning: year/month/day/hour
✅ Lifecycle: Archive to Glacier após 90 dias

---

#DATA:PIPELINE:LOGS-ANALYTICS:STEP2 @START
Etapa 2: Glue Crawler e Catalog

#DATA:PIPELINE:LOGS-ANALYTICS:STEP2 @SUCCESS
✅ Crawler configurado (daily 2AM UTC)
✅ Database: logs_analytics
✅ Table: application_logs (schema auto-detected)

---

#DATA:PIPELINE:LOGS-ANALYTICS:STEP3 @START
Etapa 3: Athena queries e views

#DATA:PIPELINE:LOGS-ANALYTICS:STEP3 @ERROR
❌ Athena query timeout em queries complexas
Issue: Partition pruning não está funcionando

#DATA:PIPELINE:LOGS-ANALYTICS:STEP3 @RESOLVED
✅ Fixed: Adicionar partition projection no Glue Table
Performance: Query time 45s → 3s

---

#DATA:PIPELINE:LOGS-ANALYTICS @DONE ~POC
Status Final: POC aprovado para produção

Métricas:
- Volume: 5TB logs/mês
- Query performance: avg 3s (p95: 8s)
- Custo estimado: $180/mês (vs $800 solução anterior)

Artefatos:
- Terraform: modules/data-pipeline/logs-analytics/
- Queries: sql/athena/logs-analytics/
- Dashboard: QuickSight "Application Logs Overview"

Decisão: Migrar para produção next sprint

Next: #DATA:PIPELINE:LOGS-ANALYTICS-PROD - Deploy produção

==========================================
```

---

## 🚦 BOAS PRÁTICAS

### ✅ DO (Faça)

1. **Seja Consistente**
   - Use sempre o mesmo formato
   - Mantenha hierarquia (categoria:subcategoria:detalhe)

2. **Seja Específico no Detalhe**
   - ✅ `#GIT:SETUP:CALCULATOR-PROJECT`
   - ❌ `#GIT:SETUP:PROJECT`

3. **Atualize Status**
   - Comece com `@START`
   - Atualize para `@PROGRESS` se relevante
   - Finalize com `@SUCCESS/@ERROR/@DONE`

4. **Use Contexto Relevante**
   - `~PRODUCTION` para prod
   - `~LEARNING` para estudos
   - `~POC` para experimentos

5. **Documente Resultados**
   - O que foi feito
   - Artefatos criados
   - Aprendizados chave
   - Próximos passos

### ❌ DON'T (Evite)

1. **Tags Muito Longas**
   - ❌ `#GIT:SETUP:SIMPLE-CALCULATOR-PYTHON-PROJECT-WITH-TESTS`
   - ✅ `#GIT:SETUP:CALCULATOR`

2. **Misturar Idiomas**
   - ✅ Tudo em inglês (melhor para busca)
   - ❌ Mix português/inglês

3. **Tags Ambíguas**
   - ❌ `#PROJECT:THING:STUFF`
   - ✅ `#DATA:ETL:USER-EVENTS`

4. **Esquecer de Fechar**
   - Sempre finalize com status final (@SUCCESS/@ERROR/@DONE)

5. **Overuse de Prioridades**
   - Use `!CRITICAL` apenas quando realmente crítico
   - Não trivialize importância

---

## 🔧 INTEGRAÇÃO COM CLAUDE

### Prompts para Busca

**Template Básico:**
```
@[Persona]@

Busque nas conversas passadas:
Tags: [TAG1] [TAG2] [TAG3]
Período: [últimos X dias / específico]
Foco: [o que você quer encontrar]

Com base no que encontrar, [ação desejada].
```

**Exemplo Concreto:**
```
@Backend dev@

Busque nas conversas passadas:
Tags: DEBUG DB TIMEOUT RESOLVED
Período: último mês
Foco: soluções de timeout em banco de dados

Com base no que encontrar, sugira abordagem para 
o novo caso de timeout na query de relatórios.
```

### Recuperação de Contexto

```
@Teach me@

Recupere a sessão de aprendizado:
Tags: LEARN PRACTICE GIT ITER1

Quero revisar:
1. Comandos MCP usados
2. Problemas encontrados e soluções
3. Estrutura de arquivos criada

Use isso como base para planejar ITER2.
```

### Auditoria de Progresso

```
@Backend dev@

Liste todas sessões relacionadas a:
Tags: DATA PIPELINE LOGS-ANALYTICS

Mostre cronologia:
- Etapas completadas (@SUCCESS/@DONE)
- Bloqueios atuais (@BLOCKED)
- Erros não resolvidos (@ERROR)

Gere relatório de status do projeto.
```

---

## 📊 MÉTRICAS E EVOLUÇÃO

### Avaliação do Sistema

Após 1 mês de uso, avalie:

1. **Taxa de Recuperação**
   - Quantas vezes conseguiu encontrar info rapidamente?
   - Tags foram descritivas o suficiente?

2. **Consistência**
   - Conseguiu manter padrão?
   - Alguma categoria faltando?

3. **Utilidade**
   - System saving tempo real?
   - Continuidade entre chats melhorou?

### Iteração do Protocolo

```
Versão 1.0 (atual): Base funcional
Versão 1.1 (futuro): Ajustes baseados em uso
Versão 2.0 (futuro): Possível integração com Memory
```

---

## 🎯 QUICK REFERENCE

### Anatomia de uma TAG Completa

```
#CATEGORIA:SUBCATEGORIA:DETALHE @STATUS ~CONTEXTO !PRIORIDADE

Exemplo:
#DB:QUERY:USER-LOGIN @RESOLVED ~PRODUCTION !CRITICAL
```

### Top 10 Categorias

```
1. #GIT      - Git/GitHub operations
2. #DB       - Database work
3. #DATA     - Data engineering
4. #INFRA    - Infrastructure
5. #CODE     - Development
6. #DEBUG    - Troubleshooting
7. #LEARN    - Learning sessions
8. #ARCH     - Architecture/Design
9. #MCP      - MCP configuration
10. #DOC     - Documentation
```

### Top 10 Status

```
1. @START      - Beginning
2. @PROGRESS   - In progress
3. @SUCCESS    - Completed successfully
4. @ERROR      - Error/Issue
5. @BLOCKED    - Blocked
6. @RESOLVED   - Fixed
7. @REVIEW     - Needs review
8. @DONE       - Fully complete
9. @ABANDONED  - Cancelled
10. @TESTING   - Testing phase
```

---

## 📚 RECURSOS

### Ferramentas Claude

- `conversation_search(query, max_results)` - Busca por keywords
- `recent_chats(n, before, after, sort_order)` - Busca temporal

### Referências

- Claude Preferences: `claude.md v1.6.0`
- TAG System: Este documento
- Memory: Complementar ao TAG system

---

**Fim do TAG Protocol v1.0**

*Criado por Pierre Ribeiro para otimização de workflow com Claude Desktop*
*Última atualização: 2025-10-10*
