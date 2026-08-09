# Graph Report - .  (2026-08-01)

## Corpus Check
- Corpus is ~4,673 words - fits in a single context window. You may not need a graph.

## Summary
- 42 nodes · 48 edges · 8 communities (6 shown, 2 thin omitted)
- Extraction: 81% EXTRACTED · 19% INFERRED · 0% AMBIGUOUS · INFERRED: 9 edges (avg confidence: 0.79)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Dotfiles & Package Mgmt
- Refactor Command Pipeline
- PR Workflow & Review
- Common Coding Standards
- Refactoring Principles
- Coding Standards Skill
- TypeScript Rules
- Test QA Command

## God Nodes (most connected - your core abstractions)
1. `Dotfiles Repository (chezmoi)` - 8 edges
2. `Common Coding Style Rules` - 8 edges
3. `Coding Standards Skill (coding-standards)` - 5 edges
4. `PR Review Fetch Skill (pr-review-fetch)` - 5 edges
5. `Package Manifest (packages.yaml)` - 4 edges
6. `Common Development Guidelines (AGENTS.md)` - 4 edges
7. `TypeScript/JavaScript Coding Style Rules` - 4 edges
8. `Refactoring Rules (Type Safety / SRP / Clean Code)` - 4 edges
9. `Commit Message Author Command` - 4 edges
10. `Phase B: Review Comment Validity Evaluation` - 3 edges

## Surprising Connections (you probably didn't know these)
- `Dotfiles Repository (chezmoi)` --cites--> `Common Coding Style Rules`  [EXTRACTED]
  README.md → home/dot_claude/rules/common/coding-style.md
- `Dotfiles Repository (chezmoi)` --cites--> `TypeScript/JavaScript Coding Style Rules`  [EXTRACTED]
  README.md → home/dot_claude/rules/typescript/coding-style.md
- `Dotfiles Repository (chezmoi)` --cites--> `Coding Standards Skill (coding-standards)`  [EXTRACTED]
  README.md → home/dot_claude/skills/coding-standards/SKILL.md
- `common/work/personal Package Categories` --shares_data_with--> `Package Manifest (packages.yaml)`  [INFERRED]
  README.md → home/.chezmoidata/packages.yaml
- `Development Environment Matrix (Windows/macOS)` --conceptually_related_to--> `Package Manifest (packages.yaml)`  [INFERRED]
  README.md → home/.chezmoidata/packages.yaml

## Hyperedges (group relationships)
- **PR-based Development Workflow** — home_agents, home_dot_claude_commands_pr_create_support, home_dot_claude_skills_pr_review_fetch_skill [INFERRED 0.85]
- **Coding Standards Corpus (rules + skill)** — home_dot_claude_rules_common_coding_style, home_dot_claude_rules_typescript_coding_style, home_dot_claude_skills_coding_standards_skill [INFERRED 0.85]
- **Coding Refactoring Rules** — home_dot_claude_commands_all_refactor_strict_type_safety, home_dot_claude_commands_all_refactor_srp_functional_design, home_dot_claude_commands_all_refactor_clean_code_principles [EXTRACTED 1.00]
- **Autonomous Refactor Workflow (Execute Sequentially)** — home_dot_claude_commands_all_refactor_refactor_execution, home_dot_claude_commands_all_refactor_testing_integrity, home_dot_claude_commands_all_refactor_git_pr_finalize [EXTRACTED 1.00]

## Communities (8 total, 2 thin omitted)

### Community 0 - "Dotfiles & Package Mgmt"
Cohesion: 0.25
Nodes (9): Package Manifest (packages.yaml), macOS Homebrew Packages (brews/casks), Windows WinGet Packages, Chezmoi init/update/diff Workflow, Claude Code Settings (sourced from everything-claude-code), Development Environment Matrix (Windows/macOS), Dotfiles Repository (chezmoi), Everything Claude Code repository (affaan-m) (+1 more)

### Community 1 - "Refactor Command Pipeline"
Cohesion: 0.31
Nodes (9): All-Refactor Autonomous Command, GitHub CLI (gh), Git Commit and PR Creation Step, Refactor Execution Step, Test Integrity Step (Regression / Coverage / Verification), Commit Message Author Command, Conventional Commit Prefixes (fix, feat, refactor, ...), Commit Message Format Rules (Present Tense, Japanese, ≤74 chars) (+1 more)

### Community 2 - "PR Workflow & Review"
Cohesion: 0.36
Nodes (8): Common Development Guidelines (AGENTS.md), Conventional Commits Convention (Japanese), Self-Directed Autonomous Work Style, PR Creation Support Command, Phase A: Fetch PR Review Comments, Phase B: Review Comment Validity Evaluation, Phase C: Code Fix and Reply Drafting, PR Review Fetch Skill (pr-review-fetch)

### Community 3 - "Common Coding Standards"
Cohesion: 0.33
Nodes (6): Refactor Proposal Command, Common Coding Style Rules, Comprehensive Error Handling, Small Files, High Cohesion Low Coupling, Immutability Principle, Input Validation at System Boundaries

### Community 4 - "Refactoring Principles"
Cohesion: 0.50
Nodes (4): Clean Code Principles (Guard Clauses, Constants), Refactoring Rules (Type Safety / SRP / Clean Code), SRP and Functional Programming Principle, Strict Type Safety Principle

### Community 5 - "Coding Standards Skill"
Cohesion: 0.67
Nodes (3): Readability / KISS / DRY / YAGNI Principles, React Best Practices, Coding Standards Skill (coding-standards)

## Knowledge Gaps
- **17 isolated node(s):** `Chezmoi init/update/diff Workflow`, `Claude Code Settings (sourced from everything-claude-code)`, `Everything Claude Code repository (affaan-m)`, `macOS Homebrew Packages (brews/casks)`, `Windows WinGet Packages` (+12 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **2 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Dotfiles Repository (chezmoi)` connect `Dotfiles & Package Mgmt` to `Common Coding Standards`, `Coding Standards Skill`, `TypeScript Rules`?**
  _High betweenness centrality (0.130) - this node is a cross-community bridge._
- **Why does `Common Coding Style Rules` connect `Common Coding Standards` to `Dotfiles & Package Mgmt`, `Coding Standards Skill`, `TypeScript Rules`?**
  _High betweenness centrality (0.098) - this node is a cross-community bridge._
- **Why does `All-Refactor Autonomous Command` connect `Refactor Command Pipeline` to `Refactoring Principles`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `Common Coding Style Rules` (e.g. with `Refactor Proposal Command` and `Coding Standards Skill (coding-standards)`) actually correct?**
  _`Common Coding Style Rules` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `Coding Standards Skill (coding-standards)` (e.g. with `Common Coding Style Rules` and `TypeScript/JavaScript Coding Style Rules`) actually correct?**
  _`Coding Standards Skill (coding-standards)` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `Package Manifest (packages.yaml)` (e.g. with `Development Environment Matrix (Windows/macOS)` and `common/work/personal Package Categories`) actually correct?**
  _`Package Manifest (packages.yaml)` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Chezmoi init/update/diff Workflow`, `Claude Code Settings (sourced from everything-claude-code)`, `Everything Claude Code repository (affaan-m)` to the rest of the system?**
  _17 weakly-connected nodes found - possible documentation gaps or missing edges._