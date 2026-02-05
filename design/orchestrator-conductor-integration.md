# Brainstorming: Orchestrator & Conductor Integration

## Context
We have an `orchestrator` agent (Technical Lead) and a new `conductor` skill (Project Orchestration Methodology).
**Conflict**: Both attempt to manage the SDLC, tracking planning, execution, and verification.
**Goal**: Resolve overlaps and create a seamless process.

## Option 1: The "Conductor-Powered" Orchestrator (Recommended)
The Orchestrator agent adopts the Conductor skill as its primary operating system for Feature/Bug tracks.

*   **Role**: Orchestrator remains the decision maker.
*   **Method**: Orchestrator explicitly calls `conductor:setup`, `conductor:newTrack`, and `conductor:implement` instead of generic delegation.
*   **Delegation Changes**:
    *   Instead of "Assign to Planner", Orchestrator runs `conductor:newTrack` (which *uses* the Planner's capabilities to fill `spec.md`).
    *   Instead of "Assign to Coder", Orchestrator runs `conductor:implement` (which *uses* the Coder's capabilities to execute `plan.md`).
*   **Pros**: Leverages existing Agent persona; standardizes artifacts (`conductor/tracks/`); removes "where is the plan?" ambiguity.
*   **Cons**: Requires rewriting `orchestrator/AGENT.md` to be Conductor-specific.

## Option 2: The "Conductor Agent" Replacement
We deprecate the `orchestrator` agent and create a `conductor` agent.

*   **Role**: The "Conductor Agent" is the strict enforcer of the Conductor workflow.
*   **Method**: It only knows Conductor commands.
*   **Pros**: Implementation is purer; less "persona" overhead.
*   **Cons**: Loses the flexibility of the Orchestrator (e.g., handling "fix this typo" which might be overkill for a full Track). The Orchestrator handles "hot paths" well; Conductor is heavy.

## Option 3: Parallel Systems (Status Quo)
Orchestrator uses `docs/plans/` for ad-hoc stuff, uses `Conductor` for "Big Features".

*   **Pros**: No immediate changes needed.
*   **Cons**: Fragmented memory. Confusion on where to look for status. Two different ways to do TDD.

## Recommendation: Option 1
We should upgrade the `orchestrator/AGENT.md` to integrate Conductor.

### Conflict Analysis: Path Selection Criteria

| Criteria | **Hot Path** (Direct Delegation) | **Feature Path** (Conductor Track) |
| :--- | :--- | :--- |
| **Complexity** | Low: Single-purpose, clear scope. | High: Multi-phase, complex logic. |
| **Scope** | Typically 1-2 files or documentation. | Multi-file, architectural, or UI/UX. |
| **Risk** | Low: Minimal impact if reverted. | High: Affects core functionality or UX. |
| **Requirements** | Implicit or provided in prompt. | Explicit: Requires `spec.md` sign-off. |
| **Verification** | Simple: "Does it look right?" | Formal: Automated tests + manual protocol. |
| **Examples** | Typos, dependency updates, env config. | New features, refactors, complex bug fixes. |

*Rule of Thumb:* Use a Track if the implementation requires more than 3 distinct tasks or if requirements are non-trivial.

### Integration Mechanics (SCRATCHPAD.md)

The Orchestrator uses `SCRATCHPAD.md` to bridge its persona with the Conductor's structured output:

1.  **Active Track Tracking:** The Orchestrator MUST record the current `Track ID` and `Track Folder` in the "Context" section of `SCRATCHPAD.md`.
2.  **State Alignment:** The "Next Steps" in `SCRATCHPAD.md` must mirror the next incomplete task in the track's `plan.md`.
3.  **Agent Awareness:** The "Active Agents" table should reflect which sub-agent is implementing the current track task.
