create table "user"
(
  id        bigserial not null
    constraint user_pk
      primary key,
  login     varchar   not null,
  hash      varchar   not null,
  about     varchar,
  invite_id bigint    not null
);

alter table "user"
  owner to postgres;

create unique index user_login_uindex
  on "user" (login);

create unique index user_invite_id_uindex
  on "user" (invite_id);

create table token
(
  id      bigserial not null
    constraint token_pk
      primary key,
  user_id bigint    not null
    constraint token_user_id_fk
      references "user",
  value   varchar   not null
);

alter table token
  owner to postgres;

create unique index token_value_uindex
  on token (value);

create table invite
(
  id           bigserial not null
    constraint invite_pk
      primary key,
  user_id_give bigint    not null
    constraint invite_user_id_fk
      references "user",
  value        varchar
);

alter table invite
  owner to postgres;

alter table "user"
  add constraint user_invite_id_fk
    foreign key (invite_id) references invite;

create table avatar
(
  id      bigserial not null
    constraint avatar_pk
      primary key,
  user_id bigint    not null
    constraint avatar_user_id_fk
      references "user",
  path    varchar   not null
);

alter table avatar
  owner to postgres;

create table post
(
  id       bigserial not null
    constraint post_pk
      primary key,
  user_id  bigint    not null
    constraint post_user_id_fk
      references "user",
  value    varchar   not null,
  category varchar   not null
);

alter table post
  owner to postgres;

create table comment
(
  id      bigserial not null
    constraint comment_pk
      primary key,
  user_id bigint    not null
    constraint comment_user_id_fk
      references "user",
  post_id bigint    not null
    constraint comment_post_id_fk
      references post,
  date    varchar   not null,
  text    varchar   not null
);

alter table comment
  owner to postgres;

