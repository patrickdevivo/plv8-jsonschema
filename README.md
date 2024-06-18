# `plv8-jsonschema`

This project bundles the [JSON Schema](http://json-schema.org/) validator [`Ajv`](https://github.com/ajv-validator/ajv) using [`plv8ify`](https://github.com/divyenduz/plv8ify) for use in PostgreSQL with [`PLV8`](https://plv8.github.io/).

It's similar to the [`pg_jsonschema` extension](https://github.com/supabase/pg_jsonschema) in functionality, but is **not** a Postgres extension.
Instead, it uses the PLV8 extension (which is already available on many managed database providers) to provide JSON schema validation functions.

## Installation

Run the SQL files in the `dist/` directory to add the JSON schema functions to your PostgreSQL database.
You'll need to have `PLV8` installed on your database first.

## Usage

Start by calling `set_validator`, which creates a reusable, named JSON schema validator that can be used with `validate`.

```sql
SELECT set_validator('my_validator', '{"type": "object", "properties": {"name": {"type": "string"}}, "required": ["name"]}');
```

```sql
SELECT validate('my_validator', '{"name": "Patrick"}'); -- TRUE
SELECT validate('my_validator', '{"_name": "Patrick"}'); -- FALSE
```

You can overwrite a validator by calling `set_validator` with the same name.
