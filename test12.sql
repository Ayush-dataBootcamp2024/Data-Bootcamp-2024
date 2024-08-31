-- use command
use test12;

-- creating a table
create table table_1 (
id INT Primary Key,
firstname varchar(50) not null,
age int not null,
grade varchar(10) not null
);

-- inserting values into the table
insert into table_1 (id,firstname,age,grade)
values (1,"Jonny",17,"A");

select * from table_1;

insert into table_1(id,firstname,age,grade)
values 
 (2,"Mark",18,"B"),
 (3,"Jack",20,"D"),
 (4,"Liv",25,"C"),
 (5,"Hannah",15,"A");

insert into table_1
values 
(6,"Rex",30,"E");

select * from table_1;

select firstname,id from table_1;


