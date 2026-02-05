# Technology Stack - AI Agent Framework

## Core Technologies
- **Shell (Bash):** Used for installation scripts (`install_gemini_global.sh`, `install_claude_global.sh`), workflow automation, and CLI tool interaction.
- **Python:** Used for the Conductor CLI and track management logic (`agent/conductor/`).
- **JavaScript / TypeScript:** Used for building CLI tools and managing dependencies (Node.js/npm ecosystem).

## AI Agent Platforms
- **Gemini CLI:** One of the primary target platforms for agent execution and skill deployment.
- **Claude Code:** The second primary target platform, utilizing similar logic with platform-specific adapters.

## Development & Documentation Tools
- **Git:** Essential for version control, task tracking (via Git Notes), and managing isolated agent worktrees.
- **Mermaid.js:** Used for generating architectural and workflow diagrams within Markdown documentation.

## Architectural Patterns
- **Modular Orchestrator Pattern:** The foundational architecture where a central controller manages specialized sub-agents.
- **Adapter Pattern:** Used to translate universal agent logic into platform-specific configurations for Gemini and Claude.
