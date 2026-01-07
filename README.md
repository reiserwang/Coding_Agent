# 🤖 AI Agent Framework

A modular, token-optimized agent architecture for AI-assisted software development.

## ✨ Features
- **Orchestrator Pattern**: Manager delegates to specialized subagents
- **Shared State**: Central `SCRATCHPAD.md` for multi-agent coordination
- **Multi-Platform**: Supports Gemini/Antigravity and Claude Code
- **Token Optimized**: Concise index files save context window

## 📁 Structure
```
.
├── GEMINI.md              # Index for Gemini agents
├── CLAUDE.md              # Index for Claude Code agents
├── README.md              # This file
└── .agents/
    ├── SCRATCHPAD.md  # Shared state (live blackboard)
    ├── manager/       # Orchestrator
    ├── planner/       # Specs + Architecture + Tasks
    ├── code_reviewer/ # Quality
    ├── tester/        # Verification
    ├── devops/        # Git + CI/CD
    ├── security/      # SBOM + Threat Model
    ├── ui_ux/         # Design intelligence
    └── tech_writer/   # Documentation
```

## 🚀 Quick Start

### For Gemini / Antigravity
```
Read GEMINI.md. Act as the Manager. Build a [feature].
```

### For Claude Code
```
Read CLAUDE.md. Act as the Manager. Build a [feature].
```

## 🔄 Workflow
1. **Manager** reads the index file (`GEMINI.md` or `CLAUDE.md`)
2. **Manager** calls **Planner** → outputs `specs/` and `design/`
3. **Manager** assigns tasks to **Coders**
4. **Manager** calls **Reviewer** + **Tester** to verify
5. **Manager** calls **Tech Writer** to update docs

## 📝 Key Files
| File | Purpose |
|------|---------|
| `GEMINI.md` | Agent registry for Gemini |
| `CLAUDE.md` | Agent registry for Claude |
| `.agents/SCRATCHPAD.md` | Live state for all agents |

## 📖 License
MIT
