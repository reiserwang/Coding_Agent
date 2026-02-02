# Team Productivity Playbook

This playbook outlines patterns and strategies for maximizing productivity with AI agents (Claude, Gemini).

## 1. Do More in Parallel
- **Spin up 3–5 git worktrees simultaneously.**
- Run a separate Agent session per worktree.
- Many teams prefer worktrees over multiple checkouts.

**Advanced usage**:
- Name worktrees + create shell aliases (za, zb, zc) for instant switching.
- Maintain a dedicated analysis worktree for logs, BigQuery queries, and debugging.

## 2. Start Complex Tasks in Plan Mode
- Invest heavily in planning so implementation can be 1-shot.

**Workflow pattern**:
1. Agent #1 writes implementation plan (`implementation_plan.md`).
2. Agent #2 (or User) reviews as staff engineer.
- If things go wrong, return to planning instead of patching.

## 3. Agile Retrospection & Memory (LESSONS.md)
Instead of just fixing bugs, we *learn* from them.

**Workflow**:
1. After a task (or failure), run the `agile-retrospective` skill.
2. Skill log findings to `agent/memory/LESSONS.md`.
3. If a rule is permanent, promote it to `CLAUDE.md` / `GEMINI.md`.

**Lesson Structure**:
- **Date**: When it happened.
- **Context**: What we were doing.
- **Root Cause**: Why it failed.
- **Action**: How to prevent it (e.g., "New linter rule", "Update TDD process").

## 4. Build Reusable Skills (Commit to Git)
- Convert repeated tasks into reusable commands or skills.
- If you do something more than once per day, make it a skill.
- Create `/techdebt` command to detect duplicate or bad code each session.

## 5. Let Agent Fix Bugs End-to-End
**Pattern**:
1. Enable Slack MCP (if available).
2. Paste Slack bug thread and say “fix”.

**Or**:
- Fix failing CI tests.
- Point Agent directly at Docker logs.
- Avoid micromanaging implementation details.

## 6. Level Up Prompting
**Make Agent Your Reviewer**:
- "Grill me on these changes before PR"
- "Prove this works"
- "Diff main vs feature branch behavior"

**Force Elegant Refactors**:
After mediocre fix:
"Knowing everything now, scrap this and implement the elegant solution"

**Write Precise Specs**:
More specificity leads to better output and less iteration.

## 7. Terminal and Environment Setup
**Recommended terminal**:
- Ghostty (synchronized rendering, 24-bit color, Unicode)

**Tips**:
Use `/statusline` to display:
- Context usage
- Current git branch

## 8. Use Subagents
**Parallel Compute**:
- Add “Use subagents”

**Context Isolation**:
- Offload subtasks to keep main agent context clean.

**Security and Permission Routing**:
- Route permission checks to higher-tier models via hooks.

## 9. Use Agent for Data and Analytics
- Call CLI tools directly (example: `bq` for BigQuery).
- Store analytics skills inside repo.
- Query and analyze without writing raw SQL.

## 10. Learning With Agent
- **Explanatory Mode**: Enable learning or explanatory output to understand why changes were made.
- **Auto-Generated Learning Materials**: Generate HTML slide decks.
- **Diagram Generation**: Ask for ASCII/Mermaid diagrams.
- **Spaced Repetition Skill**: Explain your understanding, Agent asks follow-ups, stores refined knowledge.

## Meta Pattern
Highest leverage usage combines:
- Parallelism
- Persistent memory
- Skill abstraction
- Delegation via subagents
- Direct tool execution via MCP or CLI
