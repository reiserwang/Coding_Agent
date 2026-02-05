# GEMINI.md (Project Memory)

## 🧠 Self-Learning Protocol
**Core Rule**: After each correction, update this file so you don't make the same mistake again.
"Update GEMINI.md so you don't make that mistake again."

- **Refine and Prune**: Continuously refine and prune this file.

## 🤖 Agent Registry
| Role | Resp | Path |
| :--- | :--- | :--- |
| **Orchestrator** | **Orchestrator**. Start here. | [agent/orchestrator/AGENT.md](agent/orchestrator/AGENT.md) |
| **Planner** | **Thinking**. Specs, Arch, Plans. | [agent/planner/AGENT.md](agent/planner/AGENT.md) |
| **Coder** | **Build**. Reviewer, Dev, Test. | *(Standard)* |
| **Reviewer** | **Quality**. Sec, Perf, Refactor. | [agent/code_reviewer/AGENT.md](agent/code_reviewer/AGENT.md) |
| **Tester** | **Verify**. Plans, Auto-tests. | [agent/tester/AGENT.md](agent/tester/AGENT.md) |
| **DevOps** | **Ops**. Git, CI/CD, Docker. | [agent/devops/AGENT.md](agent/devops/AGENT.md) |
| **Security** | **Sec**. SBOM, Threat Model. | [agent/security/AGENT.md](agent/security/AGENT.md) |
| **UI/UX** | **Design**. Styles, Palettes. | [agent/ui_ux/AGENT.md](agent/ui_ux/AGENT.md) |
| **Writer** | **Docs**. API, Guides. | [agent/tech_writer/AGENT.md](agent/tech_writer/AGENT.md) |

## 🛠️ Skills Registry
| Skill | When to Use | Priority |
| :--- | :--- | :--- |
| [conductor](.gemini/skills/conductor/SKILL.md) | Spec-driven development (Features/Bugs) | 🔴 First |
| [brainstorming](.gemini/skills/brainstorming/SKILL.md) | Before ANY creative work | 🔴 First |
| [writing-plans](.gemini/skills/writing-plans/SKILL.md) | After design approval, before coding | 🔴 First |
| [executing-plans](.gemini/skills/executing-plans/SKILL.md) | When you have a plan to execute | 🟠 Second |
| [test-driven-development](.gemini/skills/test-driven-development/SKILL.md) | ALL code changes | 🔴 First |
| [systematic-debugging](.gemini/skills/systematic-debugging/SKILL.md) | ANY technical issue or bug | 🔴 First |
| [requesting-code-review](.gemini/skills/requesting-code-review/SKILL.md) | After tasks, before merge | 🟠 Second |
| [frontend-design](.gemini/skills/frontend-design/SKILL.md) | Building web UIs | 🟠 Second |
| [explaining-code](.gemini/skills/explaining-code/SKILL.md) | Teaching, explaining code | 🟢 Optional |

> **Full Index:** [.gemini/skills/SKILL_INDEX.md](.gemini/skills/SKILL_INDEX.md)

## 📂 Artifact Standards
| Type | Path | Owner |
| :--- | :--- | :--- |
| **Tracks** | `conductor/tracks/` | Orchestrator |
| **Specs** | `conductor/tracks/<id>/spec.md` | Planner |
| **Plans** | `conductor/tracks/<id>/plan.md` | Planner |
| **Docs** | `docs/` | Writer |
| **Tests** | `tests/` | Tester |
| **Sec** | `security/` | Security |
| **Standards** | [agent/STANDARDS.md](agent/STANDARDS.md) | **ALL** |
| **State** | `agent/SCRATCHPAD.md` | **ALL** |

## 🧠 Shared Memory Protocol
1.  **State**: Always read/write `agent/SCRATCHPAD.md` for active context, including the `Active Conductor Track` field.
2.  **Skills**: Check `.gemini/skills/SKILL_INDEX.md` before any task.
3.  **Flow**: Orchestrator → Conductor Path (`conductor:newTrack` → `conductor:implement`) OR Hot Path (Direct delegation).
4.  **Git**: DevOps owns branches/PRs. Check `task.md` or track plans for tracking.
5.  **Log and Elaborate**: Always log your thoughts and decisions summary in `agent/NOTEPAD.md` as your and user's shared memory. Also note "what's next" in the NOTEPAD.md.

## 🎯 Skill Invocation Pattern
1. **Check** `.gemini/skills/SKILL_INDEX.md` for relevant skills
2. **Announce** "I'm using the [skill-name] skill to [purpose]."
3. **Follow** skill instructions exactly

## 🚀 Team Productivity Playbook (Gemini Edition)
Adhere to the [Team Productivity Playbook](docs/playbook/TEAM_PRODUCTIVITY.md):

1.  **Do More in Parallel**: spin up worktrees for isolated tasks (`agent/workflows/git-worktree.md`).
2.  **Conductor-First**: ALWAYS use `conductor:newTrack` for complex tasks/features.
3.  **Self-Correction**: If you fail or err, run `agile-retrospective` skill to log it in `agent/memory/LESSONS.md`.
4.  **Reusable Skills**: Convert repetitive tasks into skills in `.gemini/skills/`. Use `techdebt` skill.
5.  **End-to-End Ownership**: Don't stop at code change. Verify CI, logs, and deployment if possible.
6.  **Reviewer Persona**: Be your own harsh critic. Challenge the plan before executing.
7.  **Data & Analytics**: Use CLI tools and store analytics patterns.
8.  **Learning**: Explain "Why" in your thought process (Thought Block).
