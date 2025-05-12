# replication-majority-voting-szz

Replication Package for "MV-SZZ: A Majority Voting-Based SZZ Method"

## Overview of the replication package

```
.
├── dataset
│  ├── databases
│  ├── preparation
│  ├── pyszz_v2
│  └── repositories
├── docker
│  ├── cregit
│  ├── defects4j
│  ├── ghq
│  └── README.md
├── README.md
├── research_szz_cregit
│  ├── __init__.py
│  ├── models
│  └── repositories
├── scripts
│  ├── data_preparation
│  ├── discussion
│  ├── preliminary_study
│  ├── rq1
│  ├── rq2
│  └── rq3
└── tools
   ├── cregit
   └── pyszz_v2
```

- `dataset` directory is used to store datasets. It also provides access to the raw data collected in this study.
- `docker` directory is where the Dockerfile used for replication packages is located.
- `research_szz_cregit` directory is where the utility scripts created for some scripts in `scripts` directory.
- `scripts` directory is where jupyter notebooks is in place to replicate our study.
- `tools` directory contains the PySZZ and cregit archives that we have modified and used.

Please read the following instructions and the README.md located in each folder to use the replication package.

## 1. Data Preparation

See [README.md](scripts/data_preparation/data_collection/README.md).

## 2. Apply cregit to original repositories

See [README.md](scripts/data_preparation/apply_cregit/README.md).

## 3. Apply szz

See [README.md](scripts/data_preparation/apply_szz/README.md).

## 4. Conduct majority voting

See [README.md](scripts/data_preparation/conduct_majority_voting/README.md).

## 5. Data Analysis

### Preliminaly Study

Execute [notebook](scripts/preliminary_study/plot_bar.ipynb)

### RQ1

Execute [notebook](scripts/rq1/evaluate_n-token_representation.ipynb)

### RQ2

Execute [notebook](scripts/rq2/evaluate_mv-szz.ipynb)

### RQ3

Execute [notebook](scripts/rq3/evaluate_mv_szz_vs_existing_methods.ipynb)

### Discussion

Execute [notebook](scripts/discussion/evaluate_mv-szz_select_vs_exclude.ipynb)

## License

This Replication Package, including the modified cregit tool and associated scripts, is licensed under the GNU General Public License Version 3 (GPLv3). A copy of the GPLv3 license can be found in the file named `LICENSE` in the root directory of this package.

The original cregit tool, on which our modified version is based, is also licensed under the GPLv3. For details on the original cregit, please refer to [here](https://github.com/cregit/cregit).
