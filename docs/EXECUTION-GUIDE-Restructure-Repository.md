# EXECUTION GUIDE: Repository Restructure
**For:** Haiku 4.5  
**Task:** Reorganize myclaudemd repository for Skills architecture  
**Estimated Time:** 30-40 minutes  
**Risk Level:** LOW (non-destructive, git-tracked)

---

## 🎯 OBJECTIVE

Transform the current myclaudemd repository structure to support:
1. Skills architecture (19 modular skills)
2. Organized version backups (archive/)
3. Separated documentation by type (guides/specs/analysis)
4. Build artifacts distribution (dist/)

---

## 📋 PRE-FLIGHT CHECKLIST

Before starting, verify:

```bash
# 1. You are in the correct repository
cd /Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd
pwd
# Expected: /Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd

# 2. Git status is clean (no uncommitted changes)
git status
# Expected: "nothing to commit, working tree clean"
# If not clean: commit or stash changes first

# 3. You are on the correct branch
git branch --show-current
# Expected: main (or create feature branch if preferred)

# 4. Backup current state
git tag backup-before-restructure-$(date +%Y%m%d-%H%M%S)
git push origin --tags
```

**⚠️ STOP HERE if any check fails. Fix issues before continuing.**

---

## 🏗️ EXECUTION STEPS

### PHASE 1: Create New Directory Structure

**Objective:** Create all new directories without moving any files yet.

**Commands:**
```bash
# Navigate to repo root
cd /Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd

# Create archive directories for version history
mkdir -p archive/v1.0.0
mkdir -p archive/v1.5.0
mkdir -p archive/v1.6.0
mkdir -p archive/v1.7.0
mkdir -p archive/v1.8.0

# Create skills directory structure
mkdir -p skills/personas
mkdir -p skills/modes
mkdir -p skills/references

# Create documentation subdirectories
mkdir -p docs/guides
mkdir -p docs/specs
mkdir -p docs/analysis
mkdir -p docs/legacy

# Create distribution directory for packaged skills
mkdir -p dist

# Create scripts directory for automation
mkdir -p scripts

# Create current/ for work in progress
mkdir -p current

# Create tracking/ if it doesn't exist (from previous session)
mkdir -p tracking
```

**Validation:**
```bash
# Verify all directories were created
ls -ld archive/{v1.0.0,v1.5.0,v1.6.0,v1.7.0,v1.8.0}
ls -ld skills/{personas,modes,references}
ls -ld docs/{guides,specs,analysis,legacy}
ls -ld dist scripts current tracking

# Expected: All directories should exist with "drwxr-xr-x" permissions
```

**✅ Checkpoint 1:** All directories created successfully?
- [ ] YES - Continue to Phase 2
- [ ] NO - Review error messages, fix, retry

---

### PHASE 2: Move Archive Files (Backups)

**Objective:** Move old backup files to organized archive/ structure.

**Commands:**
```bash
# Move v1.6.0 backup
if [ -f claude.md.v1.6.0.backup ]; then
    mv claude.md.v1.6.0.backup archive/v1.6.0/claude.md
    echo "✅ Moved v1.6.0 backup to archive/"
else
    echo "⚠️  File claude.md.v1.6.0.backup not found (may have been moved already)"
fi

# Move v1.8.0 versioned file
if [ -f claude-md-PierreRibeiro_v1.8.0.md ]; then
    cp claude-md-PierreRibeiro_v1.8.0.md archive/v1.8.0/claude.md
    echo "✅ Copied v1.8.0 to archive/ (keeping original for now)"
else
    echo "⚠️  File claude-md-PierreRibeiro_v1.8.0.md not found"
fi

# Create placeholder RELEASE-NOTES.md for archived versions
for version in v1.0.0 v1.5.0 v1.6.0 v1.7.0 v1.8.0; do
    if [ ! -f "archive/$version/RELEASE-NOTES.md" ]; then
        echo "# Release Notes - $version" > "archive/$version/RELEASE-NOTES.md"
        echo "" >> "archive/$version/RELEASE-NOTES.md"
        echo "Archived version from repository restructure." >> "archive/$version/RELEASE-NOTES.md"
        echo "✅ Created RELEASE-NOTES.md for $version"
    fi
done
```

