select count(distinct id) from manifest;

select * from information_schema.COLUMNS
where TABLE_SCHEMA = 'quay'
and TABLE_NAME = 'manifest';

SHOW INDEX FROM uploadedblob;
SHOW INDEX FROM manifest;
SHOW INDEX FROM manifestblob;
