# Coding Standards

Environment and tooling preferences for all agents.

---

## Python

| Preference | Standard |
|------------|----------|
| **Package Manager** | `uv` (Strictly enforced) |
| **Virtual Environment** | **MANDATORY**: Always put `.venv` in root. **NEVER** install system-wide. |
| **Dependency File** | `pyproject.toml` (uv native) |

**Setup Commands:**
```bash
uv venv
uv pip install -r requirements.txt
# or
uv sync  # if using pyproject.toml
```

---

## JavaScript / TypeScript

| Preference | Standard |
|------------|----------|
| **Package Manager** | `bun` (preferred) or `npm` |
| **Lock File** | `bun.lockb` or `package-lock.json` |

**Setup Commands:**
```bash
bun install
bun run dev
```

---

## Environment Variables

- Never commit secrets to version control
- Use `.env.example` as a template (committed)
- Use `.env` for local overrides (gitignored)
- For production, use secret managers (Vault, AWS Secrets Manager)

---

## Git

| Preference | Standard |
|------------|----------|
| **Branch Naming** | `feature/<name>`, `fix/<name>`, `chore/<name>` |
| **Commit Style** | Conventional Commits (`feat:`, `fix:`, `docs:`) |

---

## Code Style

| Language | Formatter | Linter |
|----------|-----------|--------|
| Python | `ruff format` | `ruff check` |
| JS/TS | `prettier` | `eslint` |
| CSS | `prettier` | `stylelint` |

---

## Testing

| Language | Framework |
|----------|-----------|
| Python | `pytest` |
| JS/TS | `vitest` or `jest` |

---


## 🏗️ Project Setup & Integration

| Protocol | Rule |
|----------|------|
| **Agent Files** | When applying agent to a project, **ALWAYS** gitignore: `.agents/`, `.claude/`, `.gemini/`, `CLAUDE.md`, `GEMINI.md`. |
| **Documentation** | `README.md` **MUST** illustrate the system architecture and flow (e.g., using Mermaid). |

---

## 🔒 Protected Protocols

> [!CAUTION]
> The following protocols are **MANDATORY** and must NEVER be removed during prompt revisions.

| Protocol | Location | Purpose |
|----------|----------|---------|
| **Autonomous Iteration Loop** | `orchestrator/AGENT.md` §196-220 | Enables "ship code while you sleep" sessions |
| **Iteration Loop Workflow** | `workflows/iteration-loop.md` | Step-by-step autonomous execution guide |
| **SCRATCHPAD Notification** | `SCRATCHPAD.md` | Agent-to-agent communication |

**Why Protected:**
- Core to autonomous agent operation
- Enables self-correcting behavior (up to 5 iterations)
- Provides clear escalation path when stuck
- Essential for unattended task completion

---

## 📢 SCRATCHPAD Notification Protocol

> [!IMPORTANT]
> All agents MUST update `SCRATCHPAD.md` when starting or completing tasks.

**When to update:**
1. **Task Start**: Add entry to "Active Agents" table
2. **Key Decisions**: Add to "Key Decisions & Context" section
3. **Blockers**: Add to "Blockers" section immediately
4. **Task Complete**: Update status to "Done" with timestamp
5. **Failures**: Log in "Failure Log" with lessons learned

**Format:**
```markdown
## 🤖 Active Agents
| Agent | Task ID | Status | Last Update |
| :--- | :--- | :--- | :--- |
| **Coder** | TASK-001 | Working on auth module | 2026-01-15 16:14 |
```

This enables:
- Other agents to see current work in progress
- Avoiding duplicate/conflicting work
- Context handoff between agents

