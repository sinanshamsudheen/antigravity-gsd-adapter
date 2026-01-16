# Using Get-Shit-Done with Antigravity: PRD → Deployment

## Quick Reference: Complete Workflow

```
PRD.md
  ↓
1. define-requirements.md    → .planning/REQUIREMENTS.md
  ↓
2. discovery-phase.md        → .planning/PROJECT.md
  ↓
3. create-roadmap.md         → .planning/ROADMAP.md + phases/
  ↓
4. plan-phase.md             → .planning/phases/01-xxx/plans/
  ↓
5. execute-plan.md           → Implement + test
  ↓
6. verify-phase.md           → Quality gates
  ↓
7. transition.md             → Move to next phase
  ↓
Repeat 4-7 for each phase
  ↓
8. complete-milestone.md     → Ship it!
```

---

## Step-by-Step Guide

### 🎯 Starting Point: You Have PRD.md

You have a Product Requirements Document. Great! Let's turn that into a structured, executable project.

### 📋 Step 1: Extract Requirements

**Goal:** Convert your PRD into structured, testable requirements.

**How to use with Antigravity:**
```
Prompt:
"I have a PRD.md file at <path>. Can you help me use the 
@[define-requirements.md] workflow to create structured requirements?"
```

**What it does:**
- Reads your PRD.md
- Extracts concrete requirements
- Assigns unique IDs (AUTH-01, FEAT-02, etc.)
- Categorizes by functional area
- Marks priorities (v1 vs v2)
- Creates `.planning/REQUIREMENTS.md`

**Output:**
```
.planning/REQUIREMENTS.md
  - All requirements with IDs
  - Acceptance criteria for each
  - Priority levels
  - Categories
```

---

### 🏗️ Step 2: Create Project Brief

**Goal:** Document high-level context and constraints.

**How to use with Antigravity:**
```
Prompt:
"Now let's create the project brief using @[discovery-phase.md]"
```

**What it does:**
- Asks clarifying questions about:
  - Tech stack
  - Constraints
  - Success metrics
  - Timeline
- Creates structured project documentation
- Documents key decisions

**Output:**
```
.planning/PROJECT.md
  - One-liner summary
  - Core value proposition
  - Technical approach
  - Constraints & assumptions
  - Key decisions
```

---

### 🗺️ Step 3: Build Roadmap (Break Into Phases)

**Goal:** Organize requirements into coherent delivery phases.

**How to use with Antigravity:**
```
Prompt:
"Let's create a roadmap from my requirements using @[create-roadmap.md]"
```

**What it does:**
- Groups requirements by natural boundaries
- Creates sequential phases
- Maps every requirement to exactly one phase
- Defines success criteria per phase
- Creates phase directories

**Output:**
```
.planning/ROADMAP.md
  - Phase 1: Foundation (REQ-01, REQ-02, REQ-03)
  - Phase 2: Core Features (REQ-04, REQ-05)
  - Phase 3: Polish (REQ-06)
  
.planning/phases/
  ├── 01-foundation/
  ├── 02-core-features/
  └── 03-polish/
```

**Example Roadmap:**
```markdown
# Roadmap

## Phase 1: Foundation
**Goal:** Project scaffolding and core infrastructure
**Requirements:** SETUP-01, SETUP-02, DB-01
**Success Criteria:**
  - Project builds without errors
  - Dev server runs locally
  - Database connected and seeded

## Phase 2: Authentication  
**Goal:** Secure user access
**Requirements:** AUTH-01, AUTH-02, AUTH-03
**Success Criteria:**
  - Users can sign up
  - Users can log in/out
  - Sessions persist
```

---

### 📝 Step 4: Plan First Phase

**Goal:** Create detailed, executable plans for the phase.

**How to use with Antigravity:**
```
Prompt:
"Let's plan Phase 1 using @[plan-phase.md]"
```

**What it does:**
- Breaks phase into concrete plans
- Each plan = 1-2 hours of focused work
- Defines inputs, outputs, must-haves
- Creates task checklist
- Sets up verification criteria

