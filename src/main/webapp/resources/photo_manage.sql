CREATE DATABASE photo_manage default CHARACTER SET UTF8;
show databases;
use photo_manage;

create table member(
	mno int auto_increment primary key,
	id varchar(50) not null unique,
	name varchar(50) not null,
	pwd varchar(50) not null,
	email varchar(100) not null,
	tel varchar(30) not null
);
desc member;
select * from member;

create table photo(
	pno int auto_increment primary key,
	title varchar(50) not null,
	adddate datetime default now(),
	writer int not null,
	foreign key(writer) references member(mno)
);
desc photo;
select * from photo;
