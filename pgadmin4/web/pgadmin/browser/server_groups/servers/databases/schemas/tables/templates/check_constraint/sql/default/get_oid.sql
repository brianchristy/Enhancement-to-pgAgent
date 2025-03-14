SELECT
    oid, conname as name,
    NOT convalidated as convalidated
FROM
    pg_catalog.pg_constraint
WHERE
    conrelid = {{tid}}::oid
    AND conname={{ name|qtLiteral(conn) }};
