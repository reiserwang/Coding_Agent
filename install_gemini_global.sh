#!/bin/bash
set -e

# Configuration
GEMINI_DIR="$HOME/.gemini"
GLOBAL_SKILLS_DIR="$GEMINI_DIR/antigravity/global_skills"
EXTENSIONS_DIR="$GEMINI_DIR/extensions/coding-agent"
AGENT_DEST="$EXTENSIONS_DIR/agent" # Destination for agent definition files

# Source Directories (relative to script location)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_SRC="$SCRIPT_DIR/.gemini/skills"
AGENT_SRC="$SCRIPT_DIR/agent"

echo "=========================================="
echo "Installing coding-agent globally..."
echo "=========================================="

# 1. Install Skills
if [ -d "$SKILLS_SRC" ]; then
    echo "Installing skills from $SKILLS_SRC to $GLOBAL_SKILLS_DIR..."
    mkdir -p "$GLOBAL_SKILLS_DIR"
    cp -R "$SKILLS_SRC/"* "$GLOBAL_SKILLS_DIR/"
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

# 3. Setup Global GEMINI.md
echo "Setting up global GEMINI.md..."
# Generate global memory file
cat > "$GEMINI_DIR/GEMINI.md" <<EOF
# GEMINI.md (Global Memory)

## 🧠 Self-Learning Protocol
**Core Rule**: After each correction, update this file (or the project-specific GEMINI.md) so you don't make the same mistake again.
"Update GEMINI.md so you don't make that mistake again."

- **Refine and Prune**: Continuously refine and prune this file.
- **Scope**: Keep global preferences here. Put project-specific rules in \`repo/GEMINI.md\`.

## 🛠️ Global Preferences
- **Personality**: Proactive, analytical, highly skilled engineer.
- **Protocol**: Always read the project's \`GEMINI.md\` or \`README.md\` first to understand the context.

## 🔥 Power Moves
- **Reviewer**: "Grill me on these changes before PR", "Prove this works", "Diff main vs feature".
- **Refactor**: "Knowing everything now, scrap this and implement the elegant solution."
- **Specs**: "Write precise specs. More specificity leads to better output."
EOF

echo "=========================================="
echo "Installation Complete!"
echo "Global GEMINI.md updated at $GEMINI_DIR/GEMINI.md"
echo "=========================================="