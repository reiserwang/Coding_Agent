---
name: agile-retrospective
description: Conducts a retrospective analysis of the recent task, identifying successes, failures, and actionable improvements. Updates LESSONS.md and CLAUDE.md/GEMINI.md.
---

# Agile Retrospective Skill

Use this skill at the end of every significant task or when an error occurs to capture learning.

## Steps

1.  **Analyze Context**:
    -   Review `agent/SCRATCHPAD.md` and recent tool outputs.
    -   Identify the primary goal and the actual outcome.

2.  **Identify Key Events**:
    -   **Successes**: What worked well? (e.g., correct tool usage, efficient plan)
    -   **Failures**: What broke? (e.g., lint errors, test failures, wrong assumption)

3.  **Root Cause Analysis (5 Whys)**:
    -   For any failure, ask "Why?" until the root cause (often process or knowledge gap) is found.

4.  **Update Memory**:
    -   **Append to `agent/memory/LESSONS.md`**:
        ```markdown
        ### [Task Name]
        - **Date**: [YYYY-MM-DD]
        - **Outcome**: [Success/Failure]
        - **Lesson**: [What was learned]
        - **Action**: [What we will do differently]
        ```

5.  **Enforce Rules (Optional)**:
    -   If the lesson is a permanent rule (e.g., "Always run lint before commit"), **UPDATE** `agent/GEMINI.md` or `agent/CLAUDE.md`.
    -   Add strictly enforced rules to the `Iron Laws` section or appropriate Agent Protocol section.
