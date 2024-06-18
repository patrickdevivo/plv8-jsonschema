declare var plv8: any

export function validate(validator_name: string, document: any): boolean {
  return plv8.validators[validator_name](document)
}