**Validation:**
```bash
# Check archive structure
ls -lh archive/v1.6.0/
ls -lh archive/v1.8.0/

# Each should contain:
# - claude.md (the archived version)
# - RELEASE-NOTES.md (placeholder or real notes)
```

**✅ Checkpoint 2:** Archive files organized?
- [ ] YES - Continue to Phase 3
- [ ] NO - Check which files are missing, investigate

---

### PHASE 3: Reorganize Documentation

**Objective:** Move docs/ files into appropriate subdirectories.

**Commands:**
```bash
# Move deployment guides
mv docs/DEPLOYMENT.md docs/guides/ 2>/dev/null || echo "DEPLOYMENT.md already moved or doesn't exist"
mv docs/DEPLOYMENT-GUIDE-*.md docs/guides/ 2>/dev/null || echo "DEPLOYMENT-GUIDE files already moved"

# Move PR/Issue guides
mv docs/CREATE-PR-GUIDE.md docs/guides/ 2>/dev/null || echo "CREATE-PR-GUIDE.md already moved"
mv docs/CLOSE-ISSUES-GUIDE.md docs/guides/ 2>/dev/null || echo "CLOSE-ISSUES-GUIDE.md already moved"

# Move PRD specifications
mv docs/PRD-*.md docs/specs/ 2>/dev/null || echo "PRD files already moved"

# Move architecture documents
mv docs/ARCHITECTURE-*.md docs/specs/ 2>/dev/null || echo "ARCHITECTURE files already moved"

# Move TAG protocol documents
mv docs/TAG-Protocol*.md docs/specs/ 2>/dev/null || echo "TAG-Protocol files already moved"

# Move analysis documents
mv docs/*ANALISE*.md docs/analysis/ 2>/dev/null || echo "ANALISE files already moved"
mv docs/HANDOFF-*.md docs/analysis/ 2>/dev/null || echo "HANDOFF files already moved"

# Move implementation summaries
mv docs/IMPLEMENTATION-SUMMARY.md docs/analysis/ 2>/dev/null || echo "IMPLEMENTATION-SUMMARY already moved"
mv docs/PROJECT_SUMMARY.md docs/analysis/ 2>/dev/null || echo "PROJECT_SUMMARY already moved"
mv docs/NEXT_STEPS.md docs/analysis/ 2>/dev/null || echo "NEXT_STEPS already moved"

# Move legacy issue files
mv docs/ISSUE-*.txt docs/legacy/ 2>/dev/null || echo "ISSUE files already moved"

# Move proposal documents (can go to analysis or specs)
mv docs/PROPOSTA-*.md docs/analysis/ 2>/dev/null || echo "PROPOSTA files already moved"

# Move test reports
mv docs/*TEST*.md docs/analysis/ 2>/dev/null || echo "TEST reports already moved"

# Move specifications index
mv docs/GITHUB-ISSUES-SPECIFICATIONS.md docs/specs/ 2>/dev/null || echo "GITHUB-ISSUES-SPECIFICATIONS already moved"
```

**Validation:**
```bash
# Check what remains in docs/ root
ls docs/*.md 2>/dev/null | wc -l
# Expected: 0 or very few files (only truly root-level docs)

# Check guides
ls docs/guides/
# Expected: DEPLOYMENT.md, CREATE-PR-GUIDE.md, CLOSE-ISSUES-GUIDE.md, etc.

# Check specs
ls docs/specs/
# Expected: PRD-*.md, ARCHITECTURE-*.md, TAG-Protocol*.md

# Check analysis
ls docs/analysis/
# Expected: HANDOFF-*.md, IMPLEMENTATION-SUMMARY.md, etc.

# Check legacy
ls docs/legacy/
# Expected: ISSUE-01.txt, ISSUE-02.txt, ..., ISSUE-08.txt
```

**✅ Checkpoint 3:** Documentation reorganized?
- [ ] YES - Continue to Phase 4
- [ ] NO - Manually move remaining files

---

### PHASE 4: Create Skills Structure

**Objective:** Prepare skills/ directories with initial POC skill.

**Commands:**
```bash
# Create database-expert skill (POC already validated)
mkdir -p skills/personas/database-expert

# If you have the POC SKILL.md, copy it
# Otherwise, create placeholder
if [ ! -f skills/personas/database-expert/SKILL.md ]; then
    cat > skills/personas/database-expert/SKILL.md << 'EOF'
---
name: database-expert
description: Persona Database Reliability Engineer (DBRE) for database administration. ACTIVATE when messages contain TAGs @Database expert@ or @DBA mode@, or discussions about Oracle, PostgreSQL, SQL Server, MySQL, BigQuery, performance tuning, query optimization, HA/DR, migrations.
---

# Database Reliability Engineer (DBRE) Persona 🗄️

## Identity & Role

Senior Database Administrator and Reliability Engineer specializing in enterprise database systems, high availability architectures, and performance optimization.

## Activation Criteria

**Automatic Triggers**:
- TAGs: `@Database expert@`, `@DBA mode@`
- Keywords: Oracle, PostgreSQL, SQL Server, MySQL, BigQuery, performance tuning, query optimization, HA/DR, high availability, disaster recovery, migrations, backup, recovery, replication, indexes, execution plans, AWR, ASH, RMAN, Data Guard, Patroni, Barman, PgBouncer

## Behavior Profile

### Communication Style
- **Tone**: Technical, risk-aware, business-impact focused
- **Approach**: Automation-first, monitoring-driven
- **Code Style**: Production-ready with rollback procedures

### Expertise Stack
- Oracle 19c/23ai (Expert)
- PostgreSQL (Expert)
- SQL Server (Proficient)
- MySQL (Proficient)
- BigQuery (Proficient)

### Response Patterns
- Include monitoring queries
- Provide rollback procedures
- Estimate downtime/impact
- Consider HA/DR implications

## Integration with Core

### Guardrails Applied
- P0: Always validate before production changes
- P1: Include performance impact estimates

### Context Awareness
- User: Pierre Ribeiro (15+ years DBA experience)
- Stack: Oracle/PostgreSQL primary
- Environment: Production systems, zero-downtime requirements

---
*Skill for Pierre Ribeiro's Claude Desktop*
*Part of claude.md v2.0 modular architecture*
EOF
    echo "✅ Created database-expert SKILL.md (POC)"
fi

# Create persona directories (empty for now - will be populated in Phase 1 of Skills project)
for persona in emergency-engineer debug-investigator learning-mentor architect code-reviewer product-manager frontend-developer backend-developer neutral-persona; do
    mkdir -p "skills/personas/$persona"
    echo "✅ Created directory: skills/personas/$persona"
done

# Create mode directories
for mode in discovery-mode build-mode debug-mode learning-mode architecture-mode; do
    mkdir -p "skills/modes/$mode"
    echo "✅ Created directory: skills/modes/$mode"
done

# Create reference directories
for ref in guardrails-enhanced tag-system activation-commands output-templates; do
    mkdir -p "skills/references/$ref"
    echo "✅ Created directory: skills/references/$ref"
done
```

**Validation:**
```bash
# Count persona directories
ls skills/personas/ | wc -l
# Expected: 10

# Count mode directories
ls skills/modes/ | wc -l
# Expected: 5

# Count reference directories
ls skills/references/ | wc -l
# Expected: 4

# Verify database-expert has SKILL.md
ls -lh skills/personas/database-expert/SKILL.md
# Expected: File exists
```

