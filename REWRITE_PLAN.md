# Antigravity-Native GSD Workflows Plan

## Goal
Rewrite all get-shit-done workflows for Antigravity while maintaining exact file structure.

## Structure to Keep (Identical to Original)
```
antigravity-gsd/
├── workflows/           # 20 workflow files (rewritten)
├── templates/          # Keep structure, update content
├── references/         # Keep structure, update content
└── README.md
```

## All 20 Workflows to Rewrite

### Planning & Discovery (6 workflows)
1. ✅ `define-requirements.md` - Convert PRD to requirements
2. ✅ `discovery-phase.md` - Create project brief
3. ✅ `create-roadmap.md` - Define phases
4. ⚠️  `plan-phase.md` - DEPRECATED in original, needs rewrite
5. ✅ `research-phase.md` - Investigate unknowns
6. ✅ `map-codebase.md` - Understand existing code

### Execution (2 workflows)
7. ✅ `execute-plan.md` - Run implementation plans
8. ✅ `execute-phase.md` - Execute entire phase

### Verification (2 workflows)
9. ✅ `verify-work.md` - Verify completed work
10. ✅ `verify-phase.md` - Comprehensive phase verification

### Milestones (3 workflows)
11. ✅ `create-milestone.md` - Define milestone
12. ✅ `complete-milestone.md` - Finish milestone
13. ✅ `discuss-milestone.md` - Review milestone scope

### Debugging (2 workflows)
14. ✅ `debug.md` - Systematic debugging
15. ✅ `diagnose-issues.md` - Issue investigation

### Research (1 workflow)
16. ✅ `research-project.md` - Project-level research

### Management (4 workflows)
17. ✅ `resume-project.md` - Continue after interruption
18. ✅ `transition.md` - Move between phases
19. ✅ `discuss-phase.md` - Phase planning discussion
20. ✅ `list-phase-assumptions.md` - Review assumptions

## Changes to Make in Each File

### Remove:
- ❌ All `:gsd` command references (Antigravity doesn't have these)
- ❌ "ClaudeCode" mentions → change to "Antigravity"
- ❌ Deprecated warnings
- ❌ References to Claude-specific features

### Add:
- ✅ Antigravity-specific tips (`/clear` for context management)
- ✅ Use `@filename.ext` for file references
- ✅ Antigravity's natural code execution
- ✅ Better "next steps" specific to Antigravity workflow

### Keep:
- ✅ Same file structure (`<purpose>`, `<required_reading>`, etc.)
- ✅ Same workflow philosophy
- ✅ Same `.planning/` directory structure
- ✅ Same success criteria approach

## Implementation Plan

### Phase 1: Create Custom Workflow Repository
1. Create `/home/zero/VSC/Arxis/antigravity-gsd/` directory
2. Copy structure from original GSD
3. Rewrite workflows one by one (Antigravity-native)

### Phase 2: Update Setup Script
1. Remove `git clone` of original repo
2. Install from our custom workflows directly
3. Simpler, faster installation

### Phase 3: Testing
1. Test each workflow with actual Antigravity
2. Verify @ file references work
3. Ensure all paths are correct

### Phase 4: Documentation
1. Update README with Antigravity examples
2. Create GUIDE specific to Antigravity
3. Add tips throughout

## Priority Order for Rewriting

**High Priority (core workflow):**
1. `define-requirements.md`
2. `create-roadmap.md`
3. `execute-phase.md`
4. `verify-phase.md`
5. `resume-project.md`

**Medium Priority:**
6. `plan-phase.md` (remove deprecated warning)
7. `execute-plan.md`
8. `debug.md`
9. `transition.md`

**Lower Priority:**
10-20. The rest (milestones, research, etc.)

## Next Steps
1. Create directory structure
2. Start with `define-requirements.md` rewrite
3. Test it live
4. Iterate on others
