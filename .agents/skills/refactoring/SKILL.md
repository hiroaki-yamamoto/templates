---
name: refactoring
description: |
  The rule of refactoring code. Follow this rule when you are asked
  to refactor code.
---

# Rules

- Remove unnecessary import statements.
- Remove unnecessary dependencies.
- If reflection is used in the code and a non-reflection implementation is
  possible, replace it with an implementation that does not use reflection.
- Profile performance, and if an algorithm with lower time and space complexity
  exists, replace it with that algorithm. However, if there is a trade-off
  between time complexity and space complexity, follow these rules:
  - If space complexity is a critical issue, prioritize space complexity.
  - If space complexity is **not** a critical issue, prioritize time complexity.
