const validate = require('./validate')

describe('authors and affiliations', () => {
  test('aff label', async () => {
    const results = await validate('auths-affs-test1.xml')

    expect(results.errors).toHaveLength(2)
    expect(results.warnings).toHaveLength(1)
  })

  test('author affiliation xref', async () => {
    const results = await validate('auths-affs-test2.xml')

    expect(results.errors).toHaveLength(1)
  })
})
