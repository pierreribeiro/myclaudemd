# myclaudemd

> **Pierre's Claude Preference File Development Repository**

Personal preference file (`claude.md`) for optimizing interactions with Claude AI, featuring automated validation, versioning, and comprehensive documentation.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Features](#features)
- [Usage](#usage)
- [Workflows](#workflows)
- [Maintenance](#maintenance)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 Overview

This repository contains Pierre Ribeiro's comprehensive preference file for Claude AI interactions. The `claude.md` file defines:

- **Professional Context**: Senior Data Engineer & DBA profile
- **Cognitive Style**: TEA Level 1 + ADHD optimized interactions
- **Communication Framework**: Context-aware responses (Production/Learning/Exploration)
- **Persona System**: 10+ specialized personas for different tasks
- **Workflows**: Structured approaches for discovery, debugging, and development
- **Technology Stack**: Hierarchical tech preferences and tool integrations

### Why This Repository?

The claude.md preference file transforms generic Claude interactions into highly personalized, context-aware assistance that:

✅ Reduces iteration cycles
✅ Provides responses in your preferred format
✅ Activates appropriate technical depth automatically
✅ Respects cognitive processing preferences
✅ Maintains consistency across sessions

---

## 📁 Repository Structure

```
myclaudemd/
├── .github/
│   └── workflows/           # GitHub Actions automation
│       ├── validate-claude.yml      # Structure validation
│       ├── backup-version.yml       # Automated backups
│       ├── auto-changelog.yml       # Changelog generation
│       └── critical-changes-alert.yml # Change detection
├── docs/
│   ├── QUICK_REFERENCE.md   # Quick reference guide (auto-generated)
│   ├── DEPLOYMENT.md        # Deployment instructions
│   └── PERSONAS.md          # Persona activation guide
├── versions/
│   ├── claude-latest.md     # Symlink to latest backup
│   ├── claude-v*.md         # Versioned backups
│   └── backup-metadata.json # Backup metadata
├── claude.md                # Main preference file
├── CHANGELOG.md             # Version history (auto-generated)
├── README.md                # This file
└── .gitignore              # Git ignore patterns
```

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/pierreribeiro/myclaudemd.git
cd myclaudemd
```

### 2. Review the Preference File

```bash
cat claude.md
```

### 3. Deploy to Claude

#### For Claude Desktop:
1. Open Claude Desktop settings
2. Navigate to "Custom Instructions" or "Preferences"
3. Copy content from `claude.md`
4. Paste and save

#### For Claude Code (VSCode):
1. Open VSCode settings
2. Search for "Claude Code preferences"
3. Import `claude.md` file

### 4. Test the Configuration

Start a conversation with Claude using:
```
@Emergency mode@ <This is production> Database query timeout issue
```

---

## ✨ Features

### 🤖 Automated Workflows

- **✅ Structure Validation**: Ensures claude.md integrity on every push
- **💾 Automatic Backups**: Version-stamped backups on every change
- **📝 Changelog Generation**: Auto-generated from commit messages
- **🚨 Critical Change Detection**: Alerts on P0 guardrail modifications

### 🎭 Persona System

10 specialized personas for different contexts:

| Persona | Activation | Use Case |
|---------|------------|----------|
| 🔥 Emergency Engineer | `@Emergency mode@` | Production issues |
| 🔍 Investigation Analyst | `@Debug this@` | Systematic troubleshooting |
| 🗄️ Database Expert | `@Database expert@` | DB optimization, HA/DR |
| 📚 Learning Mentor | `@Teach me@` | Educational content |
| 🏗️ Architect | `@Architecture for@` | System design |
| 👁️ Code Reviewer | `@Review code@` | Code analysis |
| 📊 Product Manager | `@Business case@` | Business strategy |
| ⚡ Backend Developer | `@Backend dev@` | System building |
| 🎨 UX/Frontend | `@UI/UX@` | Interface design |
| ⚪ Neutral | `@Neutral@` | Non-technical topics |

### 🏷️ TAG System

Multiple tag types for precise control:

```
@persona@       - Activate persona
<context>       - Set context (production/learning/exploration)
[mode]          - Activate operational mode
{command}       - Modify output format
!safeguard!     - Disable triggers
#system#        - System commands
```

### 📊 Guardrails Hierarchy

- **P0 (Critical)**: Always enforced
- **P1 (High)**: Default behaviors
- **P2 (Medium)**: Context-relevant
- **P3 (Low)**: Optional enhancements

---

## 💻 Usage

### Basic Interaction

Normal conversation - Claude uses default assistant mode:
```
"Explain how database indexes work"
```

### Persona Activation

Activate specific persona for specialized response:
```
@Database expert@ How should I optimize this PostgreSQL query?
```

### Context Setting

Set production context for direct, pragmatic solutions:
```
<This is production> @Emergency mode@ Redis cluster down, need failover strategy
```

### Mode Activation

Activate discovery mode for structured exploration:
```
[Discovery mode] I need to learn about Apache Kafka architecture
```

### Combined Usage

Mix tags for precise control:
```
@Backend dev@ <I'm learning> {Visual please} How to build a REST API with FastAPI?
```

---

## ⚙️ Workflows

### Validation Workflow

**Trigger**: Push to any branch with claude.md changes

**Actions**:
1. ✅ Validates file structure
2. ✅ Checks required sections
3. ✅ Verifies version format
4. ✅ Scans for common issues
5. ✅ Generates validation report

### Backup Workflow

**Trigger**: Push to `main` branch with claude.md changes

**Actions**:
1. 💾 Extracts version number
2. 💾 Creates timestamped backup
3. 💾 Updates latest symlink
4. 💾 Generates metadata
5. 💾 Creates release tag
6. 💾 Cleans old backups

### Changelog Workflow

**Trigger**: Push to `main` branch

**Actions**:
1. 📝 Parses commit messages
2. 📝 Categorizes by type (feat/fix/docs/etc)
3. 📝 Updates CHANGELOG.md
4. 📝 Generates quick reference
5. 📝 Commits updates

### Critical Changes Workflow

**Trigger**: Pull request with claude.md changes

**Actions**:
1. 🚨 Analyzes diff
2. 🚨 Detects P0 guardrail changes
3. 🚨 Calculates impact score
4. 🚨 Comments on PR with analysis
5. 🚨 Flags critical sections

---

## 🔧 Maintenance

### Updating the Preference File

1. Create feature branch:
   ```bash
   git checkout -b feature/update-personas
   ```

2. Edit `claude.md` with your changes

3. Update version number following semantic versioning:
   - MAJOR: Breaking changes to guardrails or personas
   - MINOR: New features (personas, modes, workflows)
   - PATCH: Bug fixes, clarifications, minor updates

4. Commit with conventional commit format:
   ```bash
   git commit -m "feat: add new Data Scientist persona"
   ```

5. Push and create PR:
   ```bash
   git push origin feature/update-personas
   ```

6. Review automated checks and merge

### Version Management

Versions follow semantic versioning: `MAJOR.MINOR.PATCH`

Current version is tracked in the `version:` field of claude.md metadata.

### Backup Recovery

To restore a previous version:

```bash
# List available backups
ls -lh versions/

# Restore specific version
cp versions/claude-v1.5.0-backup-20250914-123456.md claude.md

# Commit restoration
git add claude.md
git commit -m "revert: restore claude.md to v1.5.0"
git push
```

---

## 🤝 Contributing

This is a personal preference repository, but suggestions are welcome!

### Suggesting Improvements

1. Open an issue describing the improvement
2. Explain the use case and benefits
3. Provide examples if applicable

### Pull Request Process

1. Fork the repository
2. Create feature branch
3. Make changes with clear commit messages
4. Ensure all workflows pass
5. Submit PR with detailed description

---

## 📚 Additional Documentation

- **[Quick Reference](docs/QUICK_REFERENCE.md)**: Fast lookup for personas and tags
- **[Deployment Guide](docs/DEPLOYMENT.md)**: Detailed deployment instructions
- **[Persona Guide](docs/PERSONAS.md)**: In-depth persona documentation
- **[Changelog](CHANGELOG.md)**: Version history and updates

---

## 📊 Project Status

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/pierreribeiro/myclaudemd/validate-claude.yml?label=validation)
![GitHub last commit](https://img.shields.io/github/last-commit/pierreribeiro/myclaudemd)
![GitHub repo size](https://img.shields.io/github/repo-size/pierreribeiro/myclaudemd)

**Current Version**: Check `claude.md` metadata section

**Status**: ✅ Active Development

---

## 🙏 Acknowledgments

- **Anthropic**: For Claude AI and comprehensive documentation
- **GitHub Actions**: For automation capabilities
- **Community**: For prompting techniques and best practices

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📞 Contact

**Pierre Ribeiro**
- GitHub: [@pierreribeiro](https://github.com/pierreribeiro)
- Project: [myclaudemd](https://github.com/pierreribeiro/myclaudemd)

---

*Last Updated: 2025-10-13*
*Generated for Project: myclaudemd*
