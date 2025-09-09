#!/bin/bash

set -e

# default setting
scale=1

partition_interval="1 year"

ssb_database_name=""

enum_table_name=lineorder_flat

#access_method="mars3"

function show_help()
{
    cat << EOF
Generate fat table with dataset in given scale.

Args:
   -h
      Show help message.
   
   -D [custom_database_name]
      Specify custom database name to generate a flatten table.

   -s [scale] 
      Required, scale of the generated dataset in gigabytes(GB), and specify this option to 
      create the flatten along with desired dataset.

   -i [partition_interval]
      Optional, default '1 year', specify custom partition interval.
   

Usage:
    Generate flat table with 1GB dataset.

        ./generate_flat_table.sh -s 1
    
    Generate flat table with monthly partition.

        ./generate_flat_table.sh -s 1 -i '1 month'
EOF
}

function parse_args()
{
    OPTIND=1
    while getopts ":h :o:D:i:m:p:e:t:c:s:a:x" opt; do
    case "$opt" in
        s) scale="$OPTARG" ;;
        i)
        partition_interval="$OPTARG";;
        D) ssb_database_name="$OPTARG";;
        h)
        show_help
        exit 0
        ;;
        \?)
        printf "%s\n" "Invalid Option! -$OPTARG" >&2
        exit 1
        ;;
        :)
        printf "%s\n" "-$OPTARG requires an argument" >&2
        exit 1
        ;;
    esac
    done
    shift "$((OPTIND - 1))"
}

parse_args $@
if [ "$scale" -gt "1000" ]; then
    echo "[WARN] You specified scale=${scale} larger than 1000GB, which is still an experimental feature."
fi

# Separated database name for given scale.
if [ -z "${ssb_database_name}" ]; then
    ssb_database_name="ssb_scale_${scale}"
fi

if [ "$( psql -Aqt -P pager=off -d postgres -c "SELECT 1 FROM pg_database WHERE datname='${ssb_database_name}'" )" = '1' ]
then
    echo ""
else
    echo "[ERROR] database ${ssb_database_name} does not exist please generate and import the dataset before generate the flatten table..."
    exit 1
fi

if [ "$( psql -Aqt -P pager=off -d ${ssb_database_name} -c "SELECT 1 FROM pg_class WHERE relname='${enum_table_name}'" )" = '1' ]
then
    echo "[ERROR] table [${enum_table_name}] exists in database [${ssb_database_name}], you may drop this table or use a custom database."
    echo ""
    exit 1
fi

curdir=$(pwd)
internal_dir="$curdir/generate_flat_table"

# dynamic int vs bigint against different scale=100..1000,
# using bigint for scale > 100
dynaint="int"
if [ "$scale" -gt "100" ]; then
    dynaint=bigint
fi

psql -Aqtbe -P pager=off -v ON_ERROR_STOP=ON \
                         -v tname=${enum_table_name} \
                         -v dynaint=${dynaint} \
                         -v par="'${partition_interval}'" \
                         -f ${internal_dir}/ddl.sql \
                         -d $ssb_database_name

psql -Aqtbe -P pager=off -v ON_ERROR_STOP=ON \
                         -v tname=${enum_table_name} \
                         -f ${internal_dir}/prejoin.sql \
                         -d $ssb_database_name

psql -Aqtbe -P pager=off -v ON_ERROR_STOP=ON -d $ssb_database_name \
            -c "ANALYZE ${enum_table_name}"
            

echo ""
cat << EOF
Flatten table ${enum_table_name} is successfully generated in database ${ssb_database_name}.

Now you can run SSB benchmark.

   ./ssb.sh -s ${scale} -D ${ssb_database_name}

EOF