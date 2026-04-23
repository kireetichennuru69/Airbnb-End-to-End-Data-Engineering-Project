# DBT & GIT CHEATSHEET

### 1. Environment Setup (uv)
```bash
# Install uv
curl -LsSf https://astral.sh | sh            # macOS/Linux
powershell -c "irm https://astral.sh | iex" # Windows

# Virtual Environment Creation
uv venv                       # Create the .venv
source .venv/bin/activate     # Activate (macOS/Linux)
.venv\Scripts\activate        # Activate (Windows)

# Install dbt
uv pip install dbt-[adapter]  # e.g., dbt-snowflake, dbt-bigquery, dbt-postgres
```

### 2. dbt Commands

**Project Setup & Maintenance**
```bash
dbt init [project_name]       # Initialize a new project
dbt deps                      # Install packages from packages.yml
dbt debug                     # Check connection and profile configuration
dbt clean                     # Delete compiled files and packages
```

**Running & Building**
```bash
dbt run                       # Run all models
dbt run --select [model_name] # Run a specific model
dbt seed                      # Load CSVs from the data/ folder
dbt build                     # Run + Test + Snapshot + Seed in DAG order
```

**Testing & Snapshots**
```bash
dbt test                      # Run all schema and custom tests
dbt test --select [model]     # Run tests for a specific model
dbt snapshot                  # Execute Type 2 SCD snapshots
```

**Macros & Operations**
```bash
dbt list --resource-type macro                         # List all macros
dbt run-operation [macro] --args '{key: val}'          # Run a specific macro
```

**Documentation**
```bash
dbt docs generate             # Generate documentation metadata
dbt docs serve                # Start local web server for docs
```

### 3. Git Commands

**Staging & Committing**
```bash
git status                    # See changed files
git add .                     # Stage all changes
git add [file]                # Stage specific file
git commit -m "your message"  # Commit changes with a note
git commit --amend            # Edit the last commit message
```

**Branching & Workflows**
```bash
git checkout -b [branch_name] # Create and switch to new branch
git checkout [branch_name]    # Switch to existing branch
git branch -d [branch_name]   # Delete a local branch
```

**Syncing & Pushing**
```bash
git pull origin [branch]      # Pull latest changes from remote
git push origin [branch]      # Push local commits to remote
git push -u origin [branch]   # Push and link to remote (first time)
```
