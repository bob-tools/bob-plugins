# CLAUDE.md — bob-plugins

Project-specific guidance for Claude Code in this repository.


## Task Tracking (plan-first)

Tasks are tracked as **plain markdown** in this project's `tasks/` folder — one file per task
(`tasks/<id>-<slug>.md`), with `tasks/INDEX.md` as the overview and `tasks/README.md` describing
the format. `tasks/` is **git-ignored**. This replaced the old **beads**/`bd`/dolt setup, which was
removed — do **not** reintroduce `bd`/dolt, and don't track real tasks in ephemeral TODO lists.

**Rule — write the plan and status into the task file BEFORE implementing.** For any non-trivial task:
1. Open (or create) `tasks/<id>-*.md` and fill its `## Plan & Progress` checklist with the steps you
   intend to take **first**, before writing any code.
2. Set `status: in_progress` in the frontmatter and add a dated `### Status log` entry when you start.
3. Implement — tick items off and append to the status log as you go.
4. On completion set `status: done` and keep `tasks/INDEX.md` in sync.
