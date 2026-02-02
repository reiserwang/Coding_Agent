#!/bin/bash
set -e

# Configuration (Assumed Global Claude Directory)
CLAUDE_DIR="$HOME/.claude"
EXTENSIONS_DIR="$CLAUDE_DIR/extensions/coding-agent"
AGENT_DEST="$EXTENSIONS_DIR/agent" # Destination for agent definition files

# Source Directories (relative to script location)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_SRC="$SCRIPT_DIR/.claude/skills"
AGENT_SRC="$SCRIPT_DIR/agent"

echo "=========================================="
echo "Installing coding-agent for Claude globally..."
echo "=========================================="

mkdir -p "$CLAUDE_DIR"

# 1. Install Skills
# Note: Claude Code doesn't standardly look for global skills in ~/.claude/skills by default in the same way 
# Antigravity does, but we install them here for consistency so they can be referenced or copied.
if [ -d "$SKILLS_SRC" ]; then
    echo "Installing skills from $SKILLS_SRC to $CLAUDE_DIR/skills..."
    mkdir -p "$CLAUDE_DIR/skills"
    cp -R "$SKILLS_SRC/"* "$CLAUDE_DIR/skills/"
else
    echo "Warning: Skills directory $SKILLS_SRC not found."
fi

# 2. Install Agents
if [ -d "$AGENT_SRC" ]; then
    echo "Installing agents from $AGENT_SRC to $AGENT_DEST..."
    mkdir -p "$EXTENSIONS_DIR"
    rm -rf "$AGENT_DEST" # Clean previous install
    cp -R "$AGENT_SRC" "$EXTENSIONS_DIR/"
else
     echo "Error: Agent directory $AGENT_SRC not found."
     exit 1
fi

# 3. Setup Global CLAUDE.md
echo "Setting up global CLAUDE.md..."
# Copy the project's CLAUDE.md as the base for the global one
cp "$AGENT_SRC/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# Add the requested pointer to the agent/CLAUDE.md file
echo "" >> "$CLAUDE_DIR/CLAUDE.md"
echo "See [agent/CLAUDE.md](agent/CLAUDE.md) for the CLAUDE Protocol." >> "$CLAUDE_DIR/CLAUDE.md"

echo "=========================================="
echo "Installation Complete!"
echo "Global CLAUDE.md updated at $CLAUDE_DIR/CLAUDE.md"
echo "=========================================="