**✅ Checkpoint 4:** Skills structure created?
- [ ] YES - Continue to Phase 5
- [ ] NO - Review errors, retry creation

---

### PHASE 5: Update .gitignore

**Objective:** Prevent build artifacts and ad-hoc backups from being committed.

**Commands:**
```bash
# Backup current .gitignore
cp .gitignore .gitignore.backup

# Add new rules
cat >> .gitignore << 'EOF'

# === Repository Restructure - Added 2025-01-16 ===

# Skills distribution artifacts (generated by scripts)
dist/*.skill

# Ad-hoc backups (use archive/ instead)
*.backup
*-backup

# Temporary skill work files
skills/**/*.tmp
skills/**/*.draft

# Build/package temporary files
.skill-build/
EOF

echo "✅ Updated .gitignore"
```

**Validation:**
```bash
# Check .gitignore was updated
tail -15 .gitignore
# Expected: Should see the new section
```

**✅ Checkpoint 5:** .gitignore updated?
- [ ] YES - Continue to Phase 6
- [ ] NO - Manually edit .gitignore

---

### PHASE 6: Create Automation Scripts

**Objective:** Create helper scripts for common tasks.

#### Script 1: package-skill.sh

```bash
cat > scripts/package-skill.sh << 'EOFSCRIPT'
#!/bin/bash
#
# Package a single skill into .skill file (ZIP format)
# Usage: ./scripts/package-skill.sh <skill-path>
# Example: ./scripts/package-skill.sh skills/personas/database-expert
#

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <skill-path>"
    echo "Example: $0 skills/personas/database-expert"
    exit 1
fi

SKILL_PATH="$1"
SKILL_NAME=$(basename "$SKILL_PATH")

# Validate skill directory exists
if [ ! -d "$SKILL_PATH" ]; then
    echo "❌ ERROR: Skill directory not found: $SKILL_PATH"
    exit 1
fi

# Validate SKILL.md exists
if [ ! -f "$SKILL_PATH/SKILL.md" ]; then
    echo "❌ ERROR: SKILL.md not found in $SKILL_PATH"
    exit 1
fi

# Create dist/ if it doesn't exist
mkdir -p dist

# Package skill (ZIP with SKILL.md at root)
cd "$SKILL_PATH"
zip -q "../../dist/${SKILL_NAME}.skill" SKILL.md
cd - > /dev/null

echo "✅ Packaged: dist/${SKILL_NAME}.skill"
ls -lh "dist/${SKILL_NAME}.skill"
EOFSCRIPT

chmod +x scripts/package-skill.sh
echo "✅ Created scripts/package-skill.sh"
```

#### Script 2: validate-skills.sh

```bash
cat > scripts/validate-skills.sh << 'EOFSCRIPT'
#!/bin/bash
#
# Validate all skills have proper structure
# Checks for SKILL.md existence and basic YAML frontmatter
#

set -e

ERRORS=0

echo "🔍 Validating skills structure..."
echo ""

for skill_dir in skills/*/*/*; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        
        # Check SKILL.md exists
        if [ ! -f "$skill_dir/SKILL.md" ]; then
            echo "❌ ERROR: Missing SKILL.md in $skill_dir"
            ((ERRORS++))
            continue
        fi
        
        # Check YAML frontmatter exists
        if ! grep -q "^---" "$skill_dir/SKILL.md"; then
            echo "❌ ERROR: Missing YAML frontmatter in $skill_dir/SKILL.md"
            ((ERRORS++))
            continue
        fi
        
        # Check 'name' field exists
        if ! grep -q "^name:" "$skill_dir/SKILL.md"; then
            echo "❌ ERROR: Missing 'name:' field in $skill_dir/SKILL.md"
            ((ERRORS++))
            continue
        fi
        
        # Check 'description' field exists
        if ! grep -q "^description:" "$skill_dir/SKILL.md"; then
            echo "❌ ERROR: Missing 'description:' field in $skill_dir/SKILL.md"
            ((ERRORS++))
            continue
        fi
        
        echo "✅ Valid: $skill_name"
    fi
done

echo ""
if [ $ERRORS -eq 0 ]; then
    echo "✅ All skills validated successfully!"
    exit 0
else
    echo "❌ Validation failed with $ERRORS error(s)"
    exit 1
fi
EOFSCRIPT

chmod +x scripts/validate-skills.sh
echo "✅ Created scripts/validate-skills.sh"
```

