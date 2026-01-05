# PromptOwl Claude Code Agents

Autonomous agents for building, testing, and deploying PromptOwl agents directly from Claude Code.

## Quick Install

```bash
# Install all PromptOwl agents
curl -fsSL https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/install.sh | bash

# Or install individually
mkdir -p ~/.claude/agents
curl -o ~/.claude/agents/promptowl-builder.md \
  https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/promptowl-builder.md
```

## Prerequisites

1. **Claude Code** installed and configured
2. **PromptOwl API Key** from https://app.promptowl.ai/api-keys

Set your API key:
```bash
# Add to your shell profile (~/.bashrc, ~/.zshrc, etc.)
export PROMPTOWL_API_KEY="po_user_your_key_here"
export PROMPTOWL_API_URL="https://app.promptowl.ai"  # Optional, defaults to this
```

## Available Agents

### 1. PromptOwl Agent Builder (`promptowl-builder.md`)

**What it does:** Autonomously builds production-ready PromptOwl agents from natural language requirements.

**Usage:**
```
Claude, use the promptowl-builder agent to create a code security reviewer that checks for SQL injection, XSS, and authentication issues.
```

**The agent will:**
- Analyze requirements
- Design the agent (instructions, variables, tools)
- Create via API
- Add necessary tools
- Provide test cases
- Deploy to production

**Features:**
- Zero manual intervention
- Adds tools automatically
- Provides comprehensive test cases
- Generates deployment scripts

### 2. PromptOwl Agent Tester (`promptowl-tester.md`)

**What it does:** Systematically tests PromptOwl agents with edge cases and validates outputs.

**Usage:**
```
Claude, use the promptowl-tester agent to test my "Code Reviewer" agent with various security vulnerabilities.
```

**The agent will:**
- Fetch agent configuration via API
- Generate comprehensive test cases
- Provide test inputs and expected outputs
- Suggest improvements based on gaps
- Update agent if issues found

**Features:**
- Automatic test case generation
- Edge case coverage
- Performance benchmarking
- Regression testing support

### 3. PromptOwl MCP Deployer (`promptowl-mcp-deployer.md`)

**What it does:** Deploys and configures MCP servers, then integrates them with your PromptOwl agents.

**Usage:**
```
Claude, use the promptowl-mcp-deployer agent to add Playwright browser testing to my QA agent.
```

**The agent will:**
- Install MCP server packages
- Configure MCP server settings
- Add tools to your agent via API
- Test the integration
- Provide usage examples

**Features:**
- Supports all popular MCP servers
- Automatic dependency installation
- Configuration management
- Integration testing

## Installation Methods

### Method 1: Curl (Recommended)

```bash
# Install all agents
bash <(curl -fsSL https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/install.sh)
```

### Method 2: Git Clone

```bash
git clone https://github.com/promptowl/promptowl.git
cd promptowl/claude-code-agents
./install.sh
```

### Method 3: Manual

```bash
mkdir -p ~/.claude/agents
cd ~/.claude/agents

# Download each agent
curl -O https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/promptowl-builder.md
curl -O https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/promptowl-tester.md
curl -O https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents/promptowl-mcp-deployer.md
```

## Usage Examples

### Example 1: Build a Sentiment Analyzer

```
You: Claude, use the promptowl-builder agent to create a sentiment analysis agent that:
- Analyzes social media posts
- Returns sentiment score 1-10
- Identifies key emotions
- Suggests response strategies

Claude: [Autonomously builds, tests, and deploys the agent]

Output:
✅ Agent "Social Sentiment Analyzer" created
📍 ID: 507f1f77bcf86cd799439011
🔗 URL: https://app.promptowl.ai/prompt/edit/507f1f77bcf86cd799439011
🏷️ Tags: sentiment, social-media, production
```

### Example 2: Test an Existing Agent

```
You: Claude, use the promptowl-tester agent to test agent ID 507f1f77bcf86cd799439011 with edge cases.

Claude: [Fetches agent, generates test cases, validates]

Output:
✅ Tested 15 cases: 13 passed, 2 failed
⚠️ Issues found:
  - Fails on emoji-only posts
  - Inconsistent scoring for sarcasm
🔧 Suggested fix: Add emoji handling and sarcasm detection to instructions
```

### Example 3: Add MCP Tools

```
You: Claude, use the promptowl-mcp-deployer agent to add web scraping capability to my research agent.

Claude: [Installs Playwright MCP, configures, adds tools]

Output:
✅ Playwright MCP server installed
✅ Tools added to agent: browser_navigate, browser_snapshot
✅ Configuration: ~/.mcp-servers.json updated
📖 Usage example provided
```

## Configuration

### Setting API Key

The agents need your PromptOwl API key to function.

**Option 1: Environment Variable**
```bash
export PROMPTOWL_API_KEY="po_user_abc123..."
```

**Option 2: `.env` file**
```bash
# In your project directory
echo "PROMPTOWL_API_KEY=po_user_abc123..." >> .env
```

**Option 3: MCP Server Config**
```json
{
  "promptowl": {
    "command": "npx",
    "args": ["-y", "@promptowl/mcp-server"],
    "env": {
      "PROMPTOWL_API_KEY": "po_user_abc123..."
    }
  }
}
```

### Custom API URL (Self-Hosted)

```bash
export PROMPTOWL_API_URL="https://your-instance.com"
```

## How It Works

1. **User invokes agent** via Claude Code: "Use promptowl-builder to..."
2. **Agent receives context** from its markdown file
3. **Agent executes autonomously** following its instructions
4. **Agent uses PromptOwl API** to create/update/test agents
5. **Agent reports results** with URLs and next steps

## Advanced Usage

### Chaining Agents

```
You: Claude, use promptowl-builder to create a code reviewer, then use promptowl-tester to validate it, then use promptowl-mcp-deployer to add GitHub integration.

Claude: [Executes all three agents in sequence]
```

### Custom Workflows

Create your own agent that combines multiple PromptOwl agents:

```markdown
---
name: my-custom-workflow
---

# My Custom Workflow

When asked to deploy a production agent:

1. Use promptowl-builder to create it
2. Use promptowl-tester to validate it
3. Use promptowl-mcp-deployer to add necessary tools
4. Export as markdown for version control
5. Deploy to production
```

## Troubleshooting

### "Agent not found"

**Solution:** Make sure agents are in `~/.claude/agents/` directory.

```bash
ls -la ~/.claude/agents/
```

### "Invalid API key"

**Solution:** Check your API key is set correctly.

```bash
echo $PROMPTOWL_API_KEY
# Should output: po_user_...
```

### "Command not found"

**Solution:** Ensure Claude Code is in your PATH.

```bash
which claude
```

## Contributing

Want to add more agents or improve existing ones?

```bash
git clone https://github.com/promptowl/promptowl.git
cd promptowl/claude-code-agents
# Edit agents/*.md files
git commit -am "Improve agent X"
git push
# Create PR
```

## Support

- **Documentation:** https://app.promptowl.ai/docs/claude-code
- **Issues:** https://github.com/promptowl/promptowl/issues
- **Discord:** https://discord.gg/promptowl
- **Email:** support@promptowl.ai

## License

MIT License - See [LICENSE](../LICENSE) for details.

## Changelog

### v1.0.0 (2024-12-04)
- Initial release
- promptowl-builder agent
- promptowl-tester agent
- promptowl-mcp-deployer agent
- Tool management API support
