#!/bin/bash

# Define and navigate to the dataset directory
DATASET_DIR="/workspaces/dataset"
cd "$DATASET_DIR" || { echo "Dataset directory not found: $DATASET_DIR"; exit 1; }

# 1) Clone the Defects4J framework (if not already present)
if [ ! -d "defects4j" ]; then
  echo "Cloning Defects4J framework (v2.1.0)..."
  git clone -b v2.1.0 https://github.com/rjust/defects4j.git defects4j || { echo "Failed to clone Defects4J"; exit 1; }
else
  echo "Defects4J directory already exists, skipping clone."
fi

# 2) Install Perl dependencies and initialize Defects4J
cd defects4j || { echo "Cannot enter defects4j directory"; exit 1; }

echo "Installing Defects4J dependencies..."
cpanm --installdeps . || { echo "Dependency installation failed"; exit 1; }

echo "Initializing Defects4J framework..."
./init.sh || { echo "Defects4J initialization failed"; exit 1; }

# 3) Clone each project repository from the bare Defects4J repos

# Set the base directory for bare Defects4J repositories
BARE_REPO_BASE_DIR="$(pwd)/project_repos"

# Configure a separate base directory for cloned repositories to avoid mixing
CLONE_BASE_DIR="$(dirname "$(pwd)")/repositories/defects4j/github.com"

# Create the clone base directory if it doesn't already exist
mkdir -p "$CLONE_BASE_DIR"

# Mapping of repository names to their respective organizations
declare -A ORG_MAP=(
  ["commons-cli.git"]="apache"
  ["closure-compiler.git"]="google"
  ["commons-codec.git"]="apache"
  ["commons-compress.git"]="apache"
  ["gson.git"]="google"
  ["jackson-core.git"]="FasterXML"
  ["jsoup.git"]="jhy"
  ["commons-lang.git"]="apache"
  ["commons-math.git"]="apache"
  ["mockito.git"]="mockito"
  ["joda-time.git"]="JodaOrg"
)

# List of bare repository names to clone
REPOS=(
  "commons-cli.git"
  "closure-compiler.git"
  "commons-codec.git"
  "commons-compress.git"
  "gson.git"
  "jackson-core.git"
  "jsoup.git"
  "commons-lang.git"
  "commons-math.git"
  "mockito.git"
  "joda-time.git"
)

# Iterate over each project repo and clone it into an organization-specific folder
for repo in "${REPOS[@]}"; do
  ORG="${ORG_MAP[$repo]}"
  if [ -z "$ORG" ]; then
    echo "Organization not defined for: $repo, skipping."
    continue
  fi

  SRC_REPO="$BARE_REPO_BASE_DIR/$repo"
  DEST_REPO="$CLONE_BASE_DIR/$ORG/${repo%.git}"

  mkdir -p "$(dirname "$DEST_REPO")"

  if [ -d "$DEST_REPO" ]; then
    echo "Already exists: $DEST_REPO, skipping clone."
    continue
  fi

  echo "Cloning project repo: $SRC_REPO -> $DEST_REPO"
  git clone "$SRC_REPO" "$DEST_REPO" || { echo "Failed to clone $SRC_REPO"; exit 1; }
done

echo "All Defects4J project repositories have been successfully cloned."
