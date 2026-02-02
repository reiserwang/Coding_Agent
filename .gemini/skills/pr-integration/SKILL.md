---
name: pr-integration
description: Automates fetching, analyzing, validating, and merging GitHub Pull Requests using existing agents.
---

# PR Integration Skill

This skill orchestrates the process of integrating GitHub Pull Requests into the current branch. It uses the `extensions/pr-integration` tools to manage PRs and coordinates with the **Reviewer**, **Tester**, and **DevOps** agents for quality assurance.

## Workflow

1.  **List Open PRs**: Fetch the list of open PRs from the repository.
2.  **Iterate Through PRs**: For each PR, perform the following:
    a.  **Fetch & Checkout**: Checkout the PR branch.
    b.  **Analyze**: Use the **Reviewer** agent to analyze the changes.
    c.  **Validate**: Run automated tests using the **Tester** agent.
    d.  **Integrate**: If all checks pass, merge the PR into the target branch.
    e.  **Report**: Log the result of the integration attempt.

## Usage

To start the integration loop:

```
I'm using the pr-integration skill to integrate all open pull requests.
```

## Detailed Steps

### 1. Setup & Discovery

First, ensure you have the necessary tools loaded.
Load the `pr_manager` tool from extensions.

### 2. Processing Loop

For each PR found:

1.  **Checkout**: javascript
    ```python
    # Use the extension tool (conceptual)
    pr_manager.checkout_pr(pr_number)
    ```

2.  **Code Review**:
    Call the **Reviewer** agent:
    "Review the changes in the current branch against [target_branch]. Identify potential conflicts, security issues, and code quality problems."

3.  **Testing**:
    Call the **Tester** agent:
    "Run the project's test suite. Ensure all tests pass. If there are failures, provide a summary."

4.  **Decision**:
    - **IF** Review is positive **AND** Tests pass:
        - Merge the PR: `pr_manager.merge_pr(pr_number)`
        - Notify user: "PR #[number] integrated successfully."
    - **ELSE**:
        - Revert/Checkout main.
        - Notify user: "PR #[number] failed integration. Reasons: [Review/Test failures]."

### 3. Completion

After processing all PRs, provide a summary report of successful and failed integrations.
