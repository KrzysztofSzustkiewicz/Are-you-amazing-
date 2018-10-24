create database amazing;

\c amazing

create table questions
(
  id      integer not null
    constraint questions_pkey
    primary key,
  message varchar
);

create table answers
(
  id          integer not null
    constraint answers_pkey
    primary key,
  answer      varchar,
  question_id integer
    constraint answers_questions_id_fk
    references questions
);

create table game_feedback
(
  id      integer not null
    constraint game_feedback_pkey
    primary key,
  message varchar
);

create table assurance_questions
(
  id       integer not null
    constraint assurance_questions_pkey
    primary key,
  question varchar
);


