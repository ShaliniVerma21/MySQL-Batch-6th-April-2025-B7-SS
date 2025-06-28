-- Single line Comment

/*
Multiline 
Comment
*/

## This is also used as single line comment

-- -------------------------------------------- Database queries ---------------------------------------

-- create a college database
create database KTHM;

-- to work on database , you need to use it first
use kthm;

-- SQL is not a case-sensitive language (Age or age will be treated as same word)

-- ---------------------------------------------- Table Queries ---------------------------------------

-- Table-1 Student(id,name,course,department,contact)
-- to execute (ctrl+enter)
create table Student(
id int primary key,    -- primary key = unique+not null
name varchar(50),
course varchar(50),
department varchar(100),
contect varchar(10)
);

-- to display table data
select * from student;

-- insert value in a table
insert into student 
values
(1,'Nikita','BSc IT','IT department','1234567899'),
(2,'Alric','Bcom','Commerce department','1234567899'),
(3,'Darren','BMS','Commerce department','1234567899'),
(4,'Siddharth','Bcom','Commerce department','1234567899'),
(5,'Aishwarya','Btech','Computer department','1234567899');










