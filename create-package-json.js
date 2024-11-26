const fs = require('fs')
const path = require('path')

const object = {
  name: 'test',
  private: true,
  version: '0.0.0',
  dependencies: {
    'is-number': '7.0.0',
  },
}

const json = JSON.stringify(object, undefined, 2) + '\n'

fs.writeFileSync(path.join(__dirname, 'work', 'package.json'), json)
