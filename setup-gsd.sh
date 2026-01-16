#!/bin/bash
#
# Get-Shit-Done Setup for Antigravity
# Adapts the ClaudeCode workflow system for use with Antigravity
#
# Usage: ./setup-gsd.sh

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

AGENT_DIR="$HOME/.agent"
GSD_DEST="$AGENT_DIR/get-shit-done"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Get-Shit-Done Setup for Antigravity${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Find get-shit-done directory (looking for workflows folder as marker)
GSD_SOURCE=""
if [ -d "./get-shit-done/get-shit-done/workflows" ]; then
    GSD_SOURCE="./get-shit-done/get-shit-done"
elif [ -d "./get-shit-done/workflows" ]; then
    GSD_SOURCE="./get-shit-done"
elif [ -d "../get-shit-done/get-shit-done/workflows" ]; then
    GSD_SOURCE="../get-shit-done/get-shit-done"
elif [ -d "../get-shit-done/workflows" ]; then
    GSD_SOURCE="../get-shit-done"
elif [ -d "$HOME/get-shit-done/get-shit-done/workflows" ]; then
    GSD_SOURCE="$HOME/get-shit-done/get-shit-done"
elif [ -d "$HOME/get-shit-done/workflows" ]; then
    GSD_SOURCE="$HOME/get-shit-done"
fi

# If not found, offer to clone it automatically
if [ -z "$GSD_SOURCE" ] || [ ! -d "$GSD_SOURCE/workflows" ]; then
    echo -e "${YELLOW}→${NC} get-shit-done repository not found locally"
    echo ""
    echo "Would you like to clone it automatically?"
    echo "Repository: https://github.com/glittercowboy/get-shit-done"
    echo ""
    read -p "Clone now? (Y/n): " CLONE_RESPONSE
    
    # Default to yes if user just presses Enter
    CLONE_RESPONSE=${CLONE_RESPONSE:-Y}
    
    if [ "$CLONE_RESPONSE" = "y" ] || [ "$CLONE_RESPONSE" = "Y" ]; then
        echo -e "${GREEN}→${NC} Cloning get-shit-done..."
        
        # Clone to parent directory
        CLONE_DIR="../get-shit-done"
        if ! git clone https://github.com/glittercowboy/get-shit-done "$CLONE_DIR" 2>/dev/null; then
            # If parent fails, try current directory
            CLONE_DIR="./get-shit-done"
            if ! git clone https://github.com/glittercowboy/get-shit-done "$CLONE_DIR" 2>/dev/null; then
                echo -e "${YELLOW}Error: Failed to clone repository${NC}"
                echo "Please ensure you have git installed and internet connection."
                exit 1
            fi
        fi
        
        # Find the workflows in cloned repo
        if [ -d "$CLONE_DIR/get-shit-done/workflows" ]; then
            GSD_SOURCE="$CLONE_DIR/get-shit-done"
        elif [ -d "$CLONE_DIR/workflows" ]; then
            GSD_SOURCE="$CLONE_DIR"
        fi
        
        echo -e "${GREEN}✓${NC} Repository cloned successfully"
    else
        echo ""
        echo -e "${YELLOW}Setup cancelled.${NC}"
        echo ""
        echo "To run setup, you need the get-shit-done repository."
        echo "Clone it manually with:"
        echo "  git clone https://github.com/glittercowboy/get-shit-done"
        exit 0
    fi
fi

# Final check
if [ -z "$GSD_SOURCE" ] || [ ! -d "$GSD_SOURCE/workflows" ]; then
    echo -e "${YELLOW}Error: Could not locate get-shit-done workflows${NC}"
    exit 1
fi

echo -e "${GREEN}→${NC} Found get-shit-done at: $GSD_SOURCE"

# Create agent directory structure
echo -e "${GREEN}→${NC} Creating directory structure..."
mkdir -p "$GSD_DEST"/{workflows,templates,references}

# Function to update paths in a file
update_paths() {
    local file="$1"
    
    # Update .claude -> .agent
    sed -i 's|~/.claude/get-shit-done|~/.agent/get-shit-done|g' "$file"
    sed -i 's|\.claude/get-shit-done|.agent/get-shit-done|g' "$file"
    
    # Note: .planning/ paths are intentionally left unchanged (project-specific)
}

# Copy and update workflows
echo -e "${GREEN}→${NC} Copying workflows..."
cp -r "$GSD_SOURCE/workflows/"* "$GSD_DEST/workflows/"

echo -e "${GREEN}→${NC} Updating workflow paths..."
for workflow in "$GSD_DEST/workflows/"*.md; do
    if [ -f "$workflow" ]; then
        update_paths "$workflow"
        echo "  ✓ $(basename "$workflow")"
    fi
done

# Copy and update templates
echo -e "${GREEN}→${NC} Copying templates..."
cp -r "$GSD_SOURCE/templates/"* "$GSD_DEST/templates/" 2>/dev/null || true

echo -e "${GREEN}→${NC} Updating template paths..."
for template in "$GSD_DEST/templates/"*.md "$GSD_DEST/templates/"*.json; do
    if [ -f "$template" ]; then
        update_paths "$template"
        echo "  ✓ $(basename "$template")"
    fi
done

# Copy template subdirectories
if [ -d "$GSD_SOURCE/templates/codebase" ]; then
    echo -e "${GREEN}→${NC} Copying template/codebase..."
    cp -r "$GSD_SOURCE/templates/codebase" "$GSD_DEST/templates/"
    for file in "$GSD_DEST/templates/codebase/"*; do
        if [ -f "$file" ]; then
            update_paths "$file"
        fi
    done
fi

if [ -d "$GSD_SOURCE/templates/research-project" ]; then
    echo -e "${GREEN}→${NC} Copying template/research-project..."
    cp -r "$GSD_SOURCE/templates/research-project" "$GSD_DEST/templates/"
    for file in "$GSD_DEST/templates/research-project/"*; do
        if [ -f "$file" ]; then
            update_paths "$file"
        fi
    done
fi

# Copy references if they exist
if [ -d "$GSD_SOURCE/references" ]; then
    echo -e "${GREEN}→${NC} Copying references..."
    cp -r "$GSD_SOURCE/references/"* "$GSD_DEST/references/" 2>/dev/null || true
fi

# Optional: Set up workflows for a specific project
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Optional: Project Setup${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Would you like to set up workflows for a specific project?"
echo "This creates .agent/workflows/ symlinks in your project directory."
echo ""
read -p "Enter project directory path (or press Enter to skip): " PROJECT_DIR

if [ -n "$PROJECT_DIR" ]; then
    # Expand ~ to home directory
    PROJECT_DIR="${PROJECT_DIR/#\~/$HOME}"
    
    # Create directory if it doesn't exist
    if [ ! -d "$PROJECT_DIR" ]; then
        echo -e "${YELLOW}Directory doesn't exist. Create it? (y/n)${NC}"
        read -p "> " CREATE_DIR
        if [ "$CREATE_DIR" = "y" ] || [ "$CREATE_DIR" = "Y" ]; then
            mkdir -p "$PROJECT_DIR"
            echo -e "${GREEN}✓${NC} Created directory: $PROJECT_DIR"
        else
            echo -e "${YELLOW}Skipped project setup${NC}"
            PROJECT_DIR=""
        fi
    fi
    
    if [ -n "$PROJECT_DIR" ] && [ -d "$PROJECT_DIR" ]; then
        echo -e "${GREEN}→${NC} Setting up workflows in: $PROJECT_DIR"
        mkdir -p "$PROJECT_DIR/.agent/workflows"
        
        # Create symlinks
        for workflow in "$GSD_DEST/workflows/"*.md; do
            workflow_name=$(basename "$workflow")
            ln -sf "$GSD_DEST/workflows/$workflow_name" "$PROJECT_DIR/.agent/workflows/$workflow_name" 2>/dev/null || true
        done
        
        echo -e "${GREEN}✓${NC} Created workflow symlinks in $PROJECT_DIR/.agent/workflows/"
    fi
else
    echo -e "${BLUE}→${NC} Skipped project setup. Workflows available globally at ~/.agent/get-shit-done/"
fi

# Create README
cat > "$GSD_DEST/README.md" << 'EOF'
# Get-Shit-Done for Antigravity

Version: 1.5.20 (adapted for Antigravity)

## Overview

Get-Shit-Done (GSD) is a comprehensive workflow system for structured project development. It guides you from initial PRD through planning, execution, verification, and deployment.

## Quick Start: PRD → Deployment

### 1. Start with Your PRD
You have a `PRD.md` file. Great! That's your starting point.

### 2. Define Requirements
Extract concrete requirements from your PRD:
```
Use workflow: define-requirements.md
```
Creates: `.planning/REQUIREMENTS.md`

### 3. Create Project Brief  
Document high-level project context:
```
Use workflow: discovery-phase.md
```
Creates: `.planning/PROJECT.md`

### 4. Create Roadmap
Break work into phases based on requirements:
```
Use workflow: create-roadmap.md
```
Creates: `.planning/ROADMAP.md` + phase directories

### 5. Plan Each Phase
For each phase in your roadmap:
```
Use workflow: plan-phase.md
```
Creates detailed execution plans

### 6. Execute Plans
Run the plans with verification:
```
Use workflow: execute-plan.md
```
Implements features with testing

### 7. Verify Work
After execution:
```
Use workflow: verify-phase.md
```
Ensures quality and completeness

### 8. Transition Between Phases
Move to next phase:
```
Use workflow: transition.md
```

## Available Workflows

### Planning
- `define-requirements.md` - Extract requirements from PRD
- `discovery-phase.md` - Create project brief
- `create-roadmap.md` - Define implementation phases
- `plan-phase.md` - Create detailed phase plans

### Execution
- `execute-plan.md` - Run implementation plans
- `execute-phase.md` - Execute entire phase

### Verification
- `verify-work.md` - Verify completed work
- `verify-phase.md` - Comprehensive phase verification

### Milestone Management
- `create-milestone.md` - Define project milestone
- `complete-milestone.md` - Finish and document milestone
- `discuss-milestone.md` - Review milestone scope

### Research & Discovery
- `research-phase.md` - Investigate unknowns
- `research-project.md` - Project-level research
- `map-codebase.md` - Understand existing code

### Debugging
- `debug.md` - Systematic debugging workflow
- `diagnose-issues.md` - Issue investigation

### Project Management
- `resume-project.md` - Continue after interruption
- `transition.md` - Move between phases
- `discuss-phase.md` - Phase planning discussion

## Directory Structure

```
~/.agent/get-shit-done/
├── workflows/          # All workflow definitions
├── templates/          # Templates for artifacts
├── references/         # Reference documentation
└── README.md           # This file

<project>/.planning/
├── PROJECT.md          # Project brief
├── REQUIREMENTS.md     # All requirements
├── ROADMAP.md          # Phase breakdown
├── STATE.md            # Current progress
└── phases/
    ├── 01-foundation/
    │   └── plans/      # Execution plans
    ├── 02-features/
    └── ...
```

## Configuration

Project-level config at `.planning/config.json`:

```json
{
  "mode": "interactive",     // yolo | interactive | custom
  "depth": "standard",        // quick | standard | comprehensive
  "parallelization": {
    "enabled": true,
    "plan_level": true
  }
}
```

## Integration with Antigravity

Workflows are available in your project's `.agent/workflows/` directory. Reference them when asking Antigravity for help:

**Example:**
> "I have a PRD.md file. Can you help me use the define-requirements workflow to extract structured requirements?"

Or simply mention the workflow file:
> "Let's use @[define-requirements.md] to create REQUIREMENTS.md from my PRD"

## Philosophy

GSD enforces:
- **Structure**: Clear phases, plans, and verification
- **Traceability**: Every requirement maps to a phase
- **Incremental delivery**: Each phase delivers working value
- **Quality gates**: Verification before moving forward
- **Git integration**: Commits track progress

## Support

For detailed workflow instructions, view the individual workflow files in `~/.agent/get-shit-done/workflows/`

Each workflow contains:
- Purpose and context
- Required reading
- Step-by-step process
- Success criteria
EOF

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✓ Get-Shit-Done successfully installed!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Installation location: $GSD_DEST"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Read: $GSD_DEST/README.md"
echo "  2. Start with your PRD.md"
echo "  3. Use workflows to structure your project"
echo ""
echo -e "${YELLOW}Example workflow:${NC}"
echo "  PRD → define-requirements → discovery-phase → create-roadmap → plan-phase → execute"
echo ""
