#!/bin/bash

set -e

./generate_data.sh -s $1
./import_data.sh -s $1
./generate_flat_table.sh -s $1
./ssb.sh -s $1
