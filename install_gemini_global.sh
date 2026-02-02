#!/bin/bash
set -e

# Configuration
GEMINI_DIR="$HOME/.gemini"
GLOBAL_SKILLS_DIR="$GEMINI_DIR/antigravity/global_skills"
EXTENSIONS_DIR="$GEMINI_DIR/extensions/coding-agent"
AGENTS_DEST="$EXTENSIONS_DIR/agents"
SHARED_DEST="$EXTENSIONS_DIR/shared"

# Source Directories (relative to script location)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_SRC="$SCRIPT_DIR/.gemini/skills"
AGENTS_SRC="$SCRIPT_DIR/.agents"
SHARED_SRC="$SCRIPT_DIR/.shared"
GEMINI_MD_SRC="$SCRIPT_DIR/GEMINI.md"

echo "==========================================