select * from alembic_version;

select count(distinct id) from manifest;

SHOW INDEX FROM uploadedblob;
SHOW INDEX FROM manifest;
SHOW INDEX FROM manifestblob;

select * from information_schema.COLUMNS
where TABLE_SCHEMA = 'quay'
and TABLE_NAME = 'manifest';