#### Script 3: archive-version.sh

```bash
cat > scripts/archive-version.sh << 'EOFSCRIPT'
#!/bin/bash
#
# Archive current claude.md version
# Usage: ./scripts/archive-version.sh <version>
# Example: ./scripts/archive-version.sh v2.0.0
#

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 v2.0.0"
    exit 1
fi

VERSION="$1"
ARCHIVE_DIR="archive/$VERSION"

# Validate version format (vX.Y.Z)
if [[ ! "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "❌ ERROR: Invalid version format. Expected: vX.Y.Z (e.g., v2.0.0)"
    exit 1
fi

# Check if version already archived
if [ -d "$ARCHIVE_DIR" ]; then
    echo "⚠️  WARNING: Version $VERSION already exists in archive/"
    read -p "Overwrite? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Aborted"
        exit 1
    fi
fi

# Create archive directory
mkdir -p "$ARCHIVE_DIR"

# Copy current claude.md
if [ -f claude.md ]; then
    cp claude.md "$ARCHIVE_DIR/claude.md"
    echo "✅ Archived: $ARCHIVE_DIR/claude.md"
else
    echo "❌ ERROR: claude.md not found in repository root"
    exit 1
fi

# Create RELEASE-NOTES.md if it doesn't exist
if [ ! -f "$ARCHIVE_DIR/RELEASE-NOTES.md" ]; then
    cat > "$ARCHIVE_DIR/RELEASE-NOTES.md" << EOF
# Release Notes - $VERSION

**Date:** $(date +%Y-%m-%d)
**Status:** Archived

## Changes

(Add release notes here)

## Files

- claude.md (archived version)

---

*Archived by scripts/archive-version.sh*
EOF
    echo "✅ Created: $ARCHIVE_DIR/RELEASE-NOTES.md"
fi

echo ""
echo "✅ Version $VERSION archived successfully!"
ls -lh "$ARCHIVE_DIR/"
EOFSCRIPT

chmod +x scripts/archive-version.sh
echo "✅ Created scripts/archive-version.sh"
```

**Validation:**
```bash
# Check all scripts were created and are executable
ls -lh scripts/
# Expected: All .sh files with -rwxr-xr-x permissions

# Test validate-skills.sh on database-expert
./scripts/validate-skills.sh
# Expected: Should validate database-expert successfully
```

**✅ Checkpoint 6:** Automation scripts created?
- [ ] YES - Continue to Phase 7
- [ ] NO - Review script creation, retry

---

### PHASE 7: Git Commit

**Objective:** Save restructure changes to git.

