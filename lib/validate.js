const { readFileSync } = require('fs')
const { parseXmlString } = require('libxmljs')
const { validate } = require('schematron-runner')

module.exports = name => {
  const xml = readFileSync(`${__dirname}/../testfiles/${name}`, 'utf8')

  const doc = parseXmlString(xml)

  if (doc.errors.length) {
    throw new Error(doc.errors.map(error => `ERROR: ${error.message}`).join('\n'))
  }

  return validate(doc.toString(), `${__dirname}/../schematrons/1.0/jats4r.sch`)
}
