SET unique_checks=0;
SET foreign_key_checks=0;

alter table manifest
  add column config_media_type char,
  add column layers_compressed_size bigint;

create index manifestblob_repository_id_blob_id
   on manifestblob (repository_id, blob_id);


create table uploadedblob
(
   id  bigint auto_increment primary key,
   repository_id int      not null,
   blob_id       int      not null,
   uploaded_at   datetime not null,
   expires_at    datetime not null,
   constraint fk_uploadedblob_blob_id_imagestorage
       foreign key (blob_id) references imagestorage (id),
   constraint fk_uploadedblob_repository_id_repository
       foreign key (repository_id) references repository (id)
);

create index uploadedblob_blob_id
   on uploadedblob (blob_id);

create index uploadedblob_expires_at
   on uploadedblob (expires_at);

create index uploadedblob_repository_id
   on uploadedblob (repository_id);

SET unique_checks=1;
SET foreign_key_checks=1;

show create table uploadedblob;
show create table manifest;
show create table manifestblob;
