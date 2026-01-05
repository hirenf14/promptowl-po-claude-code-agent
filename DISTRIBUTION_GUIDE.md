

# PromptOwl Claude Code Agents - Distribution Guide

## Overview

This directory contains **distributable Claude Code agents** that enable autonomous agent management for PromptOwl users worldwide.

## What We Built

### 1. Tool Management API (`/api/prompts/{id}/tools`)

**NEW API Endpoint** for programmatic tool management:

- `GET /api/prompts/{id}/tools` - List agent's tools
- `POST /api/prompts/{id}/tools` - Add tool to agent
- `PUT /api/prompts/{id}/tools` - Replace all tools
- `DELETE /api/prompts/{id}/tools?name=tool_name` - Remove specific tool

**Why This Matters:** Claude Code can now programmatically add MCP tools to PromptOwl agents, enabling full autonomous workflow from "idea → deployed agent with tools".

### 2. Distributable Claude Code Agents

Three autonomous agents that ANY user can install in THEIR Claude Code instance:

#### `promptowl-builder.md`
**Builds agents from natural language requirements**
- Analyzes requirements
- Creates agent via API
- Adds tools automatically
- Provides test cases
- Deploys to production

**Example:**
```
User: Build a security code reviewer that checks for SQL injection and XSS
Claude: [Autonomously builds, tests, deploys agent]
✅ Agent created: https://app.promptowl.ai/prompt/edit/507f...
```

#### `promptowl-tester.md`
**Tests agents systematically**
- Fetches agent config
- Generates test cases
- Validates outputs
- Updates agent based on results
- Runs regression tests

**Example:**
```
User: Test my sentiment analyzer with edge cases
Claude: [Generates 20 test cases, runs them, identifies issues]
⚠️ Found: Fails on sarcasm, emoji handling
🔧 Applied fix: Updated instructions, lowered temperature
✅ Re-test ready
```

#### `promptowl-mcp-deployer.md`
**Deploys MCP servers and integrates with agents**
- Installs MCP server packages
- Configures MCP servers
- Adds tools to agents via API
- Tests integration
- Provides usage docs

**Example:**
```
User: Add Playwright browser testing to my QA agent
Claude: [Installs Playwright MCP, adds tools, configures]
✅ Playwright installed
✅ 3 tools added: browser_navigate, browser_screenshot, browser_evaluate
📖 Test URL: https://app.promptowl.ai/prompt/edit/507f...
```

### 3. Installation System

**One-line install:**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/install.sh)
```

**What it does:**
- Creates `~/.claude/agents/` directory
- Downloads all 3 agent markdown files
- Checks for API key
- Provides setup instructions

### 4. Complete Documentation

- `README.md` - Installation, usage, examples
- `DISTRIBUTION_GUIDE.md` - This file
- Inline documentation in each agent
- API examples in multiple languages

## How Users Install & Use

### Installation (5 minutes)

```bash
# 1. Install agents
bash <(curl -fsSL https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/install.sh)

# 2. Get API key from PromptOwl
#    https://app.promptowl.ai/api-keys

# 3. Set environment variable
echo 'export PROMPTOWL_API_KEY="po_user_abc123..."' >> ~/.bashrc
source ~/.bashrc

# 4. Done!
```

### Usage

Open Claude Code and say:

```
Use promptowl-builder to create a sentiment analysis agent
```

```
Use promptowl-tester to test my code reviewer agent
```

```
Use promptowl-mcp-deployer to add GitHub integration to my DevOps agent
```

## Distribution Channels

### 1. GitHub Repository
- Public repo: `github.com/promptowl/promptowl`
- Folder: `/claude-code-agents/`
- Raw URLs for curl install
- Issues/support on GitHub

### 2. Documentation Website
- https://app.promptowl.ai/docs/claude-code
- Installation guide
- Video tutorials
- Use case examples

### 3. NPM Package (Future)
```bash
npm install -g @promptowl/claude-agents
promptowl-agents install
```

### 4. Claude Code Marketplace (Future)
- Official Claude Code agent directory
- One-click install
- Rating/reviews

## Architecture

```
┌─────────────────────────────────┐
│   User's Claude Code Instance   │
│   (Any developer, anywhere)     │
└────────────┬────────────────────┘
             │
             │ Uses agents from
             ▼
┌─────────────────────────────────┐
│  ~/.claude/agents/              │
│  - promptowl-builder.md         │
│  - promptowl-tester.md          │
│  - promptowl-mcp-deployer.md    │
└────────────┬────────────────────┘
             │
             │ API calls with user's key
             ▼
