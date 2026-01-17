#!/bin/bash
# Package skill to .skill file (ZIP)
# Usage: ./scripts/package-skill.sh <skill-path>
set -e
[ $# -ne 1 ] && echo "Usage: $0 <skill-path>" && exit 1
SKILL_PATH="$1"
SKILL_NAME=$(basename "$SKILL_PATH")
[ ! -f "$SKILL_PATH/SKILL.md" ] && echo "❌ SKILL.md not found" && exit 1
mkdir -p dist
cd "$SKILL_PATH" && zip -q "../../dist/${SKILL_NAME}.skill" SKILL.md && cd - > /dev/null
echo "✅ Packaged: dist/${SKILL_NAME}.skill"
