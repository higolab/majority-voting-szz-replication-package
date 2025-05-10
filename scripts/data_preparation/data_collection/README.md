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

### 2-1.

Clone defects4j and target repositories.

```bash
cd scripts/data_preparation/data_collection/defects4j
docker compose up
```

(Option if you need)

```bash
cd scripts/data_preparation/data_collection/defects4j
bash register_safe_directories.sh
```

### 2-2.

You should execute [create_json_for_szz.ipynb](./defects4j/create_json_for_szz.ipynb)
