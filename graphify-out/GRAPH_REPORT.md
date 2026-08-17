# Graph Report - chezmoi  (2026-08-18)

## Corpus Check
- 18 files · ~18,432 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 112 nodes · 149 edges · 13 communities (9 shown, 4 thin omitted)
- Extraction: 62% EXTRACTED · 37% INFERRED · 1% AMBIGUOUS · INFERRED: 55 edges (avg confidence: 0.87)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Graphify Skill Ecosystem
- Package Install & Bootstrap
- Coding Style & Refactor Rules
- Tool Runtime Config (herdr/mise/starship)
- OpenCode Agent Config
- PR Review Workflow
- Mise Config Matrix
- Refactor & Commit Workflow
- Package Management
- Mise Tools (macOS Work)
- Mise Tools (Windows Work)
- Starship Windows Symbols
- QA & Test Coverage

## God Nodes (most connected - your core abstractions)
1. `Graphify Skill` - 20 edges
2. `Common Coding Style Rules` - 8 edges
3. `Dotfiles Repository (chezmoi)` - 8 edges
4. `Chezmoi Init Prompt Template` - 8 edges
5. `Mise Config Dispatcher (OS x role)` - 7 edges
6. `OpenCode Config Dispatcher (OS x role)` - 6 edges
7. `PR Review Fetch Skill (pr-review-fetch)` - 5 edges
8. `Coding Standards Skill (coding-standards)` - 5 edges
9. `AGENTS.md Graphify Rules` - 5 edges
10. `Machine Role Data (work/personal)` - 5 edges

## Surprising Connections (you probably didn't know these)
- `Mise Tasks: macOS Personal (brew-based)` --conceptually_related_to--> `Chezmoi Init Prompt Template`  [INFERRED]
  home/.chezmoitemplates/mise/darwin/mise-darwin-personal.tmpl → .chezmoi.toml.tmpl
- `Mise Tasks: macOS Work (brew-based)` --conceptually_related_to--> `Chezmoi Init Prompt Template`  [INFERRED]
  home/.chezmoitemplates/mise/darwin/mise-darwin-work.tmpl → .chezmoi.toml.tmpl
- `Mise Tasks: Linux Personal (apt-based)` --conceptually_related_to--> `Chezmoi Init Prompt Template`  [INFERRED]
  home/.chezmoitemplates/mise/linux/mise-linux-personal.tmpl → .chezmoi.toml.tmpl
- `Mise Tasks: Linux Work (apt-based)` --conceptually_related_to--> `Chezmoi Init Prompt Template`  [INFERRED]
  home/.chezmoitemplates/mise/linux/mise-linux-work.tmpl → .chezmoi.toml.tmpl
