# replication-majority-voting-szz

Replication Package for "MV-SZZ: A Majority Voting-Based SZZ Method"

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10044843.svg)](https://doi.org/10.5281/zenodo.10044843)

## Overview of the replication package

```
.
├── analyzed_projects.csv
├── data
│  ├── databases
│  ├── pyszz_v2
│  └── repositories
├── docker
│  ├── cregit
│  ├── ghq
│  └── README.md
├── README.md
├── research_szz_cregit
│  ├── __init__.py
│  ├── models
│  └── repositories
├── scripts
│  ├── cregit
│  ├── data_collection
│  ├── rq1
│  ├── rq2
│  ├── rq3
│  └── statistics
└── tools
   └── README.md
```

- `analyzed_projects.csv` contains in CSV format the list of all cloned projects at the time of this study.
  - the repository name
  - the hash of the last commit available at the time of the clone
  - the date of the latest available commit
- `data` directory is used to store datasets. It also provides access to the raw data collected in this study.
- `docker` directory is where the Dockerfile used for replication packages is located.
- `research_szz_cregit` directory is where the utility scripts created for some scripts in `scripts` directory.
- `scripts` directory is where jupyter notebooks is in place to replicate our study.
- `tools` directory contains the PySZZ archives that we have modified and used.

Please read the following instructions and the README.md located in each folder to use the replication package.

## 0. Install Python packages

This project uses poetry to manage Python packages.
You can install the package as follows.

```bash
poetry install
```

If you are not using poetry, you can also install it using pip as follows.

```bash
pip install .
```

## 1. Data Collection

See [README.md](scripts/data_collection/README.md).

## 2. Apply cregit to original repositories

See [README.md](scripts/cregit/README.md).

## 3. Dataset Statistics

See [README.md](scripts/statistics/README.md).

## 4. Apply line-level SZZ, token-level SZZ

See [README.md](tools/README.md)

## 5. Data Analysis

### RQ1

See [README.md](scripts/rq1/README.md)

### RQ2

See [README.md](scripts/rq2/README.md)

### RQ3

See [README.md](scripts/rq3/README.md)

## How to cite

```
TODO
```

## License

This software is licensed under the MIT License.
