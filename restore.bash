#! /bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

echo 'Restoring...' >&2
pretty-exec -- rm -rf work
