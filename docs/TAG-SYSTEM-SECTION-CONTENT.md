## 🏷️ TAG SYSTEM FOR CHAT SEARCH (v1.0)

### Purpose

Enable efficient search and context recovery across conversations using Claude Desktop's `conversation_search` and `recent_chats` MCP tools.

**Use Case:** When you need to find past conversations, continue work from previous sessions, or audit project progress.

### Quick Reference

**Format:**
```
#[CATEGORIA]:[SUBCATEGORIA]:[DETALHE] @[STATUS] ~[CONTEXTO] ![PRIORIDADE]
```

**Required:** `#CATEGORY` (e.g., `#GIT`, `#DB`, `#LEARN`)
**Recommended:** `@STATUS` (e.g., `@START`, `@SUCCESS`, `@ERROR`)
**Optional:** `~CONTEXT`, `!PRIORITY`

### Top 10 Categories

1. `#GIT` - Git/GitHub operations
2. `#DB` - Database work
3. `#DATA` - Data engineering
4. `#INFRA` - Infrastructure (Terraform, AWS, etc.)
5. `#CODE` - Development (Python, scripts)
6. `#DEBUG` - Troubleshooting/Investigation
7. `#LEARN` - Learning sessions
8. `#ARCH` - Architecture/Design
9. `#MCP` - MCP server configuration
10. `#DOC` - Documentation

### Top 10 Status Indicators

1. `@START` - Beginning activity
2. `@PROGRESS` - Work in progress
3. `@SUCCESS` - Completed successfully
4. `@ERROR` - Error encountered
5. `@BLOCKED` - Blocked/impediment
6. `@RESOLVED` - Error resolved
7. `@REVIEW` - Needs review
8. `@DONE` - Fully complete
9. `@ABANDONED` - Cancelled
10. `@TESTING` - Testing phase

### Usage Guidelines

1. **Session Start:** Place tag at beginning of conversation
2. **Progress Updates:** Add tag when significant progress occurs
3. **Session End:** Always place final tag with status
4. **Search Later:** Use `conversation_search(query="TAG KEYWORDS")` to find

### Search Integration

**Basic Search:**
```
conversation_search(query="GIT SETUP")
→ All Git setup conversations
```

**Status Search:**
```
conversation_search(query="ERROR PRODUCTION")
→ All production errors
```

**Context Search:**
```
conversation_search(query="LEARNING PRACTICE")
→ All learning/practice sessions
```

### Examples

**Example 1: Learning Session**
```
#LEARN:PRACTICE:GIT-BASICS @START ~LEARNING
Objetivo: Aprender comandos Git básicos

[... work ...]

#LEARN:PRACTICE:GIT-BASICS @SUCCESS ~LEARNING
✅ Aprendi: clone, commit, push, pull
Next: #LEARN:PRACTICE:GIT-BRANCHES
```

**Example 2: Production Issue**
```
#DEBUG:DB:TIMEOUT @ERROR ~PRODUCTION !CRITICAL
Problema: Query timeout em users table

[... investigation ...]

#DEBUG:DB:TIMEOUT @RESOLVED ~PRODUCTION
Fix: Adicionado index em user_id
```

### Full Documentation

For complete taxonomy, detailed examples, search strategies, and integration guidelines, see:
- **Full Protocol:** [TAG-Protocol-v1.0.md](docs/TAG-Protocol-v1.0.md)
- **Quick Start Guide:** [TAG-Protocol-QuickStart.md](docs/TAG-Protocol-QuickStart.md) *(coming soon)*

---
