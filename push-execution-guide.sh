#!/bin/bash
#
# Push EXECUTION-GUIDE-Restructure-Repository.md to remote repository
# Run from: /Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd
#

set -e

echo "📦 Pushing Execution Guide to remote repository"
echo ""

# Navigate to repository
cd "$(dirname "$0")"

# Check if file exists
if [ ! -f "docs/EXECUTION-GUIDE-Restructure-Repository.md" ]; then
    echo "❌ ERROR: File not found: docs/EXECUTION-GUIDE-Restructure-Repository.md"
    exit 1
fi

echo "✅ File found: docs/EXECUTION-GUIDE-Restructure-Repository.md"
ls -lh docs/EXECUTION-GUIDE-Restructure-Repository.md
echo ""

# Check git status
echo "📊 Current git status:"
git status --short
echo ""

# Stage the file
echo "➕ Staging file..."
git add docs/EXECUTION-GUIDE-Restructure-Repository.md

# Show what will be committed
echo ""
echo "📋 Changes to be committed:"
git status --short
echo ""

# Commit
echo "💾 Committing..."
git commit -m "docs: Add Execution Guide for repository restructure

Added comprehensive execution guide for Haiku 4.5 to restructure
the myclaudemd repository for Skills architecture.

Features:
- 8 sequential phases with validation checkpoints
- Pre-flight checklist and rollback procedures
- 3 complete automation scripts (package, validate, archive)
- Troubleshooting guide and success criteria
- Estimated time: 30-40 minutes
- Risk level: LOW (non-destructive, git-tracked)

Guide transforms conceptual proposal into actionable commands
optimized for AI agent execution with safety checks at every step.

Related: PRD-Skills-Architecture-v1.0.md
File size: 23.5KB (893 lines)"

echo "✅ Committed successfully"
echo ""

# Push to remote
echo "🚀 Pushing to remote repository..."
CURRENT_BRANCH=$(git branch --show-current)
git push origin "$CURRENT_BRANCH"

echo ""
echo "✅ Push complete!"
echo ""
echo "📝 Execution Guide now available at:"
echo "   https://github.com/pierreribeiro/myclaudemd/blob/$CURRENT_BRANCH/docs/EXECUTION-GUIDE-Restructure-Repository.md"
echo ""
