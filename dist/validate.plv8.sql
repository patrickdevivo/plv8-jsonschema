DROP FUNCTION IF EXISTS validate(validator_name text,document JSONB);
CREATE OR REPLACE FUNCTION validate(validator_name text,document JSONB) RETURNS boolean AS $plv8ify$
// validate.ts
function validate(validator_name, document) {
  return plv8.validators[validator_name](document);
}


return validate(validator_name,document)

$plv8ify$ LANGUAGE plv8 IMMUTABLE STRICT;