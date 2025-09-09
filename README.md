SSB Benchmark for Cloudberry
---

# Quick Start

## 1. Clone the repository
```
git clone https://github.com/HashDataFE/SSB-Toolkit.git
cd SSB-Toolkit
```

## 2. Run the benchmark
```
./run.sh $scale
```

## A simple example using 100GB dataset
```
scale=100
./run.sh $scale
```

# Step by Step 
*NOTE. you may checkout detail help message via `-h`, eg. `./generate_data.sh -h`*

## Step 1. generate dataset

```
./generate_data.sh -s 1
```


## Step 2. import dataset 

```
./import_data.sh -s 1
```


## Step 3. generate a flatten table

```
./generate_flat_table.sh -s 1
```

## Step 4. run SSB benchmark

```
./ssb.sh -s 1
```

## A simple example using 100GB dataset
```
scale=100
./generate_data.sh -s $scale
./import_data.sh -s $scale
./generate_flat_table.sh -s $scale
./ssb.sh -s $scale
```
