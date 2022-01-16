PRAGMA foreign_keys=true;

create table user (
  user_id interger primary key,
  user_id_const integer,
  auth_method text,
  user_name text
);

create table todo (
  todo_id integer primary key,
  user_id integer,
  created_at text default CURRENT_TIMESTAMP,
  updated_at text default CURRENT_TIMESTAMP,
  term text,
  title text,
  done int,
  detail text,
  foreign key (user_id) references user(user_id)
);

create table history (
  history_id interger primary key,
  is_finish int,
  finished_at text default CURRENT_TIMESTAMP,
  todo_id integer,
  user_id integer,
  created_at text default CURRENT_TIMESTAMP,
  updated_at text default CURRENT_TIMESTAMP,
  term text,
  title text,
  done int,
  detail text,
  foreign key (user_id) references user(user_id)
);