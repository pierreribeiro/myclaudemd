# Contributing to myclaudemd

Thank you for your interest in contributing to the claude.md preference file project! While this is primarily a personal configuration repository, suggestions and improvements are welcome.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Pull Request Process](#pull-request-process)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Style Guidelines](#style-guidelines)

---

## 🤝 Code of Conduct

This project adheres to a simple code of conduct:

- **Be Respectful**: Treat everyone with respect and kindness
- **Be Constructive**: Provide actionable feedback
- **Be Clear**: Communicate ideas clearly and concisely
- **Be Patient**: This is a personal project maintained in spare time

---

## 💡 How Can I Contribute?

### Reporting Issues

If you find issues or inconsistencies in the claude.md file:

1. **Check existing issues** to avoid duplicates
2. **Open a new issue** with clear description
3. **Include examples** of the problem
4. **Suggest solutions** if possible

### Suggesting Improvements

Have ideas for improving the preference file? Great!

1. **Open an issue** describing your suggestion
2. **Explain the use case** and benefits
3. **Provide examples** of the improved interaction
4. **Consider compatibility** with existing personas/workflows

### Documentation Improvements

Documentation can always be better:

1. Fix typos or unclear sections
2. Add examples for better understanding
3. Improve organization and structure
4. Translate (if applicable in the future)

---

## 🎯 Suggesting Enhancements

### Before Submitting

- ✅ Check if the enhancement is already covered
- ✅ Verify it aligns with the project's goals
- ✅ Consider if it's widely applicable
- ✅ Think about maintenance implications

### Enhancement Template

```markdown
## Enhancement Description
[Clear description of the enhancement]

## Use Case
[Why is this enhancement useful?]

## Proposed Solution
[How would you implement this?]

## Alternatives Considered
[What other approaches did you consider?]

## Additional Context
[Any other information, screenshots, examples]
```

---

## 🔄 Pull Request Process

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR_USERNAME/myclaudemd.git
cd myclaudemd
```

### 2. Create Feature Branch

```bash
# Create branch with descriptive name
git checkout -b feature/add-new-persona
# or
git checkout -b fix/typo-in-guardrails
```

### 3. Make Your Changes

- Edit relevant files
- Follow existing style and structure
- Update documentation if needed
- Test with Claude if possible

### 4. Commit Your Changes

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
git add .
git commit -m "feat: add Data Scientist persona with ML focus"
# or
git commit -m "fix: correct typo in P0 guardrails section"
# or
git commit -m "docs: improve TAG system examples"
```

### 5. Push and Create PR

```bash
git push origin feature/add-new-persona
```

Then create a Pull Request on GitHub with:

- **Clear title** following conventional commits format
- **Detailed description** of changes
- **Motivation** for the change
- **Testing** done (if applicable)

### 6. Address Review Feedback

- Respond to review comments
- Make requested changes
- Push updates to the same branch
- Re-request review when ready

---

## 📝 Commit Message Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: New feature (persona, workflow, command)
- **fix**: Bug fix or correction
- **docs**: Documentation changes
- **style**: Formatting changes (no code logic change)
- **refactor**: Code refactoring
- **test**: Adding tests
- **chore**: Maintenance tasks

### Examples

```bash
feat(persona): add Data Scientist persona

- Add ML/AI focused persona
- Include statistical analysis workflows
- Update persona activation commands

Closes #42
```

```bash
fix(guardrails): correct P0 validation logic

The P0 validation was missing edge case for
production context detection.

Fixes #38
```

```bash
docs(readme): improve quick start section

- Add step-by-step instructions
- Include troubleshooting tips
- Update deployment examples
```

---

## 📐 Style Guidelines

### Markdown Formatting

- Use **ATX-style headers** (`#` for headers)
- Include **blank lines** around headers
- Use **code fences** with language identifiers
- Keep **line length** reasonable (~100 chars)
- Use **consistent bullet styles** (-, *, +)

### Claude.md Structure

When editing claude.md:

```markdown
## 🎯 SECTION TITLE

### Subsection Title

**Key Point**: Description

- List item with details
- Another item

**Example:**
```
example code or command
```
```

### Consistency

- Follow existing emoji usage patterns
- Maintain hierarchical numbering
- Use consistent terminology
- Keep similar sections structured the same way

### Version Numbers

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Breaking changes (guardrails, core personas)
- **MINOR** (0.X.0): New features (personas, modes, workflows)
- **PATCH** (0.0.X): Bug fixes, clarifications, minor updates

---

## ✅ Pull Request Checklist

Before submitting, ensure:

- [ ] Code follows the style guidelines
- [ ] Commit messages follow conventional format
- [ ] Documentation is updated if needed
- [ ] Version number is updated appropriately
- [ ] All automated workflows pass
- [ ] Changes are tested with Claude (if applicable)
- [ ] PR description is clear and complete

---

## 🧪 Testing Changes

### Manual Testing

To test your changes:

1. **Copy modified claude.md** to Claude Desktop/Code
2. **Test persona activation** with sample prompts
3. **Verify TAG system** works as expected
4. **Check for any errors** or unexpected behavior
5. **Document results** in PR

### Automated Testing

The repository includes automated workflows:

- ✅ **Structure validation**: Checks file integrity
- ✅ **Version validation**: Verifies semantic versioning
- ✅ **Section checks**: Ensures required sections exist
- ✅ **TAG validation**: Checks for broken tags

These run automatically on PRs.

---

## 🎓 Learning Resources

If you're new to contributing:

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Markdown Guide](https://www.markdownguide.org/)

---

## ❓ Questions?

If you have questions about contributing:

1. Check existing issues and discussions
2. Open a new issue with `[Question]` prefix
3. Be specific about what you need help with

---

## 🙏 Thank You!

Every contribution helps make this preference file better. Whether it's:

- Reporting a typo
- Suggesting an improvement
- Contributing documentation
- Sharing your experience

Your input is valued and appreciated!

---

*Happy Contributing!* 🚀

---

*Last Updated: 2025-10-13*
