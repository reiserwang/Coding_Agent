# CLAUDE.md (Project Memory)

## 🧠 Self-Learning Protocol
**Core Rule**: After each correction, update this file so you don't make the same mistake again.
"Update CLAUDE.md so you don't make that mistake again."

- **Refine and Prune**: Continuously refine and prune this file.

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
| [conductor](.claude/skills/conductor/SKILL.md) | Spec-driven development (Features/Bugs) | 🔴 First |
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
| **Tracks** | `conductor/tracks/` | Orchestrator |
| **Specs** | `conductor/tracks/<id>/spec.md` | Planner |
| **Plans** | `conductor/tracks/<id>/plan.md` | Planner |
| **Docs** | `docs/` | Writer |
| **Tests** | `tests/` | Tester |
| **Sec** | `security/` | Security |
| **Standards** | `agent/STANDARDS.md` | **ALL** |
| **State** | `agent/SCRATCHPAD.md` | **ALL** |

## 🧠 Claude-Specific Protocol
1.  **Conductor First**: Use `/conductor:newTrack` for complex features.
2.  **Subagent Pattern**: Use `Task` tool to spawn specialized agents. Pass Agent path as context.
3.  **State Sync**: Read/Write `agent/SCRATCHPAD.md` (including `Active Conductor Track`) before/after major steps.
4.  **File Focus**: Claude Code works best with explicit file paths. Always specify paths.

## 🚀 Team Productivity Playbook
Adhere to the [Team Productivity Playbook](docs/playbook/TEAM_PRODUCTIVITY.md):

1.  **Do More in Parallel**: Use git worktrees for independent tasks (`agent/workflows/git-worktree.md`).
2.  **Conductor Mode**: ALWAYS use `conductor:newTrack` for complex tasks.
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
Read CLAUDE.md -> Initialize SCRATCHPAD -> /conductor:newTrack

# 3. Spec & Plan
Create spec.md -> User Approval -> Create plan.md -> User Approval

# 4. Implementation
/conductor:implement -> TDD Loop -> Phase Verification -> Sync Docs
```
