# Apply cregit to repositories

## 0. Clone tool

We have modified cregit to convert n-token representation.
You can clone the following command:

```bash
cd ../../../tools
unzip cregit.zip
```

## 1. Build Docker image for cregit

Before following steps, you need to read [README.md](../../../docker/README.md#cregit) and build the Docker image for cregit.

## 2. Create cregit container

Create container with docker compose.

```bash
docker compose up -d
```

Enter container.

```bash
docker exec -it cregit /bin/bash
```

## 3. Run scripts

These commands are executed inside a Docker container.
Create N-token representation

### 3-1. Developer-informed-oracle

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/developer-informed-oracle
bash run_cregit_1token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/developer-informed-oracle
bash run_cregit_2token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/developer-informed-oracle
bash run_cregit_3token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/developer-informed-oracle
bash run_cregit_4token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/developer-informed-oracle
bash run_cregit_5token.sh
```

### 3-2. Defects4j

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/defects4j
bash run_cregit_1token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/defects4j
bash run_cregit_2token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/defects4j
bash run_cregit_3token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/defects4j
bash run_cregit_4token.sh
```

```bash
cd /workspaces/scripts/data-preparation/apply_cregit/defects4j
bash run_cregit_5token.sh
```

## 4. Execution JSON Creation Notebook

Open and Execute the notebook:

- [Defects4j](./defects4j/create_json_for_szz.ipynb)

- [Developer-informed-oracle](./developer-informed-oracle/create_json_for_szz.ipynb)
