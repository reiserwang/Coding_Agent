# GEMINI Protocol
**Root Index & Team Shared Memory**

## 🤖 Agent Registry
| Role | Resp | Path |
| :--- | :--- | :--- |
| **Orchestrator** | **Orchestrator**. Start here. | [.agents/orchestrator/AGENT.md](.agents/orchestrator/AGENT.md) |
| **Planner** | **Thinking**. Specs, Arch, Plans. | [.agents/planner/AGENT.md](.agents/planner/AGENT.md) |
| **Coder** | **Build**. Reviewer, Dev, Test. | *(Standard)* |
| **Reviewer** | **Quality**. Sec, Perf, Refactor. | [.agents/code_reviewer/AGENT.md](.agents/code_reviewer/AGENT.md) |
| **Tester** | **Verify**. Plans, Auto-tests. | [.agents/tester/AGENT.md](.agents/tester/AGENT.md) |
| **DevOps** | **Ops**. Git, CI/CD, Docker. | [.agents/devops/AGENT.md](.agents/devops/AGENT.md) |
| **Security** | **Sec**. SBOM, Threat Model. | [.agents/security/AGENT.md](.agents/security/AGENT.md) |
| **UI/UX** | **Design**. Styles, Palettes. | [.agents/ui_ux/AGENT.md](.agents/ui_ux/AGENT.md) |
| **Writer** | **Docs**. API, Guides. | [.agents/tech_writer/AGENT.md](.agents/tech_writer/AGENT.md) |

## 🛠️ Skills Registry
| Skill | When to Use | Priority |
| :--- | :--- | :--- |
| [brainstorming](.shared/skills/brainstorming/SKILL.md) | Before ANY creative work | 🔴 First |
| [writing-plans](.shared/skills/writing-plans/SKILL.md) | After design approval, before coding | 🔴 First |
| [executing-plans](.shared/skills/executing-plans/SKILL.md) | When you have a plan to execute | 🟠 Second |
| [test-driven-development](.shared/skills/test-driven-development/SKILL.md) | ALL code changes | 🔴 First |
| [systematic-debugging](.shared/skills/systematic-debugging/SKILL.md) | ANY technical issue or bug | 🔴 First |
| [requesting-code-review](.shared/skills/requesting-code-review/SKILL.md) | After tasks, before merge | 🟠 Second |
| [frontend-design](.shared/skills/frontend-design/SKILL.md) | Building web UIs | 🟠 Second |
| [explaining-code](.shared/skills/explaining-code/SKILL.md) | Teaching, explaining code | 🟢 Optional |

> **Full Index:** [.shared/skills/SKILL_INDEX.md](.shared/skills/SKILL_INDEX.md)

## 📂 Artifact Standards
| Type | Path | Owner |
| :--- | :--- | :--- |
| **Specs** | `specs/` | Planner |
| **Design** | `design/` | Planner |
| **Plans** | `docs/plans/` | Planner |
| **Docs** | `docs/` | Writer |
| **Tests** | `tests/` | Tester |
| **Sec** | `security/` | Security |
| **Standards** | [.agents/STANDARDS.md](.agents/STANDARDS.md) | **ALL** |
| **State** | `.agents/SCRATCHPAD.md` | **ALL** |

## 🧠 Shared Memory Protocol
1.  **State**: Always read/write `.agents/SCRATCHPAD.md` for active context.
2.  **Skills**: Check `.shared/skills/SKILL_INDEX.md` before any task.
3.  **Flow**: Orchestrator → Planner (brainstorming → writing-plans) → Coder (executing-plans + TDD) → Verify.
4.  **Git**: DevOps owns branches/PRs. Check `task.md` for top-level tracking.

## 🎯 Skill Invocation Pattern
1. **Check** `.shared/skills/SKILL_INDEX.md` for relevant skills
2. **Announce** "I'm using the [skill-name] skill to [purpose]."
3. **Follow** skill instructions exactly
