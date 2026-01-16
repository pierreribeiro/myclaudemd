# Product Requirements Document (PRD)
# Skills Architecture for Claude Desktop - v1.0

**Project**: Transformation claude.md → Modular Skills Architecture  
**Stakeholder**: Pierre Ribeiro  
**Created**: 2025-01-15  
**Status**: PLANNING  
**Branch**: `feature/skills-architecture`  
**Repository**: `pierreribeiro/myclaudemd`

---

## 📋 EXECUTIVE SUMMARY

### Vision

Transform Pierre Ribeiro's monolithic personal preferences file (claude.md v1.8.0, ~1,050 lines) into a modular Skills-based architecture for Claude Desktop, achieving **~68% token reduction** while maintaining 100% functionality through progressive disclosure.

### Business Value

| Metric | Current v1.8.0 | Target v2.0 | Improvement |
|--------|----------------|-------------|-------------|
| **Tokens/session** | 5,500-6,500 | 1,700-2,100 | **-68%** |
| **Cost/session** | $0.055 | $0.019 | **-65%** |
| **Core file size** | 1,050 lines | ~325 lines | **-69%** |
| **Modular skills** | 0 | 15-19 | **Infinite ROI** |
| **Maintainability** | Monolithic | Modular | **High** |
| **Scope** | Projects only | Global | **Universal** |

### Success Criteria

- ✅ **Token reduction** ≥60% validated in production
- ✅ **100% functionality** maintained (zero breaking changes)
- ✅ **Progressive disclosure** working in avulso sessions
- ✅ **Skills trigger** automatically via keywords/TAGs
- ✅ **Backward compatibility** with claude.md v1.8.0

---

## 🎯 PROBLEM STATEMENT

### Current State

Pierre maintains a comprehensive personal preferences file (claude.md v1.8.0) that configures Claude Desktop's behavior. The file contains:

- **10 specialized personas** (Emergency Engineer, Database Expert, Learning Mentor, etc.)
- **5 operational modes** (Discovery, Build, Debug, Learning, Architecture)
- **TAG system** for chat search and context management
- **Enhanced guardrails** with violation detection
- **Output templates** and activation commands

**Critical Issue**: ~70% of content loads in EVERY session but is used only OCCASIONALLY or ON-DEMAND.

### Pain Points

1. **Token Waste**: 3,900-4,550 tokens (~70%) loaded but unused per session
2. **Cost Impact**: ~$0.038-0.045 wasted per session
3. **Processing Delay**: Initial load time for 6,500 tokens
4. **Maintenance Burden**: Monolithic file (1,050 lines) difficult to update
5. **Context Pollution**: Irrelevant information competing for context window

### Root Cause Analysis

| Component | Lines | Usage Frequency | Problem |
|-----------|-------|-----------------|---------|