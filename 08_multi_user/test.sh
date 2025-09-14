#!/bin/bash

set -e

PWD=$(get_pwd ${BASH_SOURCE[0]})

session_id=${1}

step="testing_${session_id}"

init_log ${step}

sql_dir=${PWD}/${session_id}

tuples="0"
for i in ${sql_dir}/*.sql; do
	start_log
	id=${i}
	schema_name=${session_id}
	table_name=$(basename ${i} | awk -F '.' '{print $3}')
	echo $table_name
	#table_name= $(basename ${i} | awk -F '.' '{print $3}')

	if [ "${EXPLAIN_ANALYZE}" == "false" ]; then
		log_time "psql ${PSQL_OPTIONS} -v ON_ERROR_STOP=1 -A -q -t -P pager=off -v DB_SCHEMA_NAME=\"${DB_SCHEMA_NAME}\" -v EXPLAIN_ANALYZE="" -f ${i} | wc -l"
		tuples=$(psql ${PSQL_OPTIONS} -v ON_ERROR_STOP=1 -A -q -t -P pager=off -v DB_SCHEMA_NAME="${DB_SCHEMA_NAME}" -v EXPLAIN_ANALYZE="" -f ${i} | wc -l; exit ${PIPESTATUS[0]})
		tuples=$((tuples - 1))
	else
		myfilename=$(basename ${i})
		mylogfile="${SSB_DIR}/log/${session_id}.${myfilename}.multi.explain_analyze.log"
		log_time "psql ${PSQL_OPTIONS} -v ON_ERROR_STOP=1 -A -e -q -t -P pager=off -v DB_SCHEMA_NAME=\"${DB_SCHEMA_NAME}\" -v EXPLAIN_ANALYZE=\"EXPLAIN ANALYZE\" -f ${i}"
		psql ${PSQL_OPTIONS} -v ON_ERROR_STOP=1 -A -e -q -t -P pager=off -v DB_SCHEMA_NAME="${DB_SCHEMA_NAME}" -v EXPLAIN_ANALYZE="EXPLAIN ANALYZE" -f ${i} > ${mylogfile}
		tuples="0"
	fi
		
	#remove the extra line that \timing adds
	print_log ${tuples}
done

end_step ${step}
