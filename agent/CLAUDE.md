# CLAUDE.md
**Agent Protocol for Claude Code**

## 🤖 Agent Registry
| Role | Resp | Path |
| :--- | :--- | :--- |
| **Orchestrator** | **Orchestrator**. Start here. | `agent/orchestrator/AGENT.md` |
| **Planner** | **Thinking**. Specs, Arch, Plans. | `agent/planner/AGENT.md` |
| **Reviewer** | **Quality**. Sec, Perf, Refactor. | `agent/code_reviewer/AGENT.md` |
| **Tester** | **Verify**. Plans, Auto-tests. | `agent/tester/AGENT.md` |
| **DevOps** | **Ops**. Git, CI/CD, Docker. | `agent/devops/AGENT.md` |
| **Security** | **Sec**. SBOM, Threat Model. | `agent/security/AGENT.md` |
| **UI/UX** | **Design**. Styles, Palettes. | `agent/ui_ux/AGENT.md` |
| **Writer** | **Docs**. API, Guides. | `agent/tech_writer/AGENT.md` |

## 🛠️ Skills Registry
| Skill | When to Use | Priority |
| :--- | :--- | :--- |
| [brainstorming](.claude/skills/brainstorming/SKILL.md) | Before ANY creative work | 🔴 First |
| [writing-plans](.claude/skills/writing-plans/SKILL.md) | After design approval, before coding | 🔴 First |
| [executing-plans](.claude/skills/executing-plans/SKILL.md) | When you have a plan to execute | 🟠 Second |
| [test-driven-development](.claude/skills/test-driven-development/SKILL.md) | ALL code changes | 🔴 First |
| [systematic-debugging](.claude/skills/systematic-debugging/SKILL.md) | ANY technical issue or bug | 🔴 First |
| [requesting-code-review](.claude/skills/requesting-code-review/SKILL.md) | After tasks, before merge | 🟠 Second |
| [frontend-design](.claude/skills/frontend-design/SKILL.md) | Building web UIs | 🟠 Second |
| [explaining-code](.claude/skills/explaining-code/SKILL.md) | Teaching, explaining code | 🟢 Optional |

> **Full Index:** [.claude/skills/SKILL_INDEX.md](.claude/skills/SKILL_INDEX.md)

## 📂 Artifact Standards
| Type | Path | Owner |
| :--- | :--- | :--- |
| **Specs** | `specs/` | Planner |
| **Design** | `design/` | Planner |
| **Docs** | `docs/` | Writer |
| **Tests** | `tests/` | Tester |
| **Sec** | `security/` | Security |
| **Standards** | `agent/STANDARDS.md` | **ALL** |
| **State** | `agent/SCRATCHPAD.md` | **ALL** |

## 🧠 Claude-Specific Protocol
1.  **Subagent Pattern**: Use `Task` tool to spawn specialized agents. Pass Agent path as context.
    ```
    Task: "Read agent/planner/AGENT.md and act as the Planner. Create specs for [feature]."
    ```
2.  **Parallel Execution**: Use `Task` tool with `TodoWrite` to define non-blocking subtasks.
3.  **State Sync**: Read/Write `agent/SCRATCHPAD.md` before/after major steps.
4.  **File Focus**: Claude Code works best with explicit file paths. Always specify paths.

## 🚀 Team Productivity Playbook
Adhere to the [Team Productivity Playbook](docs/playbook/TEAM_PRODUCTIVITY.md):

1.  **Do More in Parallel**: Use git worktrees for independent tasks (`agent/workflows/git-worktree.md`).
2.  **Plan Mode**: Start complex tasks with a Planner. Write `implementation_plan.md` first. Review as a staff engineer.
3.  **Self-Correction**: If you fail or err, run `agile-retrospective` skill to log it in `agent/memory/LESSONS.md`.
4.  **Reusable Skills**: If a task is repeated, wrap it into a skill. Use `/techdebt` skill to scan for issues.
5.  **End-to-End Ownership**: When fixing bugs, verify end-to-end (CI, Docker logs). Don't just patch.
6.  **Reviewer Persona**: Challenge the user. "Grill me on these changes."
7.  **Data & Analytics**: Use CLI tools for data tasks.
8.  **Learning**: Use Explainable Mode for complex logic.

## ⚡ Quick-Start
```bash
# 1. User Request
"Build a login feature"

# 2. Orchestrator Starts
Read CLAUDE.md -> Initialize SCRATCHPAD -> Spawn Planner

# 3. Planner Thinks
Write specs/login.md -> Write design/login_arch.md -> Output task list

# 4. Orchestrator Executes
Assign tasks to Coder -> Review -> Test -> Deploy
```
