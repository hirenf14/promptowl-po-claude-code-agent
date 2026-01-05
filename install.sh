#!/bin/bash
# PromptOwl Claude Code Agents Installer
# Installs autonomous agents for building, testing, and deploying PromptOwl agents

set -e

REPO_URL="https://raw.githubusercontent.com/promptowl/promptowl/main/claude-code-agents"
AGENTS_DIR="$HOME/.claude/agents"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  PromptOwl Claude Code Agents         ║${NC}"
echo -e "${BLUE}║  Autonomous AI Agent Management        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}\n"

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}⚠️  Warning: Claude Code not found in PATH${NC}"
    echo -e "   Install Claude Code from: https://claude.com/code\n"
fi

# Create agents directory
echo -e "${BLUE}📁 Creating agents directory...${NC}"
mkdir -p "$AGENTS_DIR"
echo -e "${GREEN}✓ Directory created: $AGENTS_DIR${NC}\n"

# Download agents
echo -e "${BLUE}📥 Downloading agents...${NC}"

agents=("promptowl-builder" "promptowl-tester" "promptowl-mcp-deployer")

for agent in "${agents[@]}"; do
    echo -e "  Downloading $agent.md..."
    if curl -fsSL "$REPO_URL/$agent.md" -o "$AGENTS_DIR/$agent.md"; then
        echo -e "${GREEN}  ✓ $agent.md installed${NC}"
    else
        echo -e "${RED}  ✗ Failed to download $agent.md${NC}"
        exit 1
    fi
done

echo ""

# Check for API key
echo -e "${BLUE}🔑 Checking PromptOwl API key...${NC}"
if [ -z "$PROMPTOWL_API_KEY" ]; then
    echo -e "${YELLOW}⚠️  PROMPTOWL_API_KEY not set${NC}"
    echo -e "\n${BLUE}To use these agents, you need an API key:${NC}"
    echo -e "  1. Go to https://app.promptowl.ai/api-keys"
    echo -e "  2. Log in and create a new API key"
    echo -e "  3. Add to your shell profile:"
    echo -e ""
    echo -e "     ${BLUE}echo 'export PROMPTOWL_API_KEY=\"po_user_your_key_here\"' >> ~/.bashrc${NC}"
    echo -e "     ${BLUE}source ~/.bashrc${NC}"
    echo -e ""
else
    echo -e "${GREEN}✓ API key found${NC}\n"
fi

# Success message
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✓ Installation Complete!             ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}\n"

echo -e "${BLUE}Installed agents:${NC}"
echo -e "  • ${GREEN}promptowl-builder${NC}      - Build agents from requirements"
echo -e "  • ${GREEN}promptowl-tester${NC}       - Test agents systematically"
echo -e "  • ${GREEN}promptowl-mcp-deployer${NC} - Deploy MCP servers and tools"
echo -e ""

echo -e "${BLUE}Usage:${NC}"
echo -e "  ${BLUE}claude${NC}"
echo -e "  > Use promptowl-builder to create a sentiment analysis agent"
echo -e ""

echo -e "${BLUE}Next steps:${NC}"
if [ -z "$PROMPTOWL_API_KEY" ]; then
    echo -e "  1. ${YELLOW}Set your PROMPTOWL_API_KEY (see above)${NC}"
    echo -e "  2. Restart your terminal"
    echo -e "  3. Try: ${BLUE}claude${NC}"
else
    echo -e "  1. Open Claude Code: ${BLUE}claude${NC}"
    echo -e "  2. Try: \"Use promptowl-builder to create an agent\""
fi
echo -e ""

echo -e "${BLUE}Support:${NC}"
echo -e "  https://github.com/promptowl/promptowl/issues"
echo -e ""
