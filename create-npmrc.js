const fs = require('fs')
const path = require('path')

const config = [
  `store-dir=${path.join(__dirname, 'pnpm-store')}`,
  `cacge-dir=${path.join(__dirname, 'pnpm-cache')}`,
  'ignore-scripts=true',
  'reporter=append-only',
  'manage-package-manager-versions=true',
  'node-version=22.9.0',
].join('\n') + '\n'

fs.writeFileSync(path.join(__dirname, 'work', '.npmrc'), config)
