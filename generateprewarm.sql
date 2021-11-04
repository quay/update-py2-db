select concat('select * from ',TABLE_SCHEMA, '.', TABLE_NAME, ';')
from information_schema.TABLES
where TABLE_SCHEMA = 'quay'