#!/usr/bin/env bash

# Synopsis:
# Run the test runner on a solution.

# Arguments:
# $1: exercise slug
# $2: absolute path to solution folder
# $3: absolute path to output directory

# Output:
# Writes the test results to a results.json file in the passed-in output directory.
# The test results are formatted according to the specifications at https://github.com/exercism/docs/blob/main/building/tooling/test-runners/interface.md

# Example:
# ./bin/run.sh two-fer /absolute/path/to/two-fer/solution/folder/ /absolute/path/to/output/directory/

# If any required arguments is missing, print the usage and exit
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "usage: ./bin/run.sh exercise-slug /absolute/path/to/two-fer/solution/folder/ /absolute/path/to/output/directory/"
    exit 1
fi

slug="$1"
input_dir="${2%/}"
output_dir="${3%/}"
exercise="${slug//-/_}"
results_file="${output_dir}/results.json"
build_log_file="${output_dir}/build.log"

mkdir -p "${output_dir}"

echo "${slug}: testing..."

output_json="${output_dir}/output.json"

#dart test --run-skipped --concurrency=4 --file-reporter "json:${output_json}"
 ./bin/testrun "${output_json}"
exit_code=$?

echo "${slug}: done"

pushd "${input_dir}" > /dev/null || exit