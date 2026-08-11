# CLAUDE.md — bob-plugins

Project-specific guidance for Claude Code in this repository.


## 🟠 Задачи BOB — ведутся в bob.tools (не в локальном `tasks/`)

Все задачи проектов BOB ведутся ЦЕНТРАЛЬНО в bob.tools — таблица **«✅ задачи»**,
fileId `82d3f7b3-8515-4dde-bc68-979abf2536b6` (компания «BOB tools»).
Открыть: https://betta.bob.tools/#/data:82d3f7b3-8515-4dde-bc68-979abf2536b6

**Задачи ИМЕННО этого репо** = поле **`repo`** = **`bob-plugins`**.
(своих задач у репо пока нет — заводи с этим значением `repo`)
⚠️ Поле `progect` удалено 03.08.2026 — фильтровать **только** по `repo`.

Данные ключуются по **fieldId**, не по заголовку поля (заголовок → ошибка):

| поле | fieldId |
|---|---|
| name | `9cf5a909-ae64-4d9d-9744-20201bb504fd` |
| discription | `2b253ff5-9007-4784-a1c2-87ffa60e7248` |
| priority | `667f1965-4522-47bc-a041-e723cbd60b5f` — `🚨` / `⚠️` / `📍` / `✅` |
| status | `field_e663212b-989c-40d2-a208-b82ba0992759` |
| repo | `field_c63f1ed8-e383-46d1-867e-f409bb7f907a` |

Статусы: `open` · `in_progress` · `test` · `blocked` · `done`
(**`test`** = код залит и зелёный, ждёт ручной проверки Ивана).

🔴 **Веди статус ПО ХОДУ работы, а не только в конце.** `in_progress` — сразу как
взялся за задачу, `test`/`done` — на финише. Прогресс дописывай в `discription`
датированными заметками, чтобы другой агент мог подхватить с нуля.

Рецепты (MCP-сервер `bob-tools`):
- Открытые задачи репо: `bob_records` action=`list`, fileId=`82d3f7b3-8515-4dde-bc68-979abf2536b6`,
  filters=`[{"fieldId":"field_c63f1ed8-e383-46d1-867e-f409bb7f907a","type":"equals","value":"bob-plugins"},{"fieldId":"field_e663212b-989c-40d2-a208-b82ba0992759","type":"equals","value":"open"}]`
- Сменить статус: `bob_records` action=`update`, recordId=…,
  data=`{"field_e663212b-989c-40d2-a208-b82ba0992759":"in_progress"}`
- Новая задача: `bob_records` action=`update`, createIfNotFound=true,
  fileId=`82d3f7b3-8515-4dde-bc68-979abf2536b6`, data с fieldId полей
  name / discription / priority / status / repo=`bob-plugins`

Локальные `tasks/<id>-*.md` больше не заводить — старые файлы исторические.
Не реинтродьюсить beads/`bd`/dolt.

## Task Tracking (plan-first) — УСТАРЕЛО, см. «🟠 Задачи BOB» выше

**Источник истины — таблица «✅ задачи» в bob.tools, а НЕ локальный `tasks/`.** Раздел ниже
оставлен как описание исторического формата существующих файлов; новые не заводить.

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