**Output:**
```
.planning/phases/01-foundation/
  └── plans/
      ├── 01-project-setup.md
      ├── 02-database-schema.md
      └── 03-api-scaffold.md
```

**Example Plan:**
```markdown
# Plan 01: Project Setup

## Goal
Initialize Next.js project with TypeScript and Tailwind

## Inputs
- package.json requirements from PROJECT.md
- Tech stack decision

## Must-Haves
- [ ] Next.js 14 initialized
- [ ] TypeScript configured
- [ ] Tailwind CSS working
- [ ] Dev server runs on port 3000

## Verification
- Run `npm run dev`
- Visit localhost:3000
- See default page
```

---

### ⚡ Step 5: Execute Plans

**Goal:** Implement the planned work with testing.

**How to use with Antigravity:**
```
Prompt:
"Execute plan 01-project-setup using @[execute-plan.md]"
```

**What it does:**
- Reads the plan
- Implements each must-have
- Runs verification steps
- Commits work with meaningful messages
- Updates STATE.md progress

**Output:**
- Working code
- Tests passing
- Git commits
- Updated progress tracking

**Flow:**
1. AI reads plan
2. AI implements requirements
3. AI runs tests/verification
4. AI commits: `feat: project setup complete`
5. AI updates STATE.md

---

### ✅ Step 6: Verify Phase

**Goal:** Ensure phase meets all success criteria before moving on.

**How to use with Antigravity:**
```
Prompt:
"Verify Phase 1 is complete using @[verify-phase.md]"
```

**What it does:**
- Checks all phase success criteria
- Runs comprehensive tests
- Reviews code quality
- Creates verification report
- Gates progress (must pass to continue)

**Output:**
```
.planning/phases/01-foundation/
  └── VERIFICATION-REPORT.md
      - All success criteria ✓
      - Test results
      - Known issues (if any)
      - Ready for next phase: YES/NO
```

---

### 🔄 Step 7: Transition to Next Phase

**Goal:** Move to Phase 2 with clean slate.

**How to use with Antigravity:**
```
Prompt:
"Transition to Phase 2 using @[transition.md]"
```

**What it does:**
- Updates ROADMAP.md status
- Updates STATE.md current position
- Creates git commit for phase completion
- Sets up next phase context

**Then repeat steps 4-7 for each phase!**

---

### 🚀 Step 8: Complete Milestone & Deploy

**Goal:** Ship your v1.0!

**How to use with Antigravity:**
```
Prompt:
"Complete the v1.0 milestone using @[complete-milestone.md]"
```

**What it does:**
- Final verification across all phases
- Creates comprehensive documentation
- Generates deployment checklist
- Creates release notes
- Tags release in git

---

## 🎛️ Optional Workflows

### Research Unknown Territory
**When:** You're unsure how to implement something
```
Prompt: "Research authentication patterns for @[research-phase.md]"
```

### Debug Issues
**When:** Something's not working
```
Prompt: "Debug login failure using @[debug.md]"
```

### Resume After Break
**When:** Coming back to project
```
Prompt: "Resume project using @[resume-project.md]"
```

### Map Existing Code
**When:** Working with existing codebase
```
Prompt: "Map the authentication system with @[map-codebase.md]"
```

---

## 💡 Example: Full Project Flow

### Initial State
```
my-app/
  └── PRD.md  (your product requirements doc)
```

### After Requirements
```
Prompt: "Extract requirements from PRD.md using @[define-requirements.md]"

my-app/
  ├── PRD.md
  └── .planning/
      └── REQUIREMENTS.md  (20 requirements, categorized)
```

### After Discovery
```
Prompt: "Create project brief with @[discovery-phase.md]"

my-app/
  ├── PRD.md
  └── .planning/
      ├── REQUIREMENTS.md
      └── PROJECT.md  (tech stack, constraints, decisions)
```

