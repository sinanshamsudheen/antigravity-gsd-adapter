#!/bin/bash
#
# Get-Shit-Done Setup for Antigravity
# Installs workflows directly to your project's .agent/ directory
#
# Usage: ./setup-gsd.sh [project-directory]

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script lives (the adapter repo)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Get-Shit-Done Setup for Antigravity${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if workflows exist in our repo
if [ ! -d "$SCRIPT_DIR/workflows" ] || [ ! -f "$SCRIPT_DIR/workflows/define-requirements.md" ]; then
    echo -e "${YELLOW}Error: Workflows not found in adapter repository${NC}"
    echo "Expected location: $SCRIPT_DIR/workflows/"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found 20 Antigravity-native workflows"

# Get project directory
if [ -n "$1" ]; then
    PROJECT_DIR="$1"
else
    echo ""
    echo "Enter the path to your project directory:"
    echo "(This is where we'll create .agent/workflows/)"
    echo ""
    read -p "Project directory: " PROJECT_DIR
fi

# Expand ~ to home directory
PROJECT_DIR="${PROJECT_DIR/#\~/$HOME}"

# Validate directory
if [ -z "$PROJECT_DIR" ]; then
    echo -e "${YELLOW}Error: No project directory specified${NC}"
    echo "Usage: ./setup-gsd.sh [project-directory]"
    exit 1
fi

# Create directory if it doesn't exist
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${YELLOW}Directory doesn't exist: $PROJECT_DIR${NC}"
    read -p "Create it? (y/n): " CREATE_DIR
    if [ "$CREATE_DIR" = "y" ] || [ "$CREATE_DIR" = "Y" ]; then
        mkdir -p "$PROJECT_DIR"
        echo -e "${GREEN}✓${NC} Created directory"
    else
        echo "Setup cancelled."
        exit 0
    fi
fi

echo ""
echo -e "${GREEN}→${NC} Installing to: $PROJECT_DIR"

# Create .agent directory structure
mkdir -p "$PROJECT_DIR/.agent"/{workflows,templates,references}

# Copy workflows (plain copy, no symlinks)
echo -e "${GREEN}→${NC} Copying workflows..."
cp "$SCRIPT_DIR/workflows/"*.md "$PROJECT_DIR/.agent/workflows/"
WORKFLOW_COUNT=$(ls -1 "$PROJECT_DIR/.agent/workflows/"*.md 2>/dev/null | wc -l)
echo -e "${GREEN}✓${NC} Installed $WORKFLOW_COUNT workflows"

# Copy templates
echo -e "${GREEN}→${NC} Copying templates..."
if [ -d "$SCRIPT_DIR/templates" ]; then
    cp -r "$SCRIPT_DIR/templates/"* "$PROJECT_DIR/.agent/templates/" 2>/dev/null || true
    echo -e "${GREEN}✓${NC} Installed templates"
fi

# Copy references
echo -e "${GREEN}→${NC} Copying references..."
if [ -d "$SCRIPT_DIR/references" ]; then
    cp -r "$SCRIPT_DIR/references/"* "$PROJECT_DIR/.agent/references/" 2>/dev/null || true
    echo -e "${GREEN}✓${NC} Installed references"
fi

# Create README in .agent directory
cat > "$PROJECT_DIR/.agent/README.md" << 'EOF'
# Get-Shit-Done for Antigravity

This directory contains workflows, templates, and references for structured project development.

## Usage

All workflows are accessible via Antigravity's `@[filename]` autocomplete.

**To use a workflow:**

Type `@[` and Antigravity will show available workflows.

Example: `@[define-requirements.md]`

## Available Workflows

See `workflows/` directory for all 20 workflows.

**Most common:**
- `define-requirements.md` - Extract requirements from PRD
- `create-roadmap.md` - Build phase-based roadmap
- `execute-phase.md` - Execute a project phase
- `verify-phase.md` - Verify phase completion
- `resume-project.md` - Continue after interruption

## Structure

```
.agent/
├── workflows/       # 20 workflow files
├── templates/       # Templates for planning docs
├── references/      # Reference documentation
└── README.md        # This file
```

## Next Steps

1. Create your `PRD.md` in project root
2. Use `@[define-requirements.md]` to start
3. Follow the workflow sequence

For full guide, see the adapter repository.
EOF

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  ✓ Installation Complete!${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Installed to: $PROJECT_DIR/.agent/"
echo ""
echo "Workflows: $WORKFLOW_COUNT files"
echo "Templates: ✓"
echo "References: ✓"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo "  1. Create PRD.md in $PROJECT_DIR"
echo "  2. In Antigravity, type @[ to see workflows"
echo "  3. Start with @[define-requirements.md]"
echo ""
echo -e "${YELLOW}Tip:${NC} Type @[ in Antigravity to autocomplete workflow files!"
echo ""
