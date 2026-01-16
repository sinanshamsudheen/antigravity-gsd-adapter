# Example: Using GSD with a Sample Project

This directory contains a realistic example showing how to use get-shit-done workflows with Antigravity.

## Sample PRD

[**sample-prd.md**](sample-prd.md) - A complete Product Requirements Document for a task management SaaS platform.

This PRD includes:
- Executive summary and problem statement
- Target users and personas
- Detailed feature descriptions
- User flows
- Technical requirements
- Success metrics
- Constraints and assumptions

## How to Use This Example

### Step 1: Read the PRD
Open `sample-prd.md` and familiarize yourself with the product vision.

### Step 2: Extract Requirements
In your project directory, tell Antigravity:

```
Prompt:
"I have the PRD at examples/sample-prd.md. Use @[define-requirements.md] 
to extract structured requirements from it."
```

**Expected outcome:**  
Antigravity will create `.planning/REQUIREMENTS.md` with ~40-50 structured requirements organized by category (Authentication, Task Management, Collaboration, etc.)

### Step 3: Create Project Brief
```
Prompt:
"Create the project brief /discovery-phase"
```

**Expected outcome:**  
`.planning/PROJECT.md` documenting tech stack, constraints, and key decisions.

### Step 4: Build Roadmap
```
Prompt:
"Build a roadmap /create-roadmap"
```

**Expected outcome:**  
`.planning/ROADMAP.md` with ~5-7 phases:
- Phase 1: Foundation (auth, db, API setup)
- Phase 2: Core Task Management
- Phase 3: Collaboration Features
- Phase 4: AI-Powered Insights
- Phase 5: Integrations
- Phase 6: Mobile Experience
- Phase 7: Polish & Launch

### Step 5: Plan Phase 1
```
Prompt:
"Plan Phase 1 /plan-phase"
```

**Expected outcome:**  
`.planning/phases/01-foundation/plans/` with 3-5 execution plans covering setup, database, authentication scaffolding.

### Step 6: Execute First Plan
```
Prompt:
"Execute plan 01 /execute-plan"
```

**Expected outcome:**  
Antigravity implements the plan, runs tests, commits code.

## Expected Directory Structure After Running Workflows

```
task-management-saas/
├── src/
│   ├── app/                 # Next.js app directory
│   ├── components/          # React components
│   ├── lib/                 # Utilities
│   └── server/              # Backend API
├── tests/
│   ├── unit/
│   └── integration/
├── .planning/
│   ├── PROJECT.md           # Project brief
│   ├── REQUIREMENTS.md      # 40-50 requirements
│   ├── ROADMAP.md           # 6-7 phases
│   ├── STATE.md             # Progress tracking
│   ├── config.json          # Project config
│   └── phases/
│       ├── 01-foundation/
│       │   ├── plans/
│       │   │   ├── 01-project-setup.md
│       │   │   ├── 02-database-schema.md
│       │   │   └── 03-auth-scaffold.md
│       │   └── VERIFICATION-REPORT.md
│       ├── 02-task-management/
│       └── ...
├── package.json
├── next.config.js
└── README.md
```

## Key Learnings from This Example

### Realistic Scope
The sample PRD is intentionally comprehensive but realistic for a 12-week MVP. It demonstrates how GSD helps you:
- Break large projects into phases
- Maintain focus on v1 requirements
- Explicitly defer features to v2

### Requirement Granularity
When you run `define-requirements.md`, you'll see how a 30-page PRD becomes ~50 atomic, testable requirements.

### Phase Organization
The roadmap naturally groups requirements by technical dependencies:
- Foundation must come first (auth, db)
- Core features build on foundation
- Advanced features (AI, integrations) come later
- Polish and optimization last

### Verification Gates
Each phase has clear success criteria. You can't move to Phase 2 until Phase 1 verification passes.

## Customizing for Your Project

**Using this as a template:**
1. Copy `sample-prd.md` to your project
2. Modify the business domain (task management → your domain)
3. Adjust features to match your vision
4. Run the workflows as shown above

**Starting from scratch:**
1. Write your own PRD (or just start with ideas)
2. Use `discovery-phase.md` first if you don't have a PRD
3. Let Antigravity help you extract requirements through conversation

## Success Metrics

If you follow this example end-to-end, you should achieve:

✅ Clear understanding of GSD workflow  
✅ Working project structure in `.planning/`  
✅ Confidence to apply to your own projects  
✅ 5-10 git commits documenting your progress  

## Questions?

Read [GUIDE.md](../GUIDE.md) for detailed workflow documentation, or open an issue in the repo.

---

**Happy building!** 🚀
