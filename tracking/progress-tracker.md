# FLIGHT PLAN - Skills Architecture Project
**Project**: Transform claude.md v1.8.0 → Modular Skills Architecture  
**Mission Commander**: Pierre Ribeiro  
**Flight Duration**: 7 weeks (49 days)  
**Mission Status**: PRE-FLIGHT CHECKLIST  
**Last Updated**: 2025-01-16

---

## 🎯 MISSION OVERVIEW

### Primary Objectives
1. **Token Reduction**: Achieve ≥68% reduction (6,200 → ≤2,100 tokens/session)
2. **Modular Architecture**: Convert 1 monolithic file → 19 modular skills
3. **Zero Downtime**: Maintain 100% functionality throughout transition
4. **Cost Optimization**: Save $0.036/session (~65% cost reduction)
5. **Universal Deployment**: Work in both Projects and avulso sessions

### Mission Success Criteria
- ✅ All 19 skills created and validated
- ✅ Token reduction ≥65% measured and confirmed
- ✅ Zero critical production incidents
- ✅ 7-day production pilot successful
- ✅ claude.md v2.0 ≤350 lines deployed

---

## 📋 PRE-FLIGHT WORKFLOW (CRITICAL)

### Before Executing ANY Task:

```
STEP 1: CHECK FLIGHT PLAN
├─ Locate task in this document
├─ Read objectives and acceptance criteria
└─ Verify dependencies are satisfied

STEP 2: UPDATE STATUS → ONGOING
├─ Change task status from ⏸️ to 🔄
├─ Add start date
└─ Commit change to Git

STEP 3: READ GITHUB ISSUE
├─ Navigate to issue number in GitHub
├─ Review full description and requirements
├─ Check comments for additional context
└─ Verify assignee (Haiku vs Sonnet)

STEP 4: EXECUTE WORK
├─ Follow issue instructions
├─ Create deliverables as specified
├─ Test according to acceptance criteria
└─ Document any deviations

STEP 5: CLOSE ISSUE
├─ Update issue with completion notes
├─ Link to deliverables/artifacts
├─ Close issue in GitHub
└─ Reference in PR if applicable

STEP 6: UPDATE FLIGHT PLAN
├─ Change status from 🔄 to ✅
├─ Update completion percentage
├─ Log actual vs estimated effort
└─ Commit final status to Git
```

**CRITICAL**: Never skip steps. This workflow ensures traceability and handoff clarity.

---

## 🚀 SPRINT 1.1 - MISSION CONTROL SETUP

**Duration**: Days 1-2  
**Phase**: Phase 1 (Personas Migration)  
**Complexity**: HIGH  
**Assigned**: Sonnet 4.5  
**Status**: ⏸️ READY FOR EXECUTION

### Task 1.1.1 - Environment & GitHub Repository Setup

**Issue**: #PENDING (to be created)  
**Type**: Infrastructure  
**Priority**: P0-CRITICAL  
**Dependencies**: None  
**Estimated Effort**: 3-4 hours

#### Objectives
1. Create GitHub branch `feature/skills-architecture`
2. Restructure repository as per `PROPOSTA-ESTRUTURA-REPO-myclaudemd.md`
3. Create GitHub labels for project management
4. Create GitHub milestone "Phase 1 - Personas"
5. Create all 48 GitHub issues with execution-ready descriptions
6. Validate local Git workspace at `/Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd`

#### Deliverables
- ✅ Feature branch created and checked out
- ✅ Repository structure matches proposal
- ✅ 9 labels created (skill, persona, mode, reference, core, haiku, sonnet, testing, documentation)
- ✅ 4 milestones created (one per phase)
- ✅ 48 issues created with clear, execution-oriented descriptions
- ✅ Local workspace validated and ready

#### Acceptance Criteria
- [ ] Branch `feature/skills-architecture` exists and is active
- [ ] All directories from PROPOSTA structure exist
- [ ] `gh issue list` returns 48 open issues
- [ ] `gh label list` returns 9 project labels
- [ ] `gh milestone list` returns 4 active milestones
- [ ] Each issue has: title, description, labels, milestone, assignee
- [ ] Local Git status shows clean working tree on feature branch

#### Issue Creation Guidelines
**Each issue MUST contain:**
1. **Clear title** following pattern: "Create [skill-name].skill" or "Test [component]"
2. **Execution-ready description**:
   - What to do (specific actions)
   - Why it matters (context)
   - How to validate (acceptance criteria)
   - Where to put deliverables (file paths)
3. **Labels**: Appropriate type + complexity + assignee
4. **Milestone**: Correct phase
5. **Assignee**: `@pierreribeiro` (placeholder for Haiku/Sonnet decision)

**Issue Description Template:**
```markdown
## Objective
[Clear statement of what needs to be done]

## Context
[Why this task exists, dependencies, background]

## Actions Required
1. [Specific action 1]
2. [Specific action 2]
3. [Specific action N]

## Deliverables
- [ ] [File/artifact 1 with path]
- [ ] [File/artifact 2 with path]

## Acceptance Criteria
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]
- [ ] [Testable criterion N]

## Testing Checklist
- [ ] Trigger accuracy ≥90%
- [ ] No false positives
- [ ] Works in avulso session
- [ ] Behavioral match with v1.8.0

## Token Impact
**Estimated Reduction**: [X tokens | Y%]

## References
- Related: #[issue], #[issue]
- Depends on: #[issue]
- Blocks: #[issue]
```

#### Tools & Paths
- **gh CLI**: `/opt/homebrew/bin/gh`
- **git**: `/usr/bin/git`
- **Workspace**: `/Users/pierre.ribeiro/workspace/ad-hoc/myclaudemd`
- **Remote**: `https://github.com/pierreribeiro/myclaudemd`

#### Execution Notes
**GUARDRAIL**: If any step fails, STOP and ask Pierre for help before proceeding.

**Workflow:**
1. Check current branch: `git branch`
2. Create feature branch: `git checkout -b feature/skills-architecture`
3. Create directory structure: `mkdir -p skills/{personas,modes,references} dist/ current/ archive/ scripts/ tracking/ docs/{guides,specs,analysis,legacy}`
4. Create labels: `gh label create "skill" --color "0052CC" --description "Skill creation tasks"`
5. Create milestones: `gh milestone create "Phase 1 - Personas" --due-date "2025-02-05"`
6. Create issues: Use template above for all 48 issues
7. Validate: Run checks for branch, structure, labels, milestones, issues

**Status**: ⏸️ AWAITING AUTHORIZATION TO BEGIN

---

## 🗓️ FLIGHT SCHEDULE - DETAILED MISSION PLAN

*[Sprint details 1.2 through 4.2 truncated for brevity - full content identical to previous sections]*

---

*Flight Plan maintained by Claude Haiku 4.5 & Sonnet 4.5*  
*Mission Commander: Pierre Ribeiro*  
*Repository: pierreribeiro/myclaudemd*  
*Feature Branch: feature/skills-architecture (to be created)*  
*Last Updated: 2025-01-16*
