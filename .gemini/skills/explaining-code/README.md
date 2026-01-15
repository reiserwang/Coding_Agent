# Explaining Code Skill

Explains code with visual diagrams and analogies for better understanding.

## Quick Start

Reference this skill when explaining code:

```bash
"Explain how this function works using the explaining-code skill"
```

## When to Use

- Explaining how code works
- Teaching about a codebase
- When the user asks "how does this work?"
- Breaking down complex concepts

## Explanation Approach

| Step | Description |
|------|-------------|
| **1. Analogy** | Compare the code to something from everyday life |
| **2. Diagram** | Use ASCII art to show flow, structure, or relationships |
| **3. Walkthrough** | Explain step-by-step what happens |
| **4. Gotcha** | Highlight common mistakes or misconceptions |

## Example

When explaining a recursive function:

1. **Analogy**: "It's like Russian nesting dolls - each doll opens to reveal a smaller one until you reach the smallest"
2. **Diagram**:
   ```
   factorial(3)
      └── 3 * factorial(2)
              └── 2 * factorial(1)
                      └── 1 (base case)
   ```
3. **Walkthrough**: Step through each recursive call
4. **Gotcha**: "Forgetting the base case causes infinite recursion"

## Philosophy

Keep explanations conversational. For complex concepts, use multiple analogies to build understanding from different angles.
