# `plv8-jsonschema`

This project bundles the [JSON Schema](http://json-schema.org/) validator [`Ajv`](https://github.com/ajv-validator/ajv) using [`plv8ify`](https://github.com/divyenduz/plv8ify) for use in PostgreSQL with [`PLV8`](https://plv8.github.io/).

It's similar to the [`pg_jsonschema` extension](https://github.com/supabase/pg_jsonschema), but uses the JavaScript Ajv library executed with PLV8 instead.

## Installation

Execute the SQL files in the `dist/` directory to add the jsonschema functions to your PostgreSQL database.

You'll need to have `PLV8` installed on your Postgres database first.

## Usage

`set_validator` creates a reusable, named JSON schema validator that can be used with `validate`.

```sql
SELECT set_validator('my_validator', '{"type": "object", "properties": {"name": {"type": "string"}}, "required": ["name"]}');
```

```sql
SELECT validate('my_validator', '{"name": "Patrick"}'); -- TRUE
SELECT validate('my_validator', '{"_name": "Patrick"}'); -- FALSE
```
