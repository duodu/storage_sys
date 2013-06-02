TRUNCATE table storage.statuses;
insert into storage.statuses (id,name,created_at,updated_at) values (1,"NULL","20130602122330","20130602122330");
insert into storage.statuses (id,name,created_at,updated_at) values (2,"NOT NULL","20130602122330","20130602122330");
TRUNCATE table storage.competences;
insert into storage.competences (id,name,ostatus_id,nstatus_id,created_at,updated_at) values (1,"add",1,2,"20130602122330","20130602122330");
insert into storage.competences (id,name,ostatus_id,nstatus_id,created_at,updated_at) values (2,"delete",2,1,"20130602122330","20130602122330");
truncate table storage.users;
truncate table storage.cagos;