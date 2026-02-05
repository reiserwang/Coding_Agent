# Specification: Orchestrator-Conductor Integration & Rollout

## 1. Overview
This track aims to finalize the integration strategy between the `orchestrator` agent and the `conductor` skill. We will first validate the "Option 1: Conductor-Powered Orchestrator" design proposed in `design/orchestrator-conductor-integration.md`, focusing on conflict resolution and integration mechanics. Following validation, we will execute a full migration to this model across the system.

## 2. Goals
1.  **Validate Design:** Re-evaluate `design/orchestrator-conductor-integration.md` to ensure "Option 1" handles edge cases (hotfixes vs. tracks) and offers a solid UX.
2.  **Full Implementation:** Update the Orchestrator agent, global memory (`GEMINI.md`, `CLAUDE.md`), and documentation to fully adopt the validated model.
3.  **Verification:** Prove the system works for both "Hot Paths" (quick fixes) and "Feature Paths" (Conductor tracks).

## 3. Requirements

### Phase 1: Design Re-evaluation
*   **Conflict Analysis:** Analyze potential overlaps between `conductor` commands and standard `orchestrator` delegations.
    *   *Focus:* Edge cases like hotfixes, experimental tasks, and "quick" requests.
*   **Integration Check:** Verify the technical feasibility of the Orchestrator invoking `conductor:newTrack` and `conductor:implement`.
*   **Deliverable:** An updated `design/orchestrator-conductor-integration.md` reflecting the final, refined decision.

### Phase 2: Full Rollout (Implementation)
*   **Orchestrator Update:** Finalize `agent/orchestrator/AGENT.md` (v8.0 or newer) based on Phase 1 findings.
*   **Global Memory Update:** Update `GEMINI.md` and `CLAUDE.md` to explicitly define the new Orchestrator protocol (e.g., "Always use Conductor for Features").
*   **Documentation:** Update `README.md` to reflect the new standard workflow.

### Phase 3: Verification
*   **Simulation:**
    *   Simulate a "Hot Path" request (e.g., "Fix a typo") to ensure Orchestrator delegates directly.
    *   Simulate a "Feature Path" request (e.g., "Add a login page") to ensure Orchestrator uses `conductor:newTrack`.

## 4. Acceptance Criteria
- [ ] `design/orchestrator-conductor-integration.md` is updated and approved.
- [ ] `agent/orchestrator/AGENT.md` correctly implements the agreed design.
- [ ] `GEMINI.md` and `CLAUDE.md` contain the correct agent registry and protocols.
- [ ] `README.md` accurately describes the new workflow.
- [ ] Orchestrator correctly distinguishes between simple tasks and Conductor tracks during simulation.
