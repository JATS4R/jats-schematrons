const validator = require('schematron-runner')

module.exports = name => validator.validate(
  `${__dirname}/../testfiles/${name}`,
  `${__dirname}/../schematrons/1.0/jats4r.sch`)
