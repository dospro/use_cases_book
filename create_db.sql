drop table if exists use_cases;
drop table if exists actors;
drop table if exists use_case_actors;
drop table if exists stakeholders;
drop table if exists use_case_steps;
drop table if exists extensions;

create table if not exists use_cases(
id integer primary key not null,
name text not null,
version text,
description text,
goal text,
trigger_event text,
pre_condition text,
pos_condition text,
notes text,
creation_date integer
);

create table if not exists actors(
id integer primary key not null,
name text not null
);

create table if not exists use_case_actors(
use_case_id integer foreign key not null,
actor_id integer foreign key not null
);

create table if not exists stakeholders(
use_case_id integer foreign key not null,
stakeholder_name text not null
)

create table if not exists use_case_steps(
id integer primary key not null,
use_case_id integer foreign key not null,
step_number integer not null,
description text not null
);

create table if not exists extensions(
step_id integer foreign key not null,
extension_number integer not null,
description text not null
);