- `Mise Tasks: Windows Work (winget/PowerShell)` --conceptually_related_to--> `Chezmoi Init Prompt Template`  [INFERRED]
  home/.chezmoitemplates/mise/windows/mise-windows-work.tmpl → .chezmoi.toml.tmpl

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Mise OS x Role Template Matrix** — home_chezmoitemplates_mise_darwin_mise_darwin_personal, home_chezmoitemplates_mise_darwin_mise_darwin_work, home_chezmoitemplates_mise_linux_mise_linux_personal, home_chezmoitemplates_mise_linux_mise_linux_work, home_chezmoitemplates_mise_windows_mise_windows_personal, home_chezmoitemplates_mise_windows_mise_windows_work [EXTRACTED 1.00]
- **Cross-OS Package Install/Update Flow (brew, winget, mise tasks)** — home_chezmoiscripts_run_onchange_before_pre_darwin_install_packages_sh_homebrew_bootstrap, home_chezmoiscripts_run_onchange_before_pre_darwin_install_packages_sh_brew_bundle_common, home_chezmoiscripts_run_onchange_before_pre_darwin_install_packages_sh_brew_bundle_role, home_chezmoiscripts_run_onchange_windows_install_packages_ps1_winget_bootstrap, home_chezmoiscripts_run_onchange_windows_install_packages_ps1_winget_common, home_chezmoiscripts_run_onchange_windows_install_packages_ps1_winget_role, home_chezmoitemplates_mise_darwin_mise_darwin_personal_tasks, home_chezmoitemplates_mise_windows_mise_windows_personal_tasks [INFERRED 0.85]
- **Chezmoi OS x Role Template Dispatch Layer** — chezmoi_toml_machine_role, home_dot_config_mise_config_toml, home_dot_config_opencode_opencode_json, home_dot_config_starship_toml [INFERRED 0.85]
- **Graphify Build Pipeline** — _agents_skills_graphify_skill_pipeline, _agents_skills_graphify_skill_ast_extraction, _agents_skills_graphify_skill_semantic_extraction, _agents_skills_graphify_skill_community_labeling, _agents_skills_graphify_skill_healthcheck, _agents_skills_graphify_skill_manifest [EXTRACTED 1.00]
- **Corpus Ingestion Flows** — _agents_skills_graphify_references_add_watch_add_watch, _agents_skills_graphify_references_transcribe_transcribe, _agents_skills_graphify_references_github_and_merge_github_merge [INFERRED 0.75]
- **Coding Standards Corpus (rules + skill)** — home_dot_claude_rules_common_coding_style, home_dot_claude_rules_typescript_coding_style, home_dot_claude_skills_coding_standards_skill [INFERRED 0.85]
- **Graph Maintenance Flows** — _agents_skills_graphify_references_update_incremental_update, _agents_skills_graphify_references_update_cluster_only, _agents_skills_graphify_references_hooks_commit_hook, agents_graphify_rules, _agents_skills_graphify_skill_manifest [INFERRED 0.85]
- **PR-based Development Workflow** — home_agents, home_dot_claude_commands_pr_create_support, home_dot_claude_skills_pr_review_fetch_skill [INFERRED 0.85]

## Communities (13 total, 4 thin omitted)

### Community 0 - "Graphify Skill Ecosystem"
Cohesion: 0.10
Nodes (26): Add URL & Watch Folder, Extra Exports & Benchmark, MCP Server, Confidence Rubric, Extraction Subagent Spec, Node ID Convention, GitHub Clone & Cross-Repo Merge, AGENTS.md Integration (+18 more)

### Community 1 - "Package Install & Bootstrap"
Cohesion: 0.14
Nodes (21): Chezmoi Init Prompt Template, Git Identity Data (email/name), Machine Role Data (work/personal), Common Homebrew Bundle (brews+casks), Role-specific Homebrew Bundle (work/personal), Homebrew Bootstrap Script, WinGet Bootstrap (App Installer), Common WinGet Packages Install (+13 more)

### Community 2 - "Coding Style & Refactor Rules"
Cohesion: 0.14
Nodes (17): Refactor Proposal Command, Common Coding Style Rules, Comprehensive Error Handling, Small Files, High Cohesion Low Coupling, Immutability Principle, Input Validation at System Boundaries, TypeScript/JavaScript Coding Style Rules, Avoid any / Use unknown (+9 more)

### Community 3 - "Tool Runtime Config (herdr/mise/starship)"
Cohesion: 0.21
Nodes (13): herdr Integration Installs (claude/cursor/codex), herdr Plugin Install (smarzban/herdr-file-viewer), Mise Tools: macOS Personal, herdr CLI Tool (mise-managed on Linux), Mise Tools: Linux Personal, Mise Tools: Linux Work, Mise Tools: Windows Personal, Starship Prompt: macOS (+5 more)

### Community 4 - "OpenCode Agent Config"
Cohesion: 0.42
Nodes (9): OpenCode Config: Linux Personal, Build Agent (DeepSeek V4 Flash, full tools), Chat Agent (GLM 4.6, read-only tools), Agent Separation Design Pattern (chat vs build, tool-gated), LM Studio Provider (local OpenAI-compatible), OpenCode Config: Windows Personal, Build Agent (DeepSeek V4 Flash, full tools), Chat Agent (GLM 4.6, read-only tools) (+1 more)

