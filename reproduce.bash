#! /bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

echo 'Reproducing...' >&2
pretty-exec -- mkdir -p work
pretty-exec -- node create-package-json.js
pretty-exec -- node create-npmrc.js
pretty-exec -- run-at work pnpm add is-number@7.0.0
pretty-exec -- run-at work pnpm patch is-number
pretty-exec -- bat -pp 'work/node_modules/.pnpm_patches/is-number@7.0.0/index.js'
pretty-exec -- bash -c 'echo "// DEFENITELY EDITED" > work/node_modules/.pnpm_patches/is-number@7.0.0/index.js'
pretty-exec -- bat -pp 'work/node_modules/.pnpm_patches/is-number@7.0.0/index.js'
pretty-exec -- run-at work pnpm patch-commit "$(pwd)/work/node_modules/.pnpm_patches/is-number@7.0.0/"
pretty-exec -- bat -pp 'work/node_modules/is-number/index.js'
