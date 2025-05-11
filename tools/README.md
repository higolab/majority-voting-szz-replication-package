# PySZZ v2(for Preliminary study, RQ1, RQ2, RQ3, Discussion)

## 1. Clone tool

We have modified PySZZ v2 to output the line numbers mapped by SZZ.
You can clone the following command:

```bash
unzip pyszz_v2-output-line-mapping.zip
```

## 2. Apply to B-SZZ for original repository and N-token represenation

### 2.1 Developer-informed oracle

Apply to B-SZZ for original repository

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/developer-informed-oracle/dio_bic_conf_original.json

cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/developer-informed-oracle/dio_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq1/developer-informed-oracle/
cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/developer-informed-oracle/dio_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq2/developer-informed-oracle/dio_bic_conf_original.json
cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/developer-informed-oracle/dio_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/developer-informed-oracle/dio_bic_conf_original_b.json
```

---

Apply to B-SZZ for 1token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_1token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/1token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/developer-informed-oracle/dio_bic_conf_1token.json
```

---

Apply to B-SZZ for 2token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_2token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/2token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/developer-informed-oracle/dio_bic_conf_2token.json
```

---

Apply to B-SZZ for 3token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_3token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/3token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/developer-informed-oracle/dio_bic_conf_3token.json
```

---

Apply to B-SZZ for 4token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_4token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/4token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/developer-informed-oracle/dio_bic_conf_4token.json
```

---

Apply to B-SZZ for 5token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_5token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/5token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/developer-informed-oracle/dio_bic_conf_5token.json
```

### 2-2. Defects4j

Apply to B-SZZ for original repository

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/defects4j/d4j_bic_conf_original.json

cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/defects4j/d4j_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq1/defects4j/d4j_bic_conf_original.json
cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/defects4j/d4j_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq2/defects4j/d4j_bic_conf_original.json
cp $PWD/../../../data/pyszz_v2/json-output-raw/preliminary_study/defects4j/d4j_bic_conf_original.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/defects4j/d4j_bic_conf_original.json
```

---

Apply to B-SZZ for 1token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_1token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/1token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/defects4j/d4j_bic_conf_1token.json
```

---

Apply to B-SZZ for 2token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_2token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/2token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/defects4j/d4j_bic_conf_2token.json
```

---

Apply to B-SZZ for 3token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_3token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/3token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/defects4j/d4j_bic_conf_3token.json
```

---

Apply to B-SZZ for 4token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_4token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/4token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/defects4j/d4j_bic_conf_4token.json
```

---

Apply to B-SZZ for 5token representation

```bash
cd pyszz_v2-output-line-mapping
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_5token.json $PWD/../../data/pyszz_v2/conf/bszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/5token/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/output/defects4j/d4j_bic_conf_5token.json
```

## 3. Apply to AG-SZZ, MA-SZZ, L-SZZ, R-SZZ for original repository

### 3-1. Developer-informed oracle

Apply AG-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/agszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/developer-informed-oracle/dio_bic_conf_original_ag.json
```

---

Apply MA-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/maszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/developer-informed-oracle/dio_bic_conf_original_ma.json
```

---

Apply L-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/lszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/developer-informed-oracle/dio_bic_conf_original_l.json
```

---

Apply R-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/developer-informed-oracle/dio_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/rszz.yml $PWD/../../data/pyszz_v2/cloned/developer-informed-oracle/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/developer-informed-oracle/dio_bic_conf_original_r.json
```

### 3-2. Defects4j

Apply AG-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/agszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/defects4j/d4j_bic_conf_original_ag.json
```

---

Apply MA-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/maszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/defects4j/d4j_bic_conf_original_ma.json
```

---

Apply L-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/lszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/defects4j/d4j_bic_conf_original_l.json
```

---

Apply R-SZZ for original repository

```bash
bash run_docker.sh $PWD/../../data/pyszz_v2/json-input-raw/defects4j/d4j_bugfix_commits_original.json $PWD/../../data/pyszz_v2/conf/rszz.yml $PWD/../../data/pyszz_v2/cloned/defects4j/original/
```

The results are generated in `pyszz_v2/out/bic_conf_*.json`.
Change the name for clarity and move the file for evaluation.

```bash
cd out
mv bic_conf_<NUMBER>.json $PWD/../../../data/pyszz_v2/json-output-raw/rq3/defects4j/d4j_bic_conf_original_r.json
```
