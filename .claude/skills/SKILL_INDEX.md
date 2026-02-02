# Skills Index

Master index of all available skills. Check skills before any task.

## Core Workflow Skills

| Skill | When to Use | Priority |
|-------|-------------|----------|
| [brainstorming](./brainstorming/SKILL.md) | Before ANY creative work, building features | 🔴 First |
| [writing-plans](./writing-plans/SKILL.md) | After design approval, before coding | 🔴 First |
| [executing-plans](./executing-plans/SKILL.md) | When you have a plan to execute | 🟠 Second |
| [test-driven-development](./test-driven-development/SKILL.md) | ALL code changes | 🔴 First |
| [systematic-debugging](./systematic-debugging/SKILL.md) | ANY technical issue or bug | 🔴 First |
| [requesting-code-review](./requesting-code-review/SKILL.md) | After completing tasks, before merge | 🟠 Second |
| [pr-integration](./pr-integration/SKILL.md) | Integrating Pull Requests | 🟠 Second |
| [techdebt](./techdebt/SKILL.md) | Identifying technical debt, maintenance | 🟢 Optional |
| [agile-retrospective](./agile-retrospective/SKILL.md) | **LEARNING**. Reviewing tasks & errors. | 🔴 First (on failure) / 🟢 Optional (on success) |

## Domain Skills

| Skill | When to Use |
|-------|-------------|
| [frontend-design](./frontend-design/SKILL.md) | Building web UIs, components, pages |
| [explaining-code](./explaining-code/SKILL.md) | Teaching, explaining how code works |

---

## Skill Priority Order

When multiple skills could apply:

1. **Process skills first** (brainstorming, debugging) - HOW to approach
2. **Implementation skills second** (frontend-design) - HOW to execute

**Examples:**
- "Build X" → brainstorming → writing-plans → executing-plans
- "Fix bug" → systematic-debugging → test-driven-development
- "Build UI" → brainstorming → frontend-design → writing-plans

---

## Skill Invocation Pattern

When using a skill:
1. Announce: "I'm using the [skill-name] skill to [purpose]."
2. Follow skill instructions exactly
3. Reference other skills when indicated

---

## Iron Laws

Some skills have non-negotiable rules:

| Skill | Iron Law |
|-------|----------|
| TDD | NO production code without failing test first |
| Debugging | NO fixes without root cause investigation first |
