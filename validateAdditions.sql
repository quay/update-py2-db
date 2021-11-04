

select * from information_schema.COLUMNS
where TABLE_SCHEMA = 'quay'
and TABLE_NAME = 'manifest';

SHOW INDEX FROM uploadedblob FROM quay;
SHOW INDEX FROM manifest FROM quay;
SHOW INDEX FROM manifestblob FROM quay;