### After Roadmap
```
Prompt: "Build roadmap using @[create-roadmap.md]"

my-app/
  ├── PRD.md
  └── .planning/
      ├── REQUIREMENTS.md
      ├── PROJECT.md
      ├── ROADMAP.md  (4 phases defined)
      ├── STATE.md    (progress tracking)
      └── phases/
          ├── 01-foundation/
          ├── 02-auth/
          ├── 03-features/
          └── 04-polish/
```

### After Planning Phase 1
```
Prompt: "Plan Phase 1 with @[plan-phase.md]"

.planning/phases/01-foundation/
  └── plans/
      ├── 01-setup.md
      ├── 02-db-schema.md
      └── 03-api-scaffold.md
```

### After Executing Plans
```
Prompt: "Execute 01-setup plan with @[execute-plan.md]"
Prompt: "Execute 02-db-schema with @[execute-plan.md]"
Prompt: "Execute 03-api-scaffold with @[execute-plan.md]"

my-app/
  ├── src/          (actual code!)
  ├── tests/
  ├── package.json
  └── .planning/... (updated progress)
```

### After Phase Verification
```
Prompt: "Verify Phase 1 with @[verify-phase.md]"

.planning/phases/01-foundation/
  ├── plans/
  └── VERIFICATION-REPORT.md ✓
```

### Rinse & Repeat
```
Prompt: "Transition to Phase 2 with @[transition.md]"
Prompt: "Plan Phase 2 with @[plan-phase.md]"
... (execute → verify → transition)
```

---

## 🎯 Pro Tips

### 1. Start Small
Your first roadmap doesn't need 10 phases. Start with 3-4 core phases.

### 2. Use Depth Settings
Edit `.planning/config.json`:
- `"depth": "quick"` → Fast, high-level (3-5 phases)
- `"depth": "standard"` → Balanced (5-8 phases)
- `"depth": "comprehensive"` → Detailed (8-12 phases)

### 3. Mode Settings
- `"mode": "interactive"` → AI asks for confirmation
- `"mode": "yolo"` → AI auto-proceeds (faster, less control)

### 4. Reference Workflows Directly
Antigravity can read the workflow files:
```
"Use @[create-roadmap.md] to build my roadmap"
```

### 5. Git Integration
Every workflow commits progress automatically. Your git history becomes your project timeline.

---

## 📂 Final Directory Structure

```
my-app/
├── src/                    # Your actual code
├── tests/                  # Your tests
├── .planning/              # GSD artifacts
│   ├── PROJECT.md          # Project brief
│   ├── REQUIREMENTS.md     # All requirements
│   ├── ROADMAP.md          # Phase breakdown
│   ├── STATE.md            # Current progress
│   ├── config.json         # GSD configuration
│   └── phases/
│       ├── 01-foundation/
│       │   ├── plans/
│       │   │   ├── 01-setup.md
│       │   │   └── 02-db-schema.md
│       │   └── VERIFICATION-REPORT.md
│       ├── 02-auth/
│       └── 03-features/
└── .agent/                 # Antigravity workflows
    └── workflows/          # Symlinked GSD workflows
```

---

## 🚨 Common Questions

### Q: Do I need to create PRD.md first?
A: No! You can start with just an idea and use `discovery-phase.md` to extract requirements through conversation.

### Q: Can I modify the workflows?
A: Yes! Create project-specific overrides in `.agent/workflows/` that take precedence over global ones.

### Q: What if I need to add requirements mid-project?
A: Update REQUIREMENTS.md and use `create-roadmap.md` to re-plan. GSD continues from your current phase.

### Q: Can I skip planning and just code?
A: You can, but GSD's power is in structure. Even minimal planning (quick mode) prevents scope creep and forgotten requirements.

---

## 🎬 Ready to Start?

1. ✅ GSD is installed at `~/.agent/get-shit-done/`
2. ✅ Workflows are linked in `.agent/workflows/`
3. ✅ You have this guide

**Next step:**
```
Prompt to Antigravity:
"I have a PRD for <your-project>. Let's use @[define-requirements.md] 
to extract structured requirements and begin."
```

🚀 **Let's get shit done!**
