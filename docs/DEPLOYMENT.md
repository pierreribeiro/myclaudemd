# Deployment Guide - claude.md

> Complete guide for deploying and using Pierre's preference file with Claude AI

---

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Claude Desktop Deployment](#claude-desktop-deployment)
- [Claude Code (VSCode) Deployment](#claude-code-vscode-deployment)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)

---

## ✅ Prerequisites

Before deploying, ensure you have:

- [ ] Access to Claude Desktop or Claude Code
- [ ] Latest version of claude.md from this repository
- [ ] Basic understanding of the TAG system
- [ ] Knowledge of available personas

---

## 🖥️ Claude Desktop Deployment

### Method 1: Direct Configuration

1. **Open Claude Desktop**
   - Launch the Claude Desktop application
   - Click on your profile or settings icon

2. **Access Custom Instructions**
   ```
   Settings → Custom Instructions (or Preferences)
   ```

3. **Copy Claude.md Content**
   ```bash
   # In your terminal/command prompt
   cat claude.md | pbcopy  # macOS
   cat claude.md | clip    # Windows
   cat claude.md | xclip   # Linux
   ```

4. **Paste into Claude**
   - Paste the entire content into the custom instructions field
   - Save the configuration

5. **Verify Deployment**
   - Start a new conversation
   - Test with: `#System check#`

### Method 2: Project Knowledge

If using Claude with Projects:

1. **Create/Open Project**
   - Open Claude Desktop
   - Navigate to Projects
   - Create new project: "Pierre's Preferences"

2. **Add Knowledge**
   - Click "Add Knowledge" or "Project Knowledge"
   - Upload `claude.md` file
   - Optionally add other docs from `docs/` folder

3. **Activate Project**
   - Make sure the project is active
   - Start conversations within this project

4. **Test Configuration**
   ```
   Test message: "Hi Claude, #System check# to verify preferences loaded"
   ```

---

## 💻 Claude Code (VSCode) Deployment

### Prerequisites

- VSCode installed
- Claude Code extension installed

### Deployment Steps

1. **Open VSCode Settings**
   ```
   File → Preferences → Settings (Ctrl+, or Cmd+,)
   ```

2. **Search for Claude Code**
   ```
   Search: "Claude Code"
   ```

3. **Locate Custom Instructions**
   ```
   Extensions → Claude Code → Custom Instructions
   ```

4. **Import Configuration**

   **Option A - Direct Paste:**
   ```
   1. Click "Edit in settings.json"
   2. Add claude.md content to appropriate field
   3. Save settings
   ```

   **Option B - File Reference:**
   ```json
   {
     "claudeCode.customInstructions": {
       "file": "/path/to/myclaudemd/claude.md"
     }
   }
   ```

5. **Reload VSCode**
   ```
   Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
   → "Reload Window"
   ```

6. **Verify Installation**
   - Open Claude Code panel
   - Send test message: `#System check#`

---

## ✅ Verification

### Test Checklist

After deployment, verify the configuration works:

#### 1. System Check
```
Prompt: "#System check#"
Expected: Claude confirms preferences are loaded with version number
```

#### 2. Persona Activation
```
Prompt: "@Database expert@ What's the best way to optimize PostgreSQL?"
Expected: Claude responds in Database Reliability Engineer persona
```

#### 3. Context Switching
```
Prompt: "<This is production> Redis cluster is down"
Expected: Claude responds in emergency/production mode
```

#### 4. Artifact Creation
```
Prompt: "Create a Python script to parse CSV files"
Expected: Claude creates an artifact with the code
```

#### 5. TAG System
```
Prompt: "@Teach me@ {Visual please} Explain database indexing"
Expected: Educational response with visual elements
```

### Verification Results

| Test | Status | Notes |
|------|--------|-------|
| System Check | ⬜ | |
| Persona Activation | ⬜ | |
| Context Switching | ⬜ | |
| Artifact Creation | ⬜ | |
| TAG System | ⬜ | |

---

## 🔧 Troubleshooting

### Common Issues

#### Issue 1: Preferences Not Loading

**Symptoms:**
- Claude doesn't recognize personas
- TAG system not working
- Responses are generic

**Solutions:**
1. Verify claude.md is correctly pasted/uploaded
2. Check for file size limits
3. Try splitting into smaller sections if needed
4. Restart Claude Desktop / Reload VSCode

#### Issue 2: Persona Not Activating

**Symptoms:**
- `@Database expert@` doesn't change behavior
- Claude asks for clarification

**Solutions:**
1. Check TAG syntax: must be exact `@Database expert@`
2. Ensure spaces around TAGs
3. Verify persona name matches documentation
4. Try alternative activation: `@DBA mode@`

#### Issue 3: Artifacts Not Creating

**Symptoms:**
- Code appears inline instead of artifact
- No download option

**Solutions:**
1. Check if request explicitly asks for code/plan
2. Use `{Artifact Required}` command
3. Verify content type qualifies for artifact
4. Check Claude's artifact settings

#### Issue 4: Context Not Recognized

**Symptoms:**
- Production context not activating
- Responses too verbose for emergency

**Solutions:**
1. Use explicit context: `<This is production>`
2. Combine with persona: `@Emergency mode@`
3. Add urgency indicators in message
4. Use `!no prd!` safeguard if needed

### Debug Commands

```bash
# System verification
#System check#

# Force preference reload
#Force reload#

# Reset to defaults
#Reset#

# Check guardrail compliance
#Guardrail Check#

# Verify active persona
#Persona Status#
```

---

## 💡 Best Practices

### 1. Start Every Session

Begin new sessions with context:
```
"Hi Claude, continuing from our last session about [topic]"
```

### 2. Explicit Context Setting

Don't rely on inference, be explicit:
```
<This is production> @Emergency mode@ [Issue description]
```

### 3. Progressive Complexity

Start simple, add complexity:
```
Step 1: "@Teach me@ What is Terraform?"
Step 2: "Show me a simple module"
Step 3: "Now add advanced features"
```

### 4. Use Safeguards

Prevent unwanted behavior:
```
"Design architecture !no prd! for learning"
→ Prevents emergency mode activation
```

### 5. Combine TAGs

Leverage multiple TAGs:
```
"@Backend dev@ <I'm learning> {Visual please} {Full code}
Build a REST API with FastAPI"
```

### 6. Request Artifacts

Always request artifacts for code:
```
"{Artifact Required} Create database migration script"
```

### 7. Context Migration

When approaching limits:
```
"We're at 90% context - create migration summary"
```

---

## 🔄 Updating Preferences

### When to Update

- New personas needed
- Workflow changes
- Technology stack updates
- Guardrails refinement

### Update Process

1. **Pull Latest Version**
   ```bash
   cd myclaudemd
   git pull origin main
   ```

2. **Review Changelog**
   ```bash
   cat CHANGELOG.md
   ```

3. **Backup Current Config**
   ```bash
   cp claude.md claude-backup-$(date +%Y%m%d).md
   ```

4. **Deploy New Version**
   - Follow deployment steps above
   - Test with verification checklist

5. **Document Issues**
   - Note any problems
   - Report via GitHub issues

---

## 📊 Success Metrics

After deployment, track:

- ✅ **First-Try Success Rate**: Responses correct on first attempt
- ✅ **Iteration Reduction**: Fewer clarification rounds
- ✅ **Artifact Creation**: Automatic artifact generation
- ✅ **Context Retention**: Smooth conversation flow
- ✅ **Persona Accuracy**: Correct persona activation

---

## 🆘 Getting Help

If you encounter issues:

1. **Check Documentation**
   - README.md
   - CONTRIBUTING.md
   - This deployment guide

2. **Search Issues**
   - GitHub Issues tab
   - Look for similar problems

3. **Create New Issue**
   - Use issue template
   - Include details:
     - Claude version
     - Deployment method
     - Error messages
     - Steps to reproduce

4. **Community Support**
   - GitHub Discussions (if enabled)
   - Share your experience

---

## 📚 Additional Resources

- **Quick Reference**: [`docs/QUICK_REFERENCE.md`](./QUICK_REFERENCE.md)
- **Persona Guide**: [`docs/PERSONAS.md`](./PERSONAS.md)
- **Main README**: [`../README.md`](../README.md)
- **Changelog**: [`../CHANGELOG.md`](../CHANGELOG.md)

---

## ✅ Deployment Checklist

Final checklist before going live:

- [ ] Prerequisites met
- [ ] Method chosen (Desktop/Code/Both)
- [ ] Configuration deployed
- [ ] System check passed
- [ ] Persona test successful
- [ ] Context test successful
- [ ] Artifact test successful
- [ ] TAG system verified
- [ ] Backup created
- [ ] Documentation reviewed

---

**🎉 You're all set!**

Your Claude instance is now configured with Pierre's comprehensive preferences. Start with simple tests and gradually explore the full persona system and TAG capabilities.

---

*Last Updated: 2025-10-13*
*Version: 1.6.0 Compatible*