**Commands:**
```bash
# Stage all new and moved files
git add -A

# Check what will be committed
git status

# Review changes (optional but recommended)
git diff --cached --stat

# Commit with detailed message
git commit -m "refactor: Restructure repository for Skills architecture

Major reorganization to support modular Skills system:

Structure Changes:
- Created archive/ for version history (v1.0.0 through v1.8.0)
- Created skills/ with personas/, modes/, references/ subdirectories
- Created dist/ for packaged .skill distribution files
- Created scripts/ for automation (package, validate, archive)
- Reorganized docs/ into guides/, specs/, analysis/, legacy/

File Moves:
- Moved claude.md.v1.6.0.backup → archive/v1.6.0/claude.md
- Moved claude-md-PierreRibeiro_v1.8.0.md → archive/v1.8.0/claude.md
- Reorganized 23+ docs files into categorized subdirectories
- Created database-expert skill (POC validated)

Automation:
- Added package-skill.sh (ZIP skills to .skill files)
- Added validate-skills.sh (YAML frontmatter validation)
- Added archive-version.sh (version archival helper)

Configuration:
- Updated .gitignore (dist/*.skill, *.backup)

Skills Structure:
- 10 persona directories ready
- 5 mode directories ready
- 4 reference directories ready
- Total: 19 modular skills framework

Related to: Skills Architecture Project (PRD-Skills-Architecture-v1.0)
Phase: Repository preparation (Phase 0)
Next: Skills creation (Phase 1-4)"

echo "✅ Changes committed to git"
```

**Validation:**
```bash
# Verify commit was created
git log -1 --oneline
# Expected: Shows the refactor commit

# Verify repository is clean
git status
# Expected: "nothing to commit, working tree clean"
```

**✅ Checkpoint 7:** Changes committed?
- [ ] YES - Continue to Phase 8
- [ ] NO - Review git errors, fix, retry commit

---

### PHASE 8: Push to Remote (Optional)

**Objective:** Sync changes to GitHub.

**Commands:**
```bash
# Push to origin (main branch)
git push origin main

# Or push to feature branch if you created one
# git push origin feature/repository-restructure

echo "✅ Changes pushed to GitHub"
```

**Validation:**
```bash
# Verify push succeeded
git log --oneline origin/main -1
# Expected: Shows the refactor commit on remote
```

**✅ Checkpoint 8:** Changes pushed to remote?
- [ ] YES - Restructure complete! ✅
- [ ] NO - Check network/permissions, retry

---

## ✅ FINAL VALIDATION

Run this comprehensive check to verify everything worked:

```bash
echo "=== FINAL VALIDATION CHECKLIST ==="
echo ""

# Check archive structure
echo "1️⃣ Archive structure:"
ls -ld archive/v1.{0,5,6,7,8}.0 | wc -l
echo "   Expected: 5 directories"

# Check skills structure
echo "2️⃣ Skills structure:"
echo "   Personas: $(ls skills/personas/ 2>/dev/null | wc -l) (expected: 10)"
echo "   Modes: $(ls skills/modes/ 2>/dev/null | wc -l) (expected: 5)"
echo "   References: $(ls skills/references/ 2>/dev/null | wc -l) (expected: 4)"

# Check docs organization
echo "3️⃣ Documentation organization:"
echo "   Guides: $(ls docs/guides/ 2>/dev/null | wc -l)"
echo "   Specs: $(ls docs/specs/ 2>/dev/null | wc -l)"
echo "   Analysis: $(ls docs/analysis/ 2>/dev/null | wc -l)"
echo "   Legacy: $(ls docs/legacy/ 2>/dev/null | wc -l)"

# Check scripts
echo "4️⃣ Automation scripts:"
ls -1 scripts/*.sh 2>/dev/null | wc -l
echo "   Expected: 3 scripts"

# Check database-expert skill
echo "5️⃣ POC Skill (database-expert):"
if [ -f skills/personas/database-expert/SKILL.md ]; then
    echo "   ✅ SKILL.md exists"
else
    echo "   ❌ SKILL.md missing"
fi

# Check git status
echo "6️⃣ Git status:"
if [ -z "$(git status --porcelain)" ]; then
    echo "   ✅ Repository clean"
else
    echo "   ⚠️  Uncommitted changes exist"
fi

# Check .gitignore
echo "7️⃣ .gitignore updated:"
if grep -q "dist/\*.skill" .gitignore; then
    echo "   ✅ Contains dist/*.skill rule"
else
    echo "   ❌ Missing dist/*.skill rule"
fi

echo ""
echo "=== VALIDATION COMPLETE ==="
```