┌─────────────────────────────────┐
│   PromptOwl REST API            │
│   /api/prompts/*                │
│   /api/prompts/{id}/tools       │
└────────────┬────────────────────┘
             │
             ▼
┌─────────────────────────────────┐
│   User's PromptOwl Account      │
│   (Their agents, tools, data)   │
└─────────────────────────────────┘
```

## Key Features

### 1. Fully Autonomous
- No manual intervention required
- Agents make decisions
- Error handling built-in
- Clear output reporting

### 2. Secure
- Uses user's own API key
- No shared credentials
- Per-user isolation
- Follows OAuth best practices

### 3. Extensible
- Users can modify agents
- Create custom workflows
- Chain agents together
- Add new capabilities

### 4. Well-Documented
- Inline comments in agents
- Usage examples
- Troubleshooting guides
- API reference

## Marketing Value

### For Developers
- **Speed:** Build agents in seconds, not hours
- **Simplicity:** Natural language → production agent
- **Power:** Full API access + MCP integration
- **Flexibility:** Modify agents as needed

### For PromptOwl
- **Viral Growth:** MIT licensed agents spread organically
- **Developer Love:** Solves real workflow pain
- **Differentiation:** Only platform with Claude Code integration
- **Community:** Users contribute new agents

### Competitive Advantage
- **vs Cursor/Windsurf:** They don't have agent management
- **vs LangChain:** We have UI + API + Claude Code
- **vs Other AI platforms:** First to bridge Claude Code ↔ Production

## Monetization Opportunities

1. **API Usage:** More agents = more API calls = more usage
2. **Premium Features:** Advanced testing, deployment, monitoring
3. **Enterprise:** Team agent management, shared libraries
4. **Training:** Workshops, courses on agent development
5. **Consulting:** Custom agent development services

## Success Metrics

### Installation
- Downloads of install script
- GitHub stars/forks
- NPM package installs

### Usage
- API calls from agent users
- Agents created via API
- Tools added via API
- Active users per month

### Engagement
- GitHub issues/PRs
- Community agents created
- Documentation page views
- Tutorial completion rate

## Roadmap

### v1.1 (Next 2 weeks)
- [ ] Add agent execution API (currently manual)
- [ ] Batch operations support
- [ ] Agent versioning
- [ ] Export/import enhancements

### v1.2 (Next month)
- [ ] NPM package distribution
- [ ] Agent marketplace
- [ ] Community agent library
- [ ] Advanced testing framework

### v2.0 (Next quarter)
- [ ] Claude Code Marketplace listing
- [ ] Enterprise team features
- [ ] Agent analytics dashboard
- [ ] CI/CD integration

## Support & Community

### Documentation
- Installation guide
- API reference
- Video tutorials
- Use case examples

### Community
- GitHub Discussions
- Discord server
- Stack Overflow tag
- Twitter/X hashtag

### Enterprise Support
- Priority support channel
- Custom agent development
- Training workshops
- Dedicated account manager

## Testing Checklist

Before release:

- [ ] Install script works on macOS
- [ ] Install script works on Linux
- [ ] Install script works on Windows (WSL)
- [ ] All agents load in Claude Code
- [ ] Builder agent creates agents successfully
- [ ] Tester agent generates valid test cases
- [ ] Deployer agent installs MCP servers
- [ ] Tool API endpoints work correctly
- [ ] Documentation is accurate
- [ ] Examples run successfully

## Release Process

### 1. Testing (Local)
```bash
cd claude-code-agents
./install.sh  # Test install
# Test each agent
```

### 2. Commit to Main Branch
```bash
git add claude-code-agents/
git commit -m "feat: Add distributable Claude Code agents"
git push origin feat/claude-code-integration
```

### 3. Create PR
- Description of what was built
- Screenshots/videos of usage
- Link to this guide

### 4. Merge to Main
- After review
- Agents immediately available via raw GitHub URLs

### 5. Announce
- Blog post
- Twitter/X thread
- Discord announcement
- Email to beta users

## Example Use Cases

### 1. Startup Founder
```
Problem: Need to build 10 agents for different workflows
Time without agents: 10 hours (1 hour each)
Time with agents: 30 minutes (3 min each)
Savings: 95% time reduction
```

### 2. Enterprise Dev Team
```
Problem: Maintain consistent agent quality across team
Solution: Use promptowl-tester for all agents
Result: 40% fewer production issues
```

### 3. Agency
```
Problem: Deploy client-specific agents quickly
Solution: Templatize with promptowl-builder
Result: 10x more clients served
```

### 4. Open Source Project
```
Problem: Need contributor onboarding agents
Solution: Automate with MCP deployer
Result: 3x faster onboarding
```

## FAQ

**Q: Do users need a PromptOwl account?**
A: Yes, they need an account and API key.

**Q: Is this free?**
A: Agents are free. API usage follows standard PromptOwl pricing.

**Q: Can users modify agents?**
A: Yes! They can edit markdown files locally.

**Q: Works on Windows?**
A: Yes, via WSL or Git Bash.

**Q: Self-hosted PromptOwl?**
A: Yes, set `PROMPTOWL_API_URL` environment variable.

**Q: Enterprise features?**
A: Contact sales@promptowl.ai for team management.

## License

- **Agents:** MIT License (free to use, modify, distribute)
- **PromptOwl Platform:** Proprietary (standard terms apply)
- **API Usage:** Per PromptOwl pricing

---

## Summary

We've built a **complete autonomous agent distribution system** that enables ANY developer to install three powerful agents in their Claude Code instance and manage PromptOwl agents with zero manual work.

**Key Achievement:** First AI platform to bridge Claude Code ↔ Production deployment with full autonomy.

**Next Steps:**
1. Test thoroughly
2. Create PR
3. Merge to main
4. Announce publicly
5. Monitor adoption

**Expected Impact:**
- 10x faster agent development
- Viral growth through MIT licensing
- Developer love and community building
- Competitive differentiation

---

Built with ❤️ for the PromptOwl community