### Community 5 - "PR Review Workflow"
Cohesion: 0.36
Nodes (8): Common Development Guidelines (AGENTS.md), Conventional Commits Convention (Japanese), Self-Directed Autonomous Work Style, PR Creation Support Command, Phase A: Fetch PR Review Comments, Phase B: Review Comment Validity Evaluation, Phase C: Code Fix and Reply Drafting, PR Review Fetch Skill (pr-review-fetch)

### Community 6 - "Mise Config Matrix"
Cohesion: 0.71
Nodes (7): Mise Config: macOS Personal, Mise Config: macOS Work, Mise Config: Linux Personal, Mise Config: Linux Work, Mise Config: Windows Personal, Mise Config: Windows Work, Mise Config Dispatcher (OS x role)

### Community 7 - "Refactor & Commit Workflow"
Cohesion: 0.67
Nodes (4): Refactor PR Workflow, All-Refactor Claude Command, Type-Safety Refactoring Rules, Commit Message Command

### Community 8 - "Package Management"
Cohesion: 1.00
Nodes (3): Darwin Packages (brews & casks), Package Matrix, Windows Packages (wingets)

## Ambiguous Edges - Review These
- `herdr Integration Installs (claude/cursor/codex)` → `herdr CLI Tool (mise-managed on Linux)`  [AMBIGUOUS]
  home/.chezmoiscripts/run_onchange_after_post-darwin-install-packages.sh.tmpl · relation: references
- `herdr Plugin Install (smarzban/herdr-file-viewer)` → `herdr CLI Tool (mise-managed on Linux)`  [AMBIGUOUS]
  home/.chezmoiscripts/run_onchange_after_post-darwin-install-packages.sh.tmpl · relation: references

## Knowledge Gaps
- **27 isolated node(s):** `Conventional Commits Convention (Japanese)`, `Self-Directed Autonomous Work Style`, `Test Coverage QA Command (90% target)`, `Comprehensive Error Handling`, `Small Files, High Cohesion Low Coupling` (+22 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `herdr Integration Installs (claude/cursor/codex)` and `herdr CLI Tool (mise-managed on Linux)`?**
  _Edge tagged AMBIGUOUS (relation: references) - confidence is low._
- **What is the exact relationship between `herdr Plugin Install (smarzban/herdr-file-viewer)` and `herdr CLI Tool (mise-managed on Linux)`?**
  _Edge tagged AMBIGUOUS (relation: references) - confidence is low._
- **Why does `Machine Role Data (work/personal)` connect `Package Install & Bootstrap` to `Tool Runtime Config (herdr/mise/starship)`, `Mise Config Matrix`?**
  _High betweenness centrality (0.124) - this node is a cross-community bridge._
- **Why does `OpenCode Config Dispatcher (OS x role)` connect `Tool Runtime Config (herdr/mise/starship)` to `Package Install & Bootstrap`, `OpenCode Agent Config`?**
  _High betweenness centrality (0.120) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `Common Coding Style Rules` (e.g. with `Refactor Proposal Command` and `Coding Standards Skill (coding-standards)`) actually correct?**
  _`Common Coding Style Rules` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 6 inferred relationships involving `Chezmoi Init Prompt Template` (e.g. with `Mise Tasks: macOS Personal (brew-based)` and `Mise Tasks: macOS Work (brew-based)`) actually correct?**
  _`Chezmoi Init Prompt Template` has 6 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Conventional Commits Convention (Japanese)`, `Self-Directed Autonomous Work Style`, `Test Coverage QA Command (90% target)` to the rest of the system?**
  _27 weakly-connected nodes found - possible documentation gaps or missing edges._