**Expected Results:**
- Archive: 5 version directories ✅
- Skills: 10 personas + 5 modes + 4 references = 19 directories ✅
- Docs: Organized in 4 subdirectories ✅
- Scripts: 3 automation scripts ✅
- database-expert: SKILL.md exists ✅
- Git: Repository clean ✅
- .gitignore: Updated ✅

---

## 🔄 ROLLBACK PROCEDURE

If something goes wrong, restore from git tag:

```bash
# List available backups
git tag | grep backup-before-restructure

# Restore to backup (DESTRUCTIVE - will lose restructure work)
git reset --hard backup-before-restructure-YYYYMMDD-HHMMSS

# Or just restore specific files
git checkout backup-before-restructure-YYYYMMDD-HHMMSS -- <file-path>
```

---

## 📊 BEFORE vs AFTER

| Aspect | Before | After |
|--------|--------|-------|
| **Versions in root** | 3 files mixed | 1 active file (claude.md) |
| **Backups** | Ad-hoc (.backup) | Organized in archive/ |
| **Skills** | Does not exist | 19 directories ready |
| **Docs organized** | 23 files in 1 folder | 4 subfolders by type |
| **Automation** | None | 3 helper scripts |
| **Build artifacts** | N/A | dist/ for .skill files |

---

## 🎯 WHAT'S NEXT

After completing this restructure:

1. **Phase 1 (Weeks 1-3)**: Create 10 persona skills
   - Use `skills/personas/<n>/SKILL.md` structure
   - Reference database-expert as template
   
2. **Phase 2 (Weeks 4-5)**: Create 5 mode skills
   - Use `skills/modes/<n>/SKILL.md` structure
   
3. **Phase 3 (Week 6)**: Create 4 reference skills
   - Use `skills/references/<n>/SKILL.md` structure
   
4. **Phase 4 (Week 7)**: Create claude.md v2.0 core
   - Place in `current/claude-md-v2.0.0.md`
   - Update symlink when ready

5. **Package & Deploy**:
   - Use `scripts/package-skill.sh` to create .skill files
   - Upload to Claude Desktop (Settings > Capabilities)

---

## 📝 TROUBLESHOOTING

### Issue: "Permission denied" on script execution

**Solution:**
```bash
chmod +x scripts/*.sh
```

### Issue: "Directory already exists"

**Solution:**
```bash
# This is OK - mkdir -p is idempotent
# It means the directory was already created (safe to continue)
```

### Issue: "mv: No such file or directory"

**Solution:**
```bash
# File may have been moved already or doesn't exist
# Use ls to check if file exists before moving:
ls -lh <file-path>
```

### Issue: Git shows many uncommitted files

**Solution:**
```bash
# Review what changed
git status

# If changes look correct, commit them
git add -A
git commit -m "refactor: Repository restructure"
```

---

## ✅ SUCCESS CRITERIA

This restructure is complete when ALL of these are true:

- [ ] archive/ contains 5 version directories (v1.0.0 through v1.8.0)
- [ ] skills/ contains 19 empty subdirectories (10 personas + 5 modes + 4 references)
- [ ] skills/personas/database-expert/SKILL.md exists and is valid
- [ ] docs/ is organized into guides/, specs/, analysis/, legacy/
- [ ] scripts/ contains 3 executable .sh files
- [ ] .gitignore includes dist/*.skill and *.backup rules
- [ ] All changes are committed to git
- [ ] git status shows "working tree clean"
- [ ] scripts/validate-skills.sh runs without errors

---

**Execution Guide created for Haiku 4.5**  
**Task:** Repository restructure for Skills architecture  
**Safety:** Non-destructive, git-tracked, rollback available  
**Estimated time:** 30-40 minutes

*Ready to execute. Follow steps in order. Validate after each phase.*