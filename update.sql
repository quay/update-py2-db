SET unique_checks=0;
SET foreign_key_checks=0;

alter table quay.manifest
  add column config_media_type char,
  add column layers_compressed_size bigint;

create index manifestblob_repository_id_blob_id
   on quay.manifestblob (repository_id, blob_id);


create table quay.uploadedblob
(
   id  bigint auto_increment primary key,
   repository_id int      not null,
   blob_id       int      not null,
   uploaded_at   datetime not null,
   expires_at    datetime not null,
   constraint fk_uploadedblob_blob_id_imagestorage
       foreign key (blob_id) references quay.imagestorage (id),
   constraint fk_uploadedblob_repository_id_repository
       foreign key (repository_id) references quay.repository (id)
);

create index uploadedblob_blob_id
   on quay.uploadedblob (blob_id);

create index uploadedblob_expires_at
   on quay.uploadedblob (expires_at);

create index uploadedblob_repository_id
   on quay.uploadedblob (repository_id);

SET unique_checks=1;
SET foreign_key_checks=1;

show create table quay.uploadedblob;
show create table quay.manifest;
show create table quay.manifestblob;
