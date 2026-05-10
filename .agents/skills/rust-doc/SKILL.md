---
name: rust-doc
description: |
  Documentation Rules for rust code.
  You must follow this rule when generating documentation for rust code in addition to [general documentation rule](/.agents/skills/doc/SKILL.md).
---

## Rules

When we use Rust programming language, we need to follow this rule in addition to
`Code Documentation Rules`

- **DO NOT use `ignore` in the example code** unless the example is
  intended to be wrong code that demonstrates a common mistake or a pitfall.
- **DO NOT use `no_run` in the example code** unless the example is intended to be
  a code snippet that cannot be run in a test environment (e.g., it requires
  external system resources that are not available in the test environment).
- Follow standard Rustdoc conventions for sections. Use `# Examples`,
  `# Panics`, `# Errors`, and `# Safety` headings where applicable.
- Use intra-doc links (e.g., `[`struct_name`]`,
  `[`crate::module::Function`]`) when referencing other items in the library.
- While examples must be complete and runnable, use the `# ` prefix to hide
  boilerplate code (such as `fn main() { ... }` or non-essential `use`
  statements) to keep the documentation concise and focused on the usage.
- When updating an existing item, output the complete item code along with the
  updated `///` comments to provide clear context.
