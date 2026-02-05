---
name: conductor
description: Project-level orchestration and feature implementation workflow.
---

# Conductor Skill

Use this skill to manage the software development lifecycle using the "Conductor" methodology. This involves defining project context, planning features (tracks), and implementing them systematically.

## Commands

### 1. Setup Project (`conductor:setup`)
Initializes the Conductor structure in the project using templates.

**Steps:**
1.  Check if `conductor/` directory exists.
2.  Create directory structure:
    ```
    conductor/
      tracks/
    ```
3.  Create context files from templates if they don't exist:
    -   `conductor/product.md` (Product goals, users)
    -   `conductor/product-guidelines.md` (Design, style, voice)
    -   `conductor/tech-stack.md` (Languages, frameworks, patterns)
    -   `conductor/workflow.md` (Development workflow & rules)
4.  Instruct the user to fill in these files.

### 2. Start New Track (`conductor:newTrack`)
Prepares a new feature or bug fix "track".

**Steps:**
1.  Ask user for a short description or name for the track (e.g., "login-page").
2.  Generate a unique Track ID (e.g., `TR-001` or timestamp-based `20240520-login`).
3.  Create track directory: `conductor/tracks/<TRACK_ID>/`.
4.  Create `spec.md` from template:
    -   Goal: What are we building?
    -   Context: Why? Who for?
    -   Requirements: Functional & Non-functional.
5.  Create `plan.md` from template:
    -   Phases (e.g., Setup, Implementation, Verification).
    -   Tasks (Checklist).
6.  **Update `conductor/tracks.md`**: Add the new track to the list of active tracks.
7.  Ask user to review and fill out `spec.md`.
8.  Once `spec.md` is approved, Ask user to approve `plan.md`.

### 3. Implement Track (`conductor:implement`)
executes the plan for a specific track.

**Pre-requisites:**
-   User must have approved `spec.md` and `plan.md`.

**Steps:**
1.  **Read Context**: functional `view_file` on `conductor/product.md`, `tech-stack.md`, `workflow.md`, and the track's `spec.md` and `plan.md`.
2.  **Next Task**: Find the first unchecked item in `plan.md`.
3.  **Execute**:
    -   Follow the **TDD** cycle defined in `workflow.md`.
    -   Create/Edit code.
    -   Run tests.
4.  **Update Plan**: Mark the task as `[~]` (in progress) then `[x]` (done) in `plan.md`.
5.  **Phase Verification**: If a phase is complete, follow the "Phase Completion Verification" protocol in `workflow.md`.
6.  **Loop**: Repeat for next tasks until blocked or execution limit reached.

## Templates location
Templates are stored in `.gemini/skills/conductor/templates/`. Reading them is not necessary if they are already copied to `conductor/`.
