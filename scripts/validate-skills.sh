#!/bin/bash
# Validate skills structure
set -e
ERRORS=0
for skill_dir in skills/*/*; do
  [ ! -d "$skill_dir" ] && continue
  [ ! -f "$skill_dir/SKILL.md" ] && echo "❌ Missing SKILL.md: $skill_dir" && ((ERRORS++)) && continue
  grep -q "^---" "$skill_dir/SKILL.md" || { echo "❌ Missing YAML: $skill_dir"; ((ERRORS++)); continue; }
  echo "✅ Valid: $(basename \"$skill_dir\")"
done
[ $ERRORS -eq 0 ] && echo "✅ All valid!" || { echo "❌ $ERRORS errors"; exit 1; }
