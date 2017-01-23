drop table if exists use_cases;

create table if not exists use_cases(
id integer primary key not null,
name text not null,
version text,
description text,
goal text,
actors text,
stakeholders text,
course text,
extensions text,
trigger_event text,
pre_condition text,
pos_condition text,
notes text,
creation_date integer
);