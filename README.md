# Get-Shit-Done for Antigravity

> **A powerful workflow system for structured project development with Google's Antigravity AI assistant**

Turn your PRDs into shipped products through structured planning, execution, and verification. This adapter brings the battle-tested [get-shit-done](https://github.com/glittercowboy/get-shit-done) workflow system to Antigravity.

---

## 🎯 What Is This?

Get-Shit-Done (GSD) is a comprehensive workflow system originally built for Claude Code. This adapter makes it work seamlessly with **Antigravity**.

**What you get:**
- 📋 **20 production-ready workflows** for project planning, execution, and verification
- 🗺️ **Structured roadmapping** that breaks projects into manageable phases
- ✅ **Quality gates** ensuring you ship working software
- 📊 **Progress tracking** with git-based history
- 🎓 **Comprehensive guide** from PRD to deployment

**Perfect for:**
- Solo developers building new projects
- Teams wanting structure without bureaucracy
- Anyone with a PRD who wants to ship faster
- Devs tired of scope creep and forgotten requirements

---

## ⚡ Quick Start

### Prerequisites

- [Antigravity](https://deepmind.google/technologies/antigravity/) AI assistant
- Git installed
- A project you want to build (or just an idea!)

### Installation

**Super simple - 3 commands:**

```bash
git clone https://github.com/sinanshamsudheen/antigravity-gsd-adapter
cd antigravity-gsd-adapter
./setup-gsd.sh ~/path/to/your/project
```

**That's it!** 🎉 

What it does:
- ✅ Copies all 20 workflows to `your-project/.agent/workflows/`
- ✅ Copies templates and references
- ✅ **No external cloning** - everything is included
- ✅ **No symlinks** - plain file copies
- ✅ **No global installation** - per-project setup

**Why this approach?**
- Antigravity's `@[filename]` autocomplete only shows files from **current workspace**
- Installing to `.agent/` in your project makes workflows instantly accessible
- Each project can have its own version - no conflicts

You'll see:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✓ Get-Shit-Done successfully installed!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Installation location: /home/you/.agent/get-shit-done
Version: 1.5.20
```

---

## 📚 How to Use

### The Complete Workflow: PRD → Shipped Product

```
PRD.md
  ↓ 1. Extract Requirements
.planning/REQUIREMENTS.md
  ↓ 2. Create Project Brief
.planning/PROJECT.md
  ↓ 3. Build Roadmap
.planning/ROADMAP.md + phases/
  ↓ 4. Plan Phase
.planning/phases/01-xxx/plans/
  ↓ 5. Execute Plans
Working code + tests
  ↓ 6. Verify Phase
Quality gates passed ✓
  ↓ 7. Transition
Repeat for next phase
  ↓ 8. Deploy
🚀 Ship it!
```


**1. Start with a PRD (or just an idea)**

```
Prompt to Antigravity:
"I have a PRD for a task management app. @[define-requirements.md]"
```

**2. Let Antigravity guide you through the workflows**

**Two ways to access workflows:**

**Method 1: @ syntax (works for ALL workflows):**
```
@[define-requirements.md]
@[discovery-phase.md] 
@[create-roadmap.md]
```

**Method 2: Slash commands (some workflows):**
```
/create-roadmap
/execute-phase
```

> 💡 **Tip:** Use @[workflow-name.md] for reliable access to all 20 workflows!
```

**3. Watch your project take shape**

```
my-app/
├── src/                # Your code (actually working!)
├── tests/              # Your tests (actually passing!)
└── .planning/          # Your structure
    ├── PROJECT.md
    ├── REQUIREMENTS.md
    ├── ROADMAP.md
    └── phases/
        ├── 01-foundation/
        └── 02-features/
```

---

## 📖 Complete Guide

Read **[GUIDE.md](GUIDE.md)** for:
- Detailed walkthrough of all 20 workflows
- Step-by-step examples
- Configuration options
- Pro tips and best practices
- Common questions answered

---

## 🛠️ Available Workflows

### Planning & Discovery
- `define-requirements.md` - Convert PRD into structured, testable requirements
- `discovery-phase.md` - Create project brief and document context
- `create-roadmap.md` - Break project into coherent phases
- `plan-phase.md` - Create detailed execution plans
- `research-phase.md` - Investigate unknowns before coding
- `map-codebase.md` - Understand existing code structure

### Execution
- `execute-plan.md` - Implement individual plans with testing
- `execute-phase.md` - Run entire phase from start to finish

### Verification & Quality
- `verify-work.md` - Verify completed work meets requirements
- `verify-phase.md` - Comprehensive phase quality gates

### Milestone Management
- `create-milestone.md` - Define project milestone (v1.0, v2.0, etc.)
- `complete-milestone.md` - Finish milestone and create release
- `discuss-milestone.md` - Review and adjust milestone scope

### Debugging & Troubleshooting
- `debug.md` - Systematic debugging workflow
- `diagnose-issues.md` - Investigate and root-cause issues

### Project Management
- `resume-project.md` - Continue after interruption (reads state)
- `transition.md` - Move between phases (updates tracking)
- `discuss-phase.md` - Gather context before planning
- `list-phase-assumptions.md` - Review phase assumptions

---

## 🎯 Real-World Example

See **[examples/sample-project/](examples/sample-project/)** for a complete example showing:
- Initial PRD
- Generated requirements
- Full roadmap
- Phase plans
- Final project structure

---

## ⚙️ Configuration

After installation, you can customize behavior:

**Global config:** `~/.agent/get-shit-done/templates/config.json`  
**Project config:** `<your-project>/.planning/config.json`

```json
{
  "mode": "interactive",        // "yolo" for auto-proceed
  "depth": "standard",          // "quick" or "comprehensive"
  "parallelization": {
    "enabled": true,
    "plan_level": true
  }
}
```

**Depth levels:**
- `quick` - 3-5 phases, high-level planning (fast iteration)
- `standard` - 5-8 phases, balanced detail (recommended)
- `comprehensive` - 8-12 phases, thorough planning (complex projects)

---

## 💡 Why Use This?

### Before GSD
❌ "Let's just start coding and see what happens"  
❌ Forgotten requirements  
❌ Scope creep  
❌ No clear progress tracking  
❌ "Where did we leave off?"  

### After GSD
✅ Clear roadmap with defined phases  
✅ Every requirement tracked and implemented  
✅ Quality gates prevent shipping broken code  
✅ Git history shows your journey  
✅ STATE.md tells you exactly where you are  

### The GSD Philosophy

**Structure without bureaucracy:**
- No time estimates or Gantt charts
- No resource allocation spreadsheets
- No risk matrices or status reports
- Just: Requirements → Phases → Plans → Code → Verification → Ship

**Incremental delivery:**
- Each phase delivers working value
- You can ship after any phase
- No "big bang" releases

**Quality built-in:**
- Verification before moving forward
- Success criteria defined upfront
- Tests are part of execution, not afterthought

---

## 🙏 Credits

**Original System:** [get-shit-done](https://github.com/glittercowboy/get-shit-done) by [@glittercowboy](https://github.com/glittercowboy)

This adapter simply makes the brilliant GSD workflow system work with Antigravity by updating path references and adding integration guides. All credit for the workflow design and templates goes to the original author.

**Adapter Created By:** [sinanshamsudheen](https://github.com/sinanshamsudheen)

---

## 🤝 Contributing

Found an issue or want to improve the adapter?

1. Fork this repo
2. Create a feature branch
3. Make your changes
4. Submit a pull request

**Please note:** For issues with the core workflow system (not Antigravity-specific), please report them to the [original get-shit-done repo](https://github.com/glittercowboy/get-shit-done).

---

## 📄 License

This adapter is released under the **MIT License**.

The original get-shit-done workflows and templates are copyright their original author. This adapter only modifies path references for Antigravity compatibility.

---

## 🚀 Ready to Get Shit Done?

1. ✅ Install (3 commands above)
2. ✅ Read [GUIDE.md](GUIDE.md)
3. ✅ Start with your PRD
4. ✅ Ship working software

**Questions?** Open an issue or check the [discussion board](../../discussions).

**Enjoying GSD?** Give this repo a ⭐ and share it with your dev friends!

---

## 📞 Support

- **Installation issues:** Open an issue here
- **Workflow questions:** Read [GUIDE.md](GUIDE.md) first
- **Core GSD issues:** Report to [original repo](https://github.com/glittercowboy/get-shit-done)
- **Antigravity questions:** Check [Antigravity docs](https://deepmind.google/technologies/antigravity/)

---

**Built with ❤️ for the Antigravity community**
