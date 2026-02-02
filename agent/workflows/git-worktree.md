---
description: How to manage git worktrees for parallel agent sessions
---

# Git Worktree Workflow

Use this workflow to spin up parallel environments for the agent to work on multiple tasks simultaneously.

## 1. List Current Worktrees
Check what is currently active.
```bash
git worktree list
```

## 2. Create a New Worktree
Create a worktree for a specific branch or feature.
```bash
# Syntax: git worktree add [path] [branch]
# Example: Create a 'feat-login' worktree in a sibling directory
git worktree add ../coding-agent-feat-login feature/login
```

## 3. Configure Agent in Worktree
When switching to a new worktree, ensure the agent has the correct context.
- The `repo/CLAUDE.md` and `agent/GEMINI.md` are shared if they are committed, but local uncommitted changes won't be visible.
- Ensure you run the agent typically from the root of the worktree.

## 4. Remove a Worktree
When the task is done and merged.
```bash
git worktree remove ../coding-agent-feat-login
```

## Tips
- maintain a `main` worktree for general purpose or merging.
- maintain a `dirty` or `debug` worktree for experimenting.
