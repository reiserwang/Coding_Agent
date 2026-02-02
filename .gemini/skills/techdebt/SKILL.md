---
name: techdebt
description: Scans the codebase for technical debt, including TODOs, duplicates, and complex functions.
---

# Tech Debt Scanner

Use this skill to identify areas of the codebase that need refactoring or attention.

## Usage
"Run the techdebt skill on [directory]" or simply "Check for tech debt".

## Steps

1.  **Search for TODO/FIXME comments**:
    -   Use `grep_search` to find "TODO", "FIXME", "HACK", "XXX" tags.
    -   Summarize the count and location of these tags.

2.  **Identify Large Files**:
    -   Use `find` or `ls` (via `run_command`) to identify files larger than 500 lines (or reasonable limit for the language).
    -   Example: `find . -type f -name "*.py" -exec wc -l {} + | sort -n | tail -10`

3.  **Check for Duplication** (Heuristic):
    -   If available, use tools like `cpd` or explicit `grep` for repeated block structures if suspected.
    -   Otherwise, rely on Agent observation during navigation: "Note any observed duplicate logic".

4.  **Review `CLAUDE.md` / `GEMINI.md` violations**:
    -   Check if the code follows the patterns defined in `agent/STANDARDS.md`.

5.  **Report**:
    -   Generate a markdown report listing the findings.
    -   Propose a plan to address the most critical items.
