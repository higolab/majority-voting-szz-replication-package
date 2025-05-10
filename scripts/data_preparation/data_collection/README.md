# Data Collection

## 1.Collect Developer-informed oracle dataset

### 1-1. Build Docker image for ghq

We use ghq to clone repositories.
Before following steps, you need to read [README.md](../../../docker/README.md#ghq) and build the Docker image for ghq.

### 1-2. Generate repository list for ghq

Generate a file with only the repository name for ghq.

```bash
cd scripts/data_preparation/data_collection/developer-informed-oracle
bash generate_repository_list.sh ../../../../dataset/preparation/analyzed_developer-informed-oracle_projects.csv
```

### 1-3. Clone repositories with ghq

Clone repositories.

```bash
cd scripts/data_preparation/data_collection/developer-informed-oracle
docker compose up
```

## 2.

### 2-1. Build Docker image for defects4j

We extract data from Defects4J.
Before following steps, you need to read [README.md](../../../docker/README.md#defects4j) and build the Docker image for defects4j.

### 2-2. Clone Defects4J and target repositories

```bash
cd scripts/data_preparation/data_collection/defects4j
docker compose up
```

Optional:
If needed, register safe Git directories:

```bash
cd scripts/data_preparation/data_collection/defects4j
bash register_safe_directories.sh
```

### 2-3. Execution JSON creation notebook

Open and Execute the notebook:

- [create_json_for_szz.ipynb](./defects4j/create_json_for_szz.ipynb)

After successful execution, [this file](../../../dataset/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json) will be created:
