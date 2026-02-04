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
# Generate global memory file
cat > "$CLAUDE_DIR/CLAUDE.md" <<EOF
# CLAUDE.md (Global Memory)

## 🧠 Self-Learning Protocol
**Core Rule**: After each correction, update this file (or the project-specific CLAUDE.md) so you don't make the same mistake again.
"Update CLAUDE.md so you don't make that mistake again."

- **Refine and Prune**: Continuously refine and prune this file.
- **Scope**: Keep global preferences here. Put project-specific rules in \`repo/CLAUDE.md\`.

## 🛠️ Global Preferences
- **Personality**: Helpful, concise, agentic.
- **Protocol**: Always read the project's \`CLAUDE.md\` or \`README.md\` first to understand the context.

## 🔥 Power Moves
- **Reviewer**: "Grill me on these changes before PR", "Prove this works", "Diff main vs feature".
- **Refactor**: "Knowing everything now, scrap this and implement the elegant solution."
- **Specs**: "Write precise specs. More specificity leads to better output."
EOF

echo "=========================================="
echo "Installation Complete!"
echo "Global CLAUDE.md updated at $CLAUDE_DIR/CLAUDE.md"
echo "=========================================="
