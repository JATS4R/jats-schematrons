const fs = require('fs')
const libxml = require('libxmljs')
const validator = require('schematron-runner')

// process.env.XML_DEBUG_CATALOG = true
// process.env.XML_CATALOG_FILES = require.resolve('@jats4r/dtds/schema/catalog.xml')

module.exports = name => {
  const xml = fs.readFileSync(`${__dirname}/../testfiles/${name}`, 'utf8')

  const doc = libxml.parseXmlString(xml, {
    dtdattr: true,
    dtdload: true,
    dtdvalid: true,
    nonet: true,
  })

  if (doc.errors.length) {
    throw new Error(doc.errors.map(error => error.message).join('\n'))
  }

  return validator.validate(
    doc.toString(),
    `${__dirname}/../schematrons/1.0/jats4r.sch`
  )
}
