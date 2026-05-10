---
name: jsts-doc
description: |
  Documentation Rules for Javascript and Typescript.
  You must follow this rule when generating documentation for typescript code in addition to [general documentation rule](/.agents/skills/doc/SKILL.md).
---

## Rules

When we use Javascript or Typescript programming language, we need to follow this rule in addition to `Code Documentation Rules` and follow the JSDoc standard (https://jsdoc.app/).

- **Use Block Comments (`/** ... */`)**: All JSDoc comments must begin with `/**` and end with `*/`. Regular comments (`//` or `/* ... */`) are not recognized.
- **Document All Exported Members**: Ensure every exported function, class, type, interface, and variable has a JSDoc comment.
- **Describe the Purpose**: The top of the JSDoc comment should clearly describe the functionality or purpose.
- **Use `@param` for Parameters**: Document all function parameters using the `@param` tag. Specify the type in curly braces `{}` and provide a brief description (e.g., `@param {string} name - The user's name`).
- **Use `@returns` for Return Values**: Document the return value using the `@returns` tag. Specify the return type and describe what is returned.
- **Include `@example`**: Provide usage examples whenever possible using the `@example` tag followed by a code snippet.
- **Use `@typedef` and `@property` for Custom Types**: When writing plain Javascript, define custom types using `@typedef` and describe their properties with `@property`.
- **Use `@throws` for Errors**: Document any exceptions that a function might throw using the `@throws` tag.
- **Use `@deprecated` for Obsolete Code**: Mark outdated code with the `@deprecated` tag and suggest an alternative.
