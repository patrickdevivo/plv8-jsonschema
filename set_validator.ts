declare var plv8: any

export function set_validator(name: string, schema: any): void {
  const Ajv = require("ajv")
  const ajv = new Ajv()
  if (!plv8.validators) plv8.validators = {}
  plv8.validators[name] = ajv.compile(schema)
